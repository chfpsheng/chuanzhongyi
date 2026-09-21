<?php
/**
 * 扫描全站图片：扩展名 与 实际格式 是否一致
 * 用法：php tools/imgscan.php
 */
define('ROOT_PATH', dirname(__FILE__) . '/../');
$dbconf = parse_ini_file(ROOT_PATH . 'config/config_db.php');
$db = @new mysqli($dbconf['con_db_host'], $dbconf['con_db_id'], $dbconf['con_db_pass'], $dbconf['con_db_name'], 3306);
if ($db->connect_error) { exit("DB FAIL\n"); }
$db->set_charset('utf8');
$pre = isset($dbconf['tablepre']) ? $dbconf['tablepre'] : 'met_';

$expect = array(
    'jpg'  => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'png'  => 'image/png',
    'gif'  => 'image/gif',
    'webp' => 'image/webp',
    'bmp'  => 'image/bmp',
);

$tables = array('news', 'product', 'doctor', 'activity', 'shaoer', 'img', 'column');
$bad = array();
$total = 0;

foreach ($tables as $tb) {
    $chk = @$db->query("SHOW TABLES LIKE '{$pre}{$tb}'");
    if (!$chk || $chk->num_rows === 0) { continue; }
    $tcol  = ($tb === 'column') ? 'name' : 'title';
    $icol  = ($tb === 'column') ? 'columnimg' : 'imgurl';
    $r = @$db->query("SELECT id,{$tcol} AS title,{$icol} AS imgurl FROM {$pre}{$tb} WHERE {$icol}<>''");
    if (!$r) { continue; }
    while ($x = $r->fetch_assoc()) {
        $rel = str_replace('../', '', (string)$x['imgurl']);
        $file = ROOT_PATH . $rel;
        if (!file_exists($file)) {
            $bad[] = array($tb, $x['id'], $x['title'], $x['imgurl'], '★文件不存在');
            continue;
        }
        $total++;
        $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
        $info = @getimagesize($file);
        $mime = $info ? $info['mime'] : '(解析失败)';
        $ok = isset($expect[$ext]) && $expect[$ext] === $mime;
        if (!$ok) {
            $bad[] = array($tb, $x['id'], $x['title'], $x['imgurl'], "实为 {$mime}，扩展名 .{$ext}");
        }
    }
}

echo "=== 图片扫描结果（共检查 {$total} 张）===\n\n";
if (!$bad) {
    echo "  全部一致 ✅\n";
} else {
    echo "  发现 " . count($bad) . " 张异常：\n\n";
    foreach ($bad as $b) {
        printf("  [%s#%s] %s\n      %s\n      %s\n", $b[0], $b[1], mb_substr($b[2], 0, 30), $b[3], $b[4]);
    }
}

/* 缩略图缓存核对 */
echo "\n=== 缩略图缓存（upload/thumb_src）===\n";
$tdir = ROOT_PATH . 'upload/thumb_src/';
$cnt = 0;
$hit = array();
if (is_dir($tdir)) {
    foreach (new RecursiveIteratorIterator(new RecursiveDirectoryIterator($tdir, FilesystemIterator::SKIP_DOTS)) as $f) {
        if (!$f->isFile()) { continue; }
        $cnt++;
        $n = $f->getFilename();
        if (strpos($n, '1789910808') !== false || strpos($n, '1789911158') !== false) { $hit[] = $f->getPathname(); }
    }
}
echo "  缓存文件总数: {$cnt}\n";
if ($hit) {
    foreach ($hit as $h) { echo '  匹配: ' . str_replace(ROOT_PATH, '', $h) . "\n"; }
} else {
    echo "  ★ #49 / #50 均无缩略图缓存（尚未生成）\n";
}

/* GD 能力检测 */
echo "\n=== PHP GD 能力 ===\n";
foreach (array('imagecreatefromjpeg', 'imagecreatefromwebp', 'imagecreatefrompng', 'imagejpeg', 'imagewebp') as $fn) {
    echo sprintf("  %-22s : %s\n", $fn, function_exists($fn) ? '可用' : '★不可用');
}
