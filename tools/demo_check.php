<?php
/**
 * 真实数据核对：扫描配置 / 内容 / 图片 / 附加模块中的示例、占位、模板残留
 * 用法：php tools/demo_check.php
 */
define('ROOT_PATH', dirname(__FILE__) . '/../');
$dbconf = parse_ini_file(ROOT_PATH . 'config/config_db.php');
$db = @new mysqli($dbconf['con_db_host'], $dbconf['con_db_id'], $dbconf['con_db_pass'], $dbconf['con_db_name'], 3306);
if ($db->connect_error) { exit("DB FAIL\n"); }
$db->set_charset('utf8');
$pre = isset($dbconf['tablepre']) ? $dbconf['tablepre'] : 'met_';

function t($s, $n = 100) {
    $s = trim(preg_replace('/\s+/u', ' ', strip_tags(html_entity_decode((string)$s, ENT_QUOTES, 'UTF-8'))));
    if (mb_strlen($s, 'UTF-8') > $n) { $s = mb_substr($s, 0, $n, 'UTF-8') . '…'; }
    return $s;
}

/* ---------- 1. 站点配置 ---------- */
echo "=== 1. 站点配置（联系方式 / 备案 / 统计） ===\n";
$cfg = array();
$r = $db->query("SELECT name,value FROM {$pre}config WHERE lang='cn'");
if ($r) { while ($x = $r->fetch_assoc()) { $cfg[$x['name']] = $x['value']; } }
$keys = array('met_webname', 'met_weburl', 'met_logo', 'met_footright', 'met_foottext', 'met_footinfo',
              'met_footaddress', 'met_footTel', 'met_footother', 'met_email', 'met_agents',
              'met_tools_code', 'met_stat', 'met_keywords');
foreach ($keys as $k) {
    if (!isset($cfg[$k])) { echo sprintf("  %-16s : (未设置)\n", $k); continue; }
    echo sprintf("  %-16s : %s\n", $k, t($cfg[$k], 110));
}

/* ---------- 2. 占位 / 模板关键词扫描 ---------- */
echo "\n=== 2. 占位 / 模板关键词扫描 ===\n";
$bad = '示例|演示|demo|Demo|DEMO|待填|请填写|待补充|暂无内容|米拓|metinfo|MetInfo|lorem|Lorem|test\.|测试内容|您的公司|公司名称|这里填写';
$found = 0;
foreach ($cfg as $k => $v) {
    if (preg_match('/' . $bad . '/u', (string)$v)) { echo "  [config] {$k} => " . t($v, 80) . "\n"; $found++; }
}
$tables = array(
    'news' => array('title', 'content', 'description'),
    'product' => array('title', 'content', 'description'),
    'doctor' => array('title', 'content', 'description'),
    'activity' => array('title', 'content', 'description'),
    'shaoer' => array('title', 'content', 'description'),
    'column' => array('name', 'content', 'description'),
    'img' => array('title', 'content'),
);
foreach ($tables as $tb => $cols) {
    $chk = @$db->query("SHOW TABLES LIKE '{$pre}{$tb}'");
    if (!$chk || $chk->num_rows === 0) { continue; }
    $sel = 'id,' . implode(',', $cols);
    $r = $db->query("SELECT {$sel} FROM {$pre}{$tb} WHERE lang='cn' OR lang IS NULL");
    if (!$r) { continue; }
    while ($x = $r->fetch_assoc()) {
        foreach ($cols as $c) {
            if (isset($x[$c]) && preg_match('/' . $bad . '/u', (string)$x[$c])) {
                echo "  [{$tb}#{$x['id']}] {$c} => " . t($x[$c], 80) . "\n";
                $found++;
                break;
            }
        }
    }
}
echo $found ? "  共 {$found} 处可疑\n" : "  未发现占位/模板残留 ✅\n";

/* ---------- 3. 图片路径可疑项 ---------- */
echo "\n=== 3. 图片路径可疑项（模板自带图 / 默认图） ===\n";
$imgbad = 'demo|sample|default|placeholder|noimage|nopic|metinfo|logo\.png$|banner\.jpg$|1\.jpg$';
$n = 0;
foreach (array('news', 'product', 'doctor', 'activity', 'shaoer', 'img') as $tb) {
    $chk = @$db->query("SHOW TABLES LIKE '{$pre}{$tb}'");
    if (!$chk || $chk->num_rows === 0) { continue; }
    $r = @$db->query("SELECT id,imgurl FROM {$pre}{$tb} WHERE imgurl<>'' AND (lang='cn' OR lang IS NULL)");
    if (!$r) { continue; }
    while ($x = $r->fetch_assoc()) {
        if (preg_match('/' . $imgbad . '/i', (string)$x['imgurl'])) {
            echo "  [{$tb}#{$x['id']}] {$x['imgurl']}\n"; $n++;
        }
    }
}
echo $n ? "  共 {$n} 张可疑图片\n" : "  未发现模板默认图 ✅\n";

/* ---------- 4. 未进 sitemap 的医馆数据 ---------- */
echo "\n=== 4. 中医馆（product）全量核对 ===\n";
$sm = @file_get_contents(ROOT_PATH . 'sitemap.xml');
$in = array();
if ($sm && preg_match_all('#/showproduct\.php\?id=(\d+)#', $sm, $m)) { $in = array_map('intval', $m[1]); }
$r = $db->query("SELECT id,title,class1,updatetime,addtime FROM {$pre}product WHERE lang='cn' ORDER BY id");
if ($r) {
    while ($x = $r->fetch_assoc()) {
        $flag = in_array((int)$x['id'], $in, true) ? '' : '  ★ 未在 sitemap（未对外）';
        echo sprintf("  #%-3s class1=%-4s %s%s\n", $x['id'], $x['class1'], t($x['title'], 40), $flag);
    }
}

/* ---------- 5. 单页 / 隐藏栏目内容 ---------- */
echo "\n=== 5. 单页栏目（module=1）内容核对 ===\n";
$r = $db->query("SELECT id,name,module,display,content FROM {$pre}column WHERE lang='cn' AND module=1 ORDER BY id");
if ($r) {
    while ($x = $r->fetch_assoc()) {
        $plain = t($x['content'], 99999);
        $flag = (int)$x['display'] === 1 ? ' [隐藏]' : '';
        echo sprintf("  [%s] %s%s : %d 字 => %s\n", $x['id'], $x['name'], $flag, mb_strlen($plain, 'UTF-8'), t($plain, 70));
    }
}
echo "\n=== 5b. 其他隐藏栏目 ===\n";
$r = $db->query("SELECT id,name,module,display,content FROM {$pre}column WHERE lang='cn' AND display=1 AND module<>1");
if ($r) {
    while ($x = $r->fetch_assoc()) {
        echo sprintf("  [%s] %s（module=%s）正文 %d 字\n", $x['id'], $x['name'], $x['module'], mb_strlen(t($x['content'], 99999), 'UTF-8'));
        echo '      ' . t($x['content'], 120) . "\n";
    }
}

/* ---------- 6. 活动 / 少儿：时间与来源 ---------- */
echo "\n=== 6. 中医活动：时间 / 来源 / 录入时间 ===\n";
$r = $db->query("SELECT id,title,start_time,end_time,location,publisher,addtime FROM {$pre}activity WHERE lang='cn' ORDER BY id");
if ($r) {
    while ($x = $r->fetch_assoc()) {
        echo sprintf("  #%-2s %s | %s ~ %s | %s | 来源:%s | 录入:%s\n",
            $x['id'], t($x['title'], 30), $x['start_time'], $x['end_time'], t($x['location'], 24),
            $x['publisher'] ?: '(空)', substr((string)$x['addtime'], 0, 10));
    }
}
echo "\n=== 7. 少儿中医：时间 / 来源 / 录入时间 ===\n";
$r = $db->query("SELECT id,title,start_time,end_time,location,publisher,addtime FROM {$pre}shaoer WHERE lang='cn' ORDER BY id");
if ($r) {
    while ($x = $r->fetch_assoc()) {
        echo sprintf("  #%-2s %s | %s ~ %s | %s | 来源:%s | 录入:%s\n",
            $x['id'], t($x['title'], 30), $x['start_time'], $x['end_time'], t($x['location'], 24),
            $x['publisher'] ?: '(空)', substr((string)$x['addtime'], 0, 10));
    }
}

/* ---------- 8. 资讯来源 ---------- */
echo "\n=== 8. 中医资讯：来源 / 录入时间 ===\n";
$r = $db->query("SELECT id,title,publisher,addtime FROM {$pre}news WHERE lang='cn' ORDER BY id");
$src = array();
if ($r) {
    while ($x = $r->fetch_assoc()) {
        $p = $x['publisher'] ?: '(空)';
        $src[$p] = isset($src[$p]) ? $src[$p] + 1 : 1;
        echo sprintf("  #%-3s %s | 来源:%s | 录入:%s\n", $x['id'], t($x['title'], 34), t($p, 20), substr((string)$x['addtime'], 0, 10));
    }
}
echo "  来源分布：";
foreach ($src as $k => $v) { echo $k . '×' . $v . '  '; }
echo "\n";

/* ---------- 9. 附加模块 ---------- */
echo "\n=== 9. 附加模块数据 ===\n";
foreach (array('job', 'message', 'link', 'member', 'feedback', 'img') as $tb) {
    $chk = @$db->query("SHOW TABLES LIKE '{$pre}{$tb}'");
    if (!$chk || $chk->num_rows === 0) { echo sprintf("  %-10s : 无表\n", $tb); continue; }
    $r = @$db->query("SELECT COUNT(*) c FROM {$pre}{$tb}");
    $c = $r ? (int)$r->fetch_assoc()['c'] : 0;
    $r2 = @$db->query("SELECT * FROM {$pre}{$tb} LIMIT 2");
    $sample = '';
    if ($r2) { while ($x = $r2->fetch_assoc()) { $sample .= t(isset($x['title']) ? $x['title'] : (isset($x['name']) ? $x['name'] : json_encode(array_slice($x, 0, 3, true), JSON_UNESCAPED_UNICODE)), 34) . ' / '; } }
    echo sprintf("  %-10s : %d 条  样例: %s\n", $tb, $c, $sample ?: '(无)');
}
