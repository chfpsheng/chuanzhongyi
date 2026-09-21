<?php
/**
 * 上线前全面自检：内容盘点 / 页面可达 / SEO / 收录准备 / 安全
 * 用法：php tools/launch_check.php
 */
define('ROOT_PATH', dirname(__FILE__) . '/../');
$dbconf = parse_ini_file(ROOT_PATH . 'config/config_db.php');
$db = @new mysqli($dbconf['con_db_host'], $dbconf['con_db_id'], $dbconf['con_db_pass'], $dbconf['con_db_name'], 3306);
if ($db->connect_error) { exit("DB FAIL\n"); }
$db->set_charset('utf8');
$pre = isset($dbconf['tablepre']) ? $dbconf['tablepre'] : 'met_';
$o = array();
function L($s = '') { global $o; $o[] = $s; }

/* ---------- 1. 站点基础配置 ---------- */
L('==================== 1. 站点基础配置 ====================');
$cfg = array();
$r = $db->query("SELECT name,value FROM {$pre}config WHERE lang='cn'");
if ($r) { while ($x = $r->fetch_assoc()) { $cfg[$x['name']] = $x['value']; } }
$siteUrl = isset($cfg['met_weburl']) ? $cfg['met_weburl'] : '';
L('站点名称  : ' . (isset($cfg['met_webname']) ? $cfg['met_webname'] : '(空)'));
L('站点地址  : ' . ($siteUrl ?: '(空)'));
L('站点关键词: ' . (isset($cfg['met_keywords']) ? mb_substr($cfg['met_keywords'], 0, 80) : '(空)'));
L('站点描述  : ' . (isset($cfg['met_description']) ? mb_substr($cfg['met_description'], 0, 90) : '(空)'));
$foot = '';
foreach (array('met_footright', 'met_foottext', 'met_footinfo', 'met_footaddress', 'met_footTel', 'met_footother') as $k) {
    if (!empty($cfg[$k])) { $foot .= strip_tags($cfg[$k]) . ' | '; }
}
L('页脚信息  : ' . ($foot ? mb_substr($foot, 0, 120) : '(空)'));
$icp = '';
foreach ($cfg as $k => $v) {
    if (stripos($v, 'ICP') !== false || stripos($v, '备案') !== false) { $icp = $v; break; }
}
L('ICP备案号  : ' . ($icp ? strip_tags($icp) : '★ 未检测到（国内上线必需）'));
$stat = '';
foreach ($cfg as $k => $v) {
    if (stripos($v, 'baidu') !== false || stripos($v, 'hm.js') !== false || stripos($v, 'gtag') !== false || stripos($v, 'google') !== false) { $stat .= $k . ' '; }
}
L('统计代码  : ' . ($stat ? '已配置（' . trim($stat) . '）' : '★ 未检测到'));
L('');

/* ---------- 2. 栏目结构 ---------- */
L('==================== 2. 栏目结构 ====================');
$cols = array();
$r = $db->query("SELECT id,name,foldername,module,display,bigclass FROM {$pre}column WHERE lang='cn' ORDER BY id");
if ($r) { while ($x = $r->fetch_assoc()) { $cols[$x['id']] = $x; } }
foreach ($cols as $c) {
    if (intval($c['bigclass']) !== 0) { continue; }
    $flag = intval($c['display']) ? ' [隐藏]' : '';
    $dir = $c['foldername'] ? (is_dir(ROOT_PATH . $c['foldername']) ? '目录OK' : '★无目录') : '';
    L(sprintf('  [%s] %-14s module=%-2s %s %s', $c['id'], $c['name'], $c['module'], $dir, $flag));
}
$hidden = array();
foreach ($cols as $c) { if (intval($c['display'])) { $hidden[] = $c['id'] . ' ' . $c['name']; } }
L('隐藏栏目  : ' . ($hidden ? implode('；', $hidden) : '无'));
L('');

/* ---------- 3. 内容盘点 ---------- */
L('==================== 3. 内容盘点 ====================');
$mods = array(
    'product'  => array('中医馆', 'clinic'),
    'news'     => array('中医资讯', ''),
    'doctor'   => array('中医师', 'doc'),
    'activity' => array('中医活动', ''),
    'shaoer'   => array('少儿中医', ''),
    'img'      => array('图文', ''),
);
$sum = array();
foreach ($mods as $t => $info) {
    $table = $pre . $t;
    $res = $db->query("SHOW TABLES LIKE '{$table}'");
    if (!$res || !$res->num_rows) { continue; }
    $rc = $db->query("SHOW COLUMNS FROM {$table}");
    $colsA = array(); while ($x = $rc->fetch_assoc()) { $colsA[] = $x['Field']; }
    $w = in_array('recycle', $colsA) ? " AND recycle=0" : '';
    $rr = $db->query("SELECT COUNT(*) c FROM {$table} WHERE lang='cn'{$w}");
    $x = $rr->fetch_assoc(); $total = intval($x['c']);
    $rr = $db->query("SELECT COUNT(*) c FROM {$table} WHERE lang='cn'{$w}" . (in_array('displaytype', $colsA) ? " AND displaytype=1" : ''));
    $x = $rr->fetch_assoc(); $pub = intval($x['c']);
    // 正文均值 + 缺图 + 缺描述
    $rr = $db->query("SELECT content,imgurl,description FROM {$table} WHERE lang='cn'{$w}");
    $len = 0; $noimg = 0; $nodesc = 0; $n = 0; $thin = 0; $missfile = 0;
    while ($x = $rr->fetch_assoc()) {
        $n++;
        $l = mb_strlen(trim(strip_tags($x['content'])), 'UTF-8');
        $len += $l;
        if ($l < 300) { $thin++; }
        if (!trim($x['imgurl'])) { $noimg++; }
        elseif (!is_file(ROOT_PATH . str_replace('../', '', $x['imgurl']))) { $missfile++; }
        if (!trim(strip_tags($x['description']))) { $nodesc++; }
    }
    $sum[$info[0]] = array('total' => $total, 'pub' => $pub, 'avg' => $n ? round($len / $n) : 0, 'thin' => $thin, 'noimg' => $noimg, 'missfile' => $missfile, 'nodesc' => $nodesc);
}
L(sprintf('  %-10s %5s %6s %8s %7s %7s %7s %7s', '模块', '总数', '已发布', '均字数', '薄内容', '缺图', '图丢失', '缺描述'));
foreach ($sum as $k => $s) {
    L(sprintf('  %-10s %5d %6d %8d %7d %7d %7d %7d', $k, $s['total'], $s['pub'], $s['avg'], $s['thin'], $s['noimg'], $s['missfile'], $s['nodesc']));
}
L('');

/* ---------- 4. 中医馆地区覆盖 ---------- */
L('==================== 4. 中医馆地区覆盖 ====================');
$rr = $db->query("SELECT region_city, region_district, COUNT(*) c FROM {$pre}product WHERE lang='cn' AND recycle=0 GROUP BY region_city,region_district ORDER BY region_city,c DESC");
while ($x = $rr->fetch_assoc()) { L('  ' . $x['region_city'] . ' / ' . $x['region_district'] . ' : ' . $x['c'] . ' 家'); }
L('');

/* ---------- 5. 资讯栏目分布 ---------- */
L('==================== 5. 资讯栏目分布 ====================');
$rr = $db->query("SELECT class2, COUNT(*) c FROM {$pre}news WHERE lang='cn' AND recycle=0 GROUP BY class2");
while ($x = $rr->fetch_assoc()) {
    $n = isset($cols[$x['class2']]) ? $cols[$x['class2']]['name'] : '(未知)';
    L('  ' . $n . ' : ' . $x['c'] . ' 篇');
}
L('');

/* ---------- 6. 医师字段覆盖 ---------- */
L('==================== 6. 中医师字段覆盖 ====================');
$rc = $db->query("SHOW COLUMNS FROM {$pre}doctor");
$dc = array(); while ($x = $rc->fetch_assoc()) { $dc[] = $x['Field']; }
$rr = $db->query("SELECT * FROM {$pre}doctor WHERE lang='cn' AND recycle=0");
$n = 0; $f = array();
while ($x = $rr->fetch_assoc()) { $n++; foreach ($dc as $k) { if (!in_array($k, array('id', 'lang', 'recycle', 'displaytype', 'updatetime', 'addtime', 'no_order', 'wap_ok', 'img_ok', 'com_ok', 'issue', 'hits', 'access', 'top_ok', 'text_size', 'text_color', 'imgurls', 'content', 'description', 'title', 'ctitle', 'keywords', 'tag', 'imgurl'))) { if (trim((string)$x[$k]) !== '') { if (!isset($f[$k])) { $f[$k] = 0; } $f[$k]++; } } } }
ksort($f);
foreach ($f as $k => $v) { L(sprintf('  %-16s %d/%d', $k, $v, $n)); }
L('');

/* ---------- 7. 收录准备（SEO） ---------- */
L('==================== 7. 收录准备（SEO） ====================');
$sm = ROOT_PATH . 'sitemap.xml';
if (is_file($sm)) {
    $c = file_get_contents($sm);
    $cnt = preg_match_all('/<loc>/', $c);
    L('sitemap.xml : 存在，' . $cnt . ' 条 URL，' . round(filesize($sm) / 1024, 1) . 'KB');
    L('  Sitemap 域名: ' . (preg_match('#<loc>(https?://[^/<]+)#', $c, $m) ? $m[1] : '?'));
} else { L('sitemap.xml : ★ 不存在'); }
$rb = ROOT_PATH . 'robots.txt';
if (is_file($rb)) {
    $c = file_get_contents($rb);
    L('robots.txt  : 存在，Disallow ' . preg_match_all('/^Disallow:/m', $c) . ' 条, Sitemap ' . preg_match_all('/^Sitemap:/m', $c) . ' 条');
} else { L('robots.txt  : ★ 不存在'); }
L('llms.txt    : ' . (is_file(ROOT_PATH . 'llms.txt') ? '存在（AI 抓取友好）' : '无'));
L('404.html    : ' . (is_file(ROOT_PATH . '404.html') ? '存在' : '★ 缺失'));
L('favicon.ico : ' . (is_file(ROOT_PATH . 'favicon.ico') ? '存在' : '★ 缺失'));
// 模板 demo 残留
$demo = array();
foreach (array('product', 'news', 'doctor', 'activity', 'shaoer', 'img') as $t) {
    $rr = @$db->query("SELECT id,title FROM {$pre}{$t} WHERE lang='cn' AND recycle=0 AND (title LIKE '%测试%' OR title LIKE '%示例%' OR title LIKE '%demo%' OR title LIKE '%Demo%' OR title LIKE '%模板%')");
    if ($rr) { while ($x = $rr->fetch_assoc()) { $demo[] = $t . '#' . $x['id'] . ' ' . $x['title']; } }
}
L('模板/测试残留: ' . ($demo ? '★ ' . implode('；', $demo) : '无'));
L('');

/* ---------- 8. 安全与上线硬条件 ---------- */
L('==================== 8. 安全与上线硬条件 ====================');
L('install/ 目录 : ' . (is_dir(ROOT_PATH . 'install') ? '★ 仍存在（必须删除/改名，否则可被重装）' : '已移除'));
L('admin/ 后台   : ' . (is_dir(ROOT_PATH . 'admin') ? '存在（建议改名 + 限制 IP）' : '无'));
$rr = $db->query("SELECT admin_id,admin_pass FROM {$pre}admin_table LIMIT 5");
if ($rr) { while ($x = $rr->fetch_assoc()) { L('后台账号    : ' . $x['admin_id'] . '（' . (strlen($x['admin_pass']) <= 32 && !preg_match('/^\$/', $x['admin_pass']) ? '★ 弱加密/弱口令风险' : '加密正常') . '）'); } }
// 大图
$big = array();
foreach (glob(ROOT_PATH . 'upload/2026*/*.{jpg,jpeg,png}', GLOB_BRACE) as $f) {
    if (filesize($f) > 500 * 1024) { $big[] = basename($f) . ' ' . round(filesize($f) / 1024) . 'KB'; }
}
L('大于500KB图片: ' . ($big ? count($big) . ' 张 → ' . implode('，', array_slice($big, 0, 6)) : '无'));
// 未被引用的孤儿图
L('');

file_put_contents(ROOT_PATH . 'tools/launch_check_report.txt', implode("\n", $o));
echo implode("\n", $o) . "\n";
