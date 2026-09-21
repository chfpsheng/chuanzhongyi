<?php
/**
 * 修复「图片扩展名 与 实际格式不符」导致的缩略图生成失败
 *
 * 典型场景：文件名为 xxx.jpeg，实际内容是 WebP。
 * 米拓 thumb() 按扩展名调用 imagecreatefromjpeg() 解码，解码失败 → 缩略图生成不出来 → 列表页图片空白。
 *
 * 做法：按扩展名重新编码，原地重写文件（数据库 imgurl 无需改动），并清理对应的缩略图缓存。
 *
 * 用法：
 *   php tools/fix_imgfmt.php          # 预览
 *   php tools/fix_imgfmt.php fix      # 执行修复（原文件另存为 .bak）
 */
define('ROOT_PATH', dirname(__FILE__) . '/../');
$dbconf = parse_ini_file(ROOT_PATH . 'config/config_db.php');
$db = @new mysqli($dbconf['con_db_host'], $dbconf['con_db_id'], $dbconf['con_db_pass'], $dbconf['con_db_name'], 3306);
if ($db->connect_error) { exit("DB FAIL\n"); }
$db->set_charset('utf8');
$pre = isset($dbconf['tablepre']) ? $dbconf['tablepre'] : 'met_';
$doFix = isset($argv[1]) && $argv[1] === 'fix';

$expect = array(
    'jpg'  => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'png'  => 'image/png',
    'gif'  => 'image/gif',
    'webp' => 'image/webp',
);
$decoder = array(
    'image/webp' => 'imagecreatefromwebp',
    'image/jpeg' => 'imagecreatefromjpeg',
    'image/png'  => 'imagecreatefrompng',
    'image/gif'  => 'imagecreatefromgif',
);

$tables = array('news', 'product', 'doctor', 'activity', 'shaoer', 'img', 'column');
$bad = array();

foreach ($tables as $tb) {
    $chk = @$db->query("SHOW TABLES LIKE '{$pre}{$tb}'");
    if (!$chk || $chk->num_rows === 0) { continue; }
    $tcol = ($tb === 'column') ? 'name' : 'title';
    $icol = ($tb === 'column') ? 'columnimg' : 'imgurl';
    $r = @$db->query("SELECT id,{$tcol} AS title,{$icol} AS imgurl FROM {$pre}{$tb} WHERE {$icol}<>''");
    if (!$r) { continue; }
    while ($x = $r->fetch_assoc()) {
        $file = ROOT_PATH . str_replace('../', '', (string)$x['imgurl']);
        if (!file_exists($file)) { continue; }
        $ext  = strtolower(pathinfo($file, PATHINFO_EXTENSION));
        $info = @getimagesize($file);
        $mime = $info ? $info['mime'] : '';
        if (isset($expect[$ext]) && $expect[$ext] === $mime) { continue; }
        $bad[] = array('table' => $tb, 'id' => $x['id'], 'title' => $x['title'], 'file' => $file, 'ext' => $ext, 'mime' => $mime);
    }
}

if (!$bad) { echo "未发现格式不符的图片 ✅\n"; exit; }

echo "发现 " . count($bad) . " 张格式不符的图片：\n\n";
$fixed = 0;
foreach ($bad as $b) {
    echo sprintf("  [%s#%s] %s\n      %s（实为 %s，扩展名 .%s）\n", $b['table'], $b['id'], mb_substr($b['title'], 0, 30), str_replace(ROOT_PATH, '', $b['file']), $b['mime'], $b['ext']);
    if (!$doFix) { continue; }

    if (!isset($decoder[$b['mime']]) || !function_exists($decoder[$b['mime']])) {
        echo "      ★ 无可用解码函数，跳过\n"; continue;
    }
    $src = @call_user_func($decoder[$b['mime']], $b['file']);
    if (!$src) { echo "      ★ 解码失败，跳过\n"; continue; }

    // 备份
    @copy($b['file'], $b['file'] . '.bak');

    // 有透明通道的格式转 JPEG 时先铺白底，避免透明区变黑
    $w = imagesx($src); $h = imagesy($src);
    $canvas = imagecreatetruecolor($w, $h);
    imagefill($canvas, 0, 0, imagecolorallocate($canvas, 255, 255, 255));
    imagecopy($canvas, $src, 0, 0, 0, 0, $w, $h);
    imagedestroy($src);

    $ok = false;
    switch ($b['ext']) {
        case 'jpg': case 'jpeg': $ok = imagejpeg($canvas, $b['file'], 90); break;
        case 'png':  $ok = imagepng($canvas, $b['file']); break;
        case 'gif':  $ok = imagegif($canvas, $b['file']); break;
        case 'webp': $ok = function_exists('imagewebp') ? imagewebp($canvas, $b['file'], 90) : false; break;
    }
    imagedestroy($canvas);

    if (!$ok) { echo "      ★ 重新编码失败，已从备份恢复\n"; @copy($b['file'] . '.bak', $b['file']); continue; }

    // 清掉旧缩略图缓存，让系统按新文件重新生成
    $name = basename($b['file']);
    $tdir = ROOT_PATH . 'upload/thumb_src/';
    $del = 0;
    if (is_dir($tdir)) {
        foreach (new RecursiveIteratorIterator(new RecursiveDirectoryIterator($tdir, FilesystemIterator::SKIP_DOTS)) as $f) {
            if ($f->isFile() && $f->getFilename() === $name) { @unlink($f->getPathname()); $del++; }
        }
    }
    $info2 = @getimagesize($b['file']);
    echo sprintf("      ✅ 已修复为 %s；清理缩略图缓存 %d 个；备份 %s\n", $info2 ? $info2['mime'] : '?', $del, $name . '.bak');
    $fixed++;
}

if ($doFix) {
    echo "\n修复完成：{$fixed}/" . count($bad) . " 张\n";
} else {
    echo "\n（预览模式，未改动文件。执行修复：php tools/fix_imgfmt.php fix）\n";
}
