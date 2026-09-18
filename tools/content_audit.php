<?php
/**
 * 内容体检工具：导出「薄内容 / 缺封面 / 缺地区」清单（CSV）
 *
 * 用法（CLI）：
 *   php tools/content_audit.php                 输出到 tools/content_audit_日期.csv
 *   php tools/content_audit.php D:/audit.csv    指定输出文件
 *
 * 判定规则：
 *   正文过短   < 300 字符
 *   无封面     imgurl 为空
 *   缺地区     region_city / region_district 为空（仅中医馆、少儿中医）
 *   描述为空   description 为空
 */

define('ROOT_PATH', dirname(__FILE__) . '/../');

$dbconf = @parse_ini_file(ROOT_PATH . 'config/config_db.php');
if (!$dbconf || empty($dbconf['con_db_host'])) {
    exit("读取数据库配置失败：config/config_db.php\n");
}
$db = @new mysqli(
    $dbconf['con_db_host'],
    isset($dbconf['con_db_id']) ? $dbconf['con_db_id'] : '',
    isset($dbconf['con_db_pass']) ? $dbconf['con_db_pass'] : '',
    $dbconf['con_db_name'],
    isset($dbconf['con_db_port']) ? intval($dbconf['con_db_port']) : 3306
);
if ($db->connect_error) {
    exit("数据库连接失败：" . $db->connect_error . "\n");
}
$db->set_charset('utf8');
$pre = isset($dbconf['tablepre']) ? $dbconf['tablepre'] : 'met_';

$out = isset($argv[1]) && $argv[1] ? $argv[1] : ROOT_PATH . 'tools/content_audit_' . date('Ymd') . '.csv';

$modules = array(
    array('table' => 'product', 'name' => '中医馆', 'region' => true),
    array('table' => 'news', 'name' => '中医资讯', 'region' => false),
    array('table' => 'doctor', 'name' => '中医师', 'region' => false),
    array('table' => 'activity', 'name' => '中医活动', 'region' => false),
    array('table' => 'shaoer', 'name' => '少儿中医', 'region' => true),
    array('table' => 'img', 'name' => '图文(医师团队/医馆环境)', 'region' => false),
);

$rows = array();
$rows[] = array('模块', 'ID', '标题', '状态', '正文字符数', '封面图', '城市', '区县', '描述字符数', '更新时间', '问题');

$total = 0;
$bad = 0;
foreach ($modules as $m) {
    $table = $pre . $m['table'];
    $res = @$db->query("SHOW TABLES LIKE '{$table}'");
    if (!$res || !$res->num_rows) {
        continue;
    }
    $cols = array();
    $rc = $db->query("SHOW COLUMNS FROM {$table}");
    while ($x = $rc->fetch_assoc()) {
        $cols[] = $x['Field'];
    }
    $hasRegion = $m['region'] && in_array('region_city', $cols);
    $fields = array('id', 'title', 'content', 'imgurl', 'description', 'updatetime');
    if (in_array('displaytype', $cols)) {
        $fields[] = 'displaytype';
    }
    if ($hasRegion) {
        $fields[] = 'region_city';
        $fields[] = 'region_district';
    }
    $sql = 'SELECT ' . implode(',', $fields) . " FROM {$table} WHERE lang='cn'";
    if (in_array('recycle', $cols)) {
        $sql .= ' AND recycle=0';
    }
    $sql .= ' ORDER BY id DESC';
    $rr = @$db->query($sql);
    if (!$rr) {
        continue;
    }
    while ($x = $rr->fetch_assoc()) {
        $total++;
        $clen = mb_strlen(trim(strip_tags($x['content'])), 'UTF-8');
        $dlen = mb_strlen(trim(strip_tags($x['description'])), 'UTF-8');
        $img = trim($x['imgurl']) ? '有' : '无';
        $status = isset($x['displaytype']) && intval($x['displaytype']) < 0 ? '草稿' : '已发布';
        $city = $hasRegion ? trim($x['region_city']) : '';
        $district = $hasRegion ? trim($x['region_district']) : '';
        $issues = array();
        if ($clen < 300) {
            $issues[] = '正文过短';
        }
        if ($clen === 0) {
            $issues[] = '正文为空';
        }
        if ($img === '无') {
            $issues[] = '无封面';
        }
        if ($dlen === 0) {
            $issues[] = '描述为空';
        }
        if ($hasRegion && ($city === '' || $district === '')) {
            $issues[] = '缺地区';
        }
        if (!$issues) {
            continue;
        }
        $bad++;
        $rows[] = array(
            $m['name'],
            $x['id'],
            $x['title'],
            $status,
            $clen,
            $img,
            $city,
            $district,
            $dlen,
            isset($x['updatetime']) ? $x['updatetime'] : '',
            implode('；', $issues),
        );
    }
}

$fh = fopen($out, 'w');
if (!$fh) {
    exit("无法写入文件：{$out}\n");
}
fwrite($fh, "\xEF\xBB\xBF"); // BOM，Excel 直接打开不乱码
foreach ($rows as $r) {
    $line = array();
    foreach ($r as $v) {
        $v = str_replace(array("\r", "\n"), ' ', (string)$v);
        $line[] = '"' . str_replace('"', '""', $v) . '"';
    }
    fwrite($fh, implode(',', $line) . "\r\n");
}
fclose($fh);

echo "内容体检完成：共检查 {$total} 条，存在问题的 {$bad} 条\n";
echo "清单已导出：{$out}\n";
