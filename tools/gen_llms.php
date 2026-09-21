<?php
/**
 * 生成 llms.txt（AI 抓取友好的站点说明）
 *
 * 用法：
 *   php tools/gen_llms.php          # 预览到屏幕，不写文件
 *   php tools/gen_llms.php write    # 写入站点根目录 llms.txt
 *
 * 说明：
 *   1. 只输出 sitemap.xml 中已收录的条目，保证 llms.txt 与 sitemap 一致
 *   2. 内容变动后重跑本脚本即可同步
 */
define('ROOT_PATH', dirname(__FILE__) . '/../');
$dbconf = parse_ini_file(ROOT_PATH . 'config/config_db.php');
$db = @new mysqli($dbconf['con_db_host'], $dbconf['con_db_id'], $dbconf['con_db_pass'], $dbconf['con_db_name'], 3306);
if ($db->connect_error) { exit("DB FAIL: " . $db->connect_error . "\n"); }
$db->set_charset('utf8');
$pre  = isset($dbconf['tablepre']) ? $dbconf['tablepre'] : 'met_';
$site = 'https://www.chuanzhongyi.com';

/* ---------- 工具函数 ---------- */
/**
 * 擅长/介绍类长文本：按分句切取前若干短语，避免出现半截句子
 */
function brief($s, $max = 36) {
    $s = cl($s);
    if ($s === '') { return ''; }
    $parts = preg_split('/[、，,；;。\/\|\n\r]+/u', $s);
    $out = array();
    $len = 0;
    foreach ((array)$parts as $p) {
        $p = cl($p);
        if ($p === '') { continue; }
        $l = function_exists('mb_strlen') ? mb_strlen($p, 'UTF-8') : strlen($p);
        if ($len + $l > $max && $out) { break; }
        $out[] = $p;
        $len += $l + 1;
        if (count($out) >= 3) { break; }
    }
    return $out ? implode('、', $out) : cl($s, $max);
}

function cl($s, $max = 0) {
    $s = trim(preg_replace('/\s+/u', ' ', strip_tags(html_entity_decode((string)$s, ENT_QUOTES, 'UTF-8'))));
    if ($max > 0 && function_exists('mb_substr') && mb_strlen($s, 'UTF-8') > $max) {
        $s = mb_substr($s, 0, $max, 'UTF-8') . '…';
    }
    return $s;
}

/* ---------- 站点配置 ---------- */
$cfg = array();
$r = $db->query("SELECT name,value FROM {$pre}config WHERE lang='cn'");
if ($r) { while ($x = $r->fetch_assoc()) { $cfg[$x['name']] = $x['value']; } }
$webname = !empty($cfg['met_webname']) ? cl($cfg['met_webname']) : '四川中医馆（四川中医网）';
$webdesc = !empty($cfg['met_webdesc']) ? cl($cfg['met_webdesc'], 200) : '';
if (!$webdesc && !empty($cfg['met_description'])) { $webdesc = cl($cfg['met_description'], 200); }

/* ---------- 从 sitemap.xml 取得已收录条目 ---------- */
$allow = array('doctor' => array(), 'product' => array(), 'activity' => array(), 'shaoer' => array(), 'news' => array());
$sm = @file_get_contents(ROOT_PATH . 'sitemap.xml');
if ($sm && preg_match_all('#<loc>(.*?)</loc>#', $sm, $m)) {
    foreach ($m[1] as $u) {
        if (preg_match('#/showdoctor\.php\?id=(\d+)#', $u, $a))   { $allow['doctor'][]   = (int)$a[1]; }
        elseif (preg_match('#/showproduct\.php\?id=(\d+)#', $u, $a))  { $allow['product'][]  = (int)$a[1]; }
        elseif (preg_match('#/showactivity\.php\?id=(\d+)#', $u, $a)) { $allow['activity'][] = (int)$a[1]; }
        elseif (preg_match('#/showshaoer\.php\?id=(\d+)#', $u, $a))   { $allow['shaoer'][]   = (int)$a[1]; }
        elseif (preg_match('#/shownews\.php\?id=(\d+)#', $u, $a))     { $allow['news'][]     = (int)$a[1]; }
    }
}

/* ---------- 中医师 ---------- */
$doctors = array();
if ($allow['doctor']) {
    $ids = implode(',', $allow['doctor']);
    $r = $db->query("SELECT id,title,description,hospital,school,fee,specialty FROM {$pre}doctor WHERE lang='cn' AND id IN ({$ids}) ORDER BY id");
    if ($r) {
        while ($x = $r->fetch_assoc()) {
            $p = array();
            $school = cl($x['school']);
            $hosp   = cl($x['hospital']);
            $spec   = brief($x['specialty'], 36);
            if ($school) { $p[] = $school; }
            if ($hosp)   { $p[] = '执业于' . $hosp; }
            if ($spec)   { $p[] = (mb_strpos($spec, '擅长', 0, 'UTF-8') === 0) ? $spec : '擅长' . $spec; }
            if (intval($x['fee']) > 0) { $p[] = '参考挂号费 ¥' . intval($x['fee']); }
            $desc = implode('，', $p);
            if (!$desc) { $desc = cl($x['description'], 120); }
            $doctors[] = array('title' => cl($x['title']), 'desc' => $desc, 'url' => $site . '/zhongyishi/showdoctor.php?id=' . $x['id']);
        }
    }
}

/* ---------- 中医馆 ---------- */
$clinics = array();
if ($allow['product']) {
    $ids = implode(',', $allow['product']);
    $r = $db->query("SELECT id,title,description,region_city,region_district,specialty,visit_time FROM {$pre}product WHERE lang='cn' AND id IN ({$ids}) ORDER BY id");
    if ($r) {
        while ($x = $r->fetch_assoc()) {
            $p = array();
            $city = cl($x['region_city']);
            $dist = cl($x['region_district']);
            $spec = brief($x['specialty'], 36);
            if ($city || $dist) { $p[] = '位于' . $city . $dist; }
            if ($spec)          { $p[] = (mb_strpos($spec, '擅长', 0, 'UTF-8') === 0) ? $spec : '擅长' . $spec; }
            $vt = cl($x['visit_time'], 40);
            if ($vt)            { $p[] = '出诊时间' . $vt; }
            $desc = implode('，', $p);
            if (!$desc) { $desc = cl($x['description'], 120); }
            $clinics[] = array('title' => cl($x['title']), 'desc' => $desc, 'url' => $site . '/product/showproduct.php?id=' . $x['id']);
        }
    }
}

/* ---------- 中医活动 / 少儿中医 ---------- */
function build_events($db, $pre, $site, $table, $ids, $prefix, $region = false) {
    $out = array();
    if (!$ids) { return $out; }
    $in   = implode(',', $ids);
    $cols = 'id,title,description,start_time,end_time,location,is_free'
          . ($region ? ',region_city,region_district' : '');
    $sql  = "SELECT {$cols} FROM {$pre}{$table} WHERE lang='cn' AND id IN ({$in}) ORDER BY id";
    $r = $db->query($sql);
    if (!$r) { return $out; }
    while ($x = $r->fetch_assoc()) {
        $p = array();
        $s = cl($x['start_time']);
        $e = cl($x['end_time']);
        if ($s && $e && $s !== $e) { $p[] = $s . ' 至 ' . $e; }
        elseif ($s)                { $p[] = $s; }
        $loc = cl($x['location']);
        if (!$loc && $region) {
            $loc = cl(isset($x['region_city']) ? $x['region_city'] : '') . cl(isset($x['region_district']) ? $x['region_district'] : '');
        }
        if ($loc) { $p[] = '地点' . $loc; }
        if (isset($x['is_free']))  { $p[] = intval($x['is_free']) ? '免费参与' : '需报名，费用以公告为准'; }
        $desc = implode('，', $p);
        if (!$desc) { $desc = cl($x['description'], 120); }
        $out[] = array('title' => cl($x['title']), 'desc' => $desc, 'url' => $site . $prefix . '?id=' . $x['id']);
    }
    return $out;
}
$acts    = build_events($db, $pre, $site, 'activity', $allow['activity'], '/huodong/showactivity.php', false);
$shaor   = build_events($db, $pre, $site, 'shaoer',   $allow['shaoer'],   '/shaoerzhongyi/showshaoer.php', true);

/* ---------- 中医资讯 ---------- */
$news = array();
if ($allow['news']) {
    $ids = implode(',', $allow['news']);
    $r = $db->query("SELECT id,title,description FROM {$pre}news WHERE lang='cn' AND id IN ({$ids}) ORDER BY id DESC");
    if ($r) {
        while ($x = $r->fetch_assoc()) {
            $news[] = array('title' => cl($x['title']), 'desc' => cl($x['description'], 80), 'url' => $site . '/news/shownews.php?id=' . $x['id']);
        }
    }
}

/* ---------- 组装 llms.txt ---------- */
$o  = array();
$o[] = '# ' . $webname;
$o[] = '';
$o[] = '> 四川中医馆（四川中医网）是面向四川及成都地区的中医信息服务平台，收录特色中医馆、名老中医、中医活动与少儿中医研学资源，帮助用户查找可信赖的中医就医与养生参考信息。';
$o[] = '';
$o[] = '本站以“可查证、可追溯”为原则整理中医馆与中医师信息；所有医疗相关内容仅作健康科普参考，不能替代执业医师的诊断与处方。';
$o[] = '';
$o[] = '## 主要栏目';
$o[] = '';
$o[] = '- [中医师名录](' . $site . '/zhongyishi/)：四川名老中医与中医专家信息，含执业机构、擅长领域、参考挂号费';
$o[] = '- [中医馆](' . $site . '/product/)：四川及成都各区县的中医馆信息，含擅长项目、地址与出诊时间';
$o[] = '- [中医活动](' . $site . '/huodong/)：中医药文化服务、公益义诊、健康讲座等活动信息';
$o[] = '- [少儿中医](' . $site . '/shaoerzhongyi/)：面向青少年的中医研学体验活动';
$o[] = '- [中医资讯](' . $site . '/news/)：中医行业动态、中医养生与药食同源科普';
$o[] = '- [中医养生](' . $site . '/news/news.php?class2=106)：四季调养、体质辨识、经络穴位保健';
$o[] = '- [药食同源](' . $site . '/news/news.php?class2=107)：食材性味、食疗搭配与药膳做法';
$o[] = '- [关于我们](' . $site . '/about/show.php?id=111)：平台介绍、联系方式与信息收录说明';
$o[] = '';

$o[] = '## 已收录中医师（共 ' . count($doctors) . ' 位）';
$o[] = '';
foreach ($doctors as $d) {
    $o[] = '- [' . $d['title'] . '](' . $d['url'] . ')：' . ($d['desc'] ? $d['desc'] : '四川中医师，详细信息见页面');
}
$o[] = '';

$o[] = '## 已收录中医馆（共 ' . count($clinics) . ' 家）';
$o[] = '';
foreach ($clinics as $c) {
    $o[] = '- [' . $c['title'] . '](' . $c['url'] . ')：' . ($c['desc'] ? $c['desc'] : '四川中医馆，详细信息见页面');
}
$o[] = '';

$o[] = '## 已收录中医活动（共 ' . count($acts) . ' 场）';
$o[] = '';
foreach ($acts as $a) {
    $o[] = '- [' . $a['title'] . '](' . $a['url'] . ')：' . ($a['desc'] ? $a['desc'] : '时间与地点以主办方公告为准');
}
$o[] = '';

$o[] = '## 已收录少儿中医研学（共 ' . count($shaor) . ' 期）';
$o[] = '';
foreach ($shaor as $a) {
    $o[] = '- [' . $a['title'] . '](' . $a['url'] . ')：' . ($a['desc'] ? $a['desc'] : '时间与地点以主办方公告为准');
}
$o[] = '';

$o[] = '## 中医资讯（共 ' . count($news) . ' 篇）';
$o[] = '';
foreach ($news as $n) {
    $o[] = '- [' . $n['title'] . '](' . $n['url'] . ')' . ($n['desc'] ? '：' . $n['desc'] : '');
}
$o[] = '';

$o[] = '## 内容准则';
$o[] = '';
$o[] = '- 中医养生与药食同源内容仅作科普与日常调理参考，不构成诊疗建议';
$o[] = '- 中医师、中医馆信息依据机构公开信息整理，如有变动以机构公告为准';
$o[] = '- 身体不适请及时到正规医疗机构就诊，诊疗请遵医嘱';
$o[] = '- 中医馆收录、中医师信息补充、活动合作与内容纠错，请通过“联系我们 / 在线留言”页面提交';
$o[] = '';
$o[] = '## 结构化数据';
$o[] = '';
$o[] = '- 站点、栏目、中医师（Physician）、中医馆（MedicalClinic）、活动（Event）、资讯（Article）等页面均提供 schema.org JSON-LD 结构化数据';
$o[] = '';
$o[] = '## 其它';
$o[] = '';
$o[] = '- Sitemap: ' . $site . '/sitemap.xml';
$o[] = '- 联系方式：见 ' . $site . '/about1/show.php?id=118 联系我们页面';
$o[] = '- 最后更新：' . date('Y-m-d');
$o[] = '';

$out = implode("\n", $o);

if (isset($argv[1]) && $argv[1] === 'write') {
    @file_put_contents(ROOT_PATH . 'llms.txt', $out);
    echo "written: " . ROOT_PATH . "llms.txt (" . strlen($out) . " bytes)\n";
    echo '医师 ' . count($doctors) . ' / 医馆 ' . count($clinics) . ' / 活动 ' . count($acts) . ' / 少儿 ' . count($shaor) . ' / 资讯 ' . count($news) . "\n";
} else {
    echo $out;
    echo "\n--- 统计 ---\n";
    echo '医师 ' . count($doctors) . ' / 医馆 ' . count($clinics) . ' / 活动 ' . count($acts) . ' / 少儿 ' . count($shaor) . ' / 资讯 ' . count($news) . "\n";
    echo '（写入文件请执行：php tools/gen_llms.php write）' . "\n";
}
