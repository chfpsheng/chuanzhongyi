<?php
/**
 * 百度主动推送（普通收录 - API 提交）
 *
 * 用途：把 URL 推给百度，缩短爬虫发现链接的时间（不保证收录）。
 *      URL 取自站点自己的 sitemap.xml —— 里面已是伪静态规范地址
 *      （百度要求：若链接存在跳转关系，请直接提交跳转后的链接）。
 *
 * 用法（命令行）：
 *   php tools/baidu_push.php --dry                 只列出将要推送哪些，不真推
 *   php tools/baidu_push.php                       推最近 3 天有更新的页面，最多 10 条
 *   php tools/baidu_push.php --days=7 --limit=5    自定义时间窗与条数
 *   php tools/baidu_push.php --urls="https://a,https://b"   指定 URL
 *   php tools/baidu_push.php --sitemap --limit=10  不按时间过滤，按 sitemap 顺序推
 *   php tools/baidu_push.php --stats               查看推送记录
 *   php tools/baidu_push.php --reset-log           清空推送记录（会重新允许推旧 URL）
 *
 * 配额说明：API 提交与「手动提交」共享当日配额，sitemap 提交额度独立。
 *          配额以搜索资源平台页面显示为准，用完后当天再推会失败。
 *
 * 记录文件：tools/logs/baidu_push.log（一行一条 JSON）
 */

$dry = in_array('--dry', $argv);
$resetLog = in_array('--reset-log', $argv);
$statsOnly = in_array('--stats', $argv);
$useSitemap = in_array('--sitemap', $argv);
$days = 3;
$limit = 0;
$urlsArg = '';
foreach ($argv as $a) {
    if (strpos($a, '--days=') === 0) { $days = intval(substr($a, 7)); }
    if (strpos($a, '--limit=') === 0) { $limit = intval(substr($a, 8)); }
    if (strpos($a, '--urls=') === 0) { $urlsArg = substr($a, 7); }
}

define('PUSH_DIR', dirname(__FILE__));
define('PUSH_ROOT', dirname(PUSH_DIR));
define('PUSH_LOG', PUSH_DIR . '/logs/baidu_push.log');

// ---------- 配置 ----------
$cfgFile = PUSH_DIR . '/baidu_push.config.php';
if (!is_file($cfgFile)) {
    exit("缺少配置：请复制 tools/baidu_push.config.example.php 为 tools/baidu_push.config.php 并填入 token\n");
}
$cfg = include $cfgFile;
$site = rtrim(isset($cfg['site']) ? $cfg['site'] : '', '/');
$token = isset($cfg['token']) ? trim($cfg['token']) : '';
if ($site === '' || $token === '' || strpos($token, 'CHANGE_ME') !== false) {
    exit("配置不完整：请在 tools/baidu_push.config.php 里填写 site 与 token\n");
}
if (!$limit) { $limit = intval(isset($cfg['daily_limit']) ? $cfg['daily_limit'] : 10); }
if (!$limit) { $limit = 10; }
if (!$useSitemap && $days <= 0) { $days = intval(isset($cfg['days']) ? $cfg['days'] : 3); }
$skipDays = intval(isset($cfg['skip_days']) ? $cfg['skip_days'] : 30);

if (!is_dir(dirname(PUSH_LOG))) { @mkdir(dirname(PUSH_LOG), 0755, true); }

if ($resetLog && is_file(PUSH_LOG)) {
    @unlink(PUSH_LOG);
    echo "推送记录已清空\n";
}

// ---------- 读取推送记录 ----------
function push_history()
{
    $h = array();
    if (!is_file(PUSH_LOG)) { return $h; }
    foreach (@file(PUSH_LOG, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
        $x = json_decode($line, true);
        if (is_array($x) && !empty($x['url']) && !empty($x['ts'])) {
            $t = strtotime($x['ts']);
            if (!isset($h[$x['url']]) || $t > $h[$x['url']]) { $h[$x['url']] = $t; }
        }
    }
    return $h;
}

$history = push_history();

if ($statsOnly) {
    echo "推送记录：" . count($history) . " 个 URL\n";
    $recent = array();
    foreach ($history as $u => $t) { $recent[$u] = $t; }
    arsort($recent);
    $i = 0;
    foreach ($recent as $u => $t) {
        if ($i++ >= 10) { break; }
        echo "  " . date('Y-m-d H:i', $t) . "  " . $u . "\n";
    }
    exit(0);
}

// ---------- 收集候选 URL ----------
$candidates = array();   // url => lastmod

if ($urlsArg !== '') {
    foreach (explode(',', $urlsArg) as $u) {
        $u = trim($u);
        if ($u !== '') { $candidates[$u] = date('Y-m-d'); }
    }
} else {
    $smFile = PUSH_ROOT . '/sitemap.xml';
    if (!is_file($smFile)) {
        exit("找不到 sitemap.xml：请先执行 php tools/rebuild_seo.php\n");
    }
    $xml = @file_get_contents($smFile);
    // 注意：sitemap 里 <priority> 排在 <lastmod> 之前，必须逐块解析，不能按顺序正则
    if (preg_match_all('#<url>(.*?)</url>#is', $xml, $blocks)) {
        foreach ($blocks[1] as $block) {
            if (!preg_match('#<loc>(.*?)</loc>#is', $block, $lm)) { continue; }
            $loc = trim($lm[1]);
            $last = preg_match('#<lastmod>(.*?)</lastmod>#is', $block, $ld) ? trim($ld[1]) : date('Y-m-d');
            $candidates[$loc] = $last;
        }
    }
    if (!$candidates) {
        exit("sitemap.xml 里没解析到 URL\n");
    }
}

// ---------- 过滤与排序 ----------
$now = time();
$today = date('Y-m-d');
$picked = array();
$skipped = array('recent' => 0, 'old' => 0);
if ($useSitemap) {
    foreach ($candidates as $u => $last) { $picked[$u] = $last; }
} else {
    $from = strtotime('-' . $days . ' days', strtotime($today));
    foreach ($candidates as $u => $last) {
        if (strtotime($last) < $from) { $skipped['old']++; continue; }
        $picked[$u] = $last;
    }
}
// 排序：内容详情页（/{栏目}/{id}.html）优先，其次按更新时间倒序
$order = array();
foreach ($picked as $u => $last) {
    $order[] = array(
        'url'    => $u,
        'last'   => $last,
        'detail' => preg_match('#/\d+\.html$#', $u) ? 0 : 1,
        'ts'     => strtotime($last),
    );
}
usort($order, function ($a, $b) {
    if ($a['detail'] !== $b['detail']) { return $a['detail'] - $b['detail']; }
    if ($a['ts'] !== $b['ts']) { return $b['ts'] - $a['ts']; }
    return strcmp($a['url'], $b['url']);
});
$picked = array();
foreach ($order as $o) { $picked[$o['url']] = $o['last']; }
// 跳过近期推过的
$final = array();
foreach ($picked as $u => $last) {
    if (isset($history[$u]) && ($now - $history[$u]) < $skipDays * 86400) { $skipped['recent']++; continue; }
    $final[$u] = $last;
}
if (count($final) > $limit) {
    $final = array_slice($final, 0, $limit, true);
}

echo "站点：{$site}\n";
echo "候选 " . count($candidates) . " 条 → 命中时间窗 " . count($picked) . " 条 → 跳过（已推过 {$skipped['recent']}，超时窗 {$skipped['old']}）→ 本次取 " . count($final) . " 条（上限 {$limit}）\n";

if (!$final) {
    echo "没有需要推送的 URL（都没更新，或都在 {$skipDays} 天内推过了）。\n";
    exit(0);
}

echo "\n待推送列表：\n";
foreach ($final as $u => $last) {
    echo "  [{$last}] {$u}\n";
}
if ($dry) {
    echo "\n（--dry：未真正推送）\n";
    exit(0);
}

// ---------- 推送 ----------
$api = 'http://data.zz.baidu.com/urls?site=' . urlencode($site) . '&token=' . urlencode($token);
$body = implode("\n", array_keys($final));

echo "\n正在推送 " . count($final) . " 条…\n";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $api);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $body);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: text/plain'));
curl_setopt($ch, CURLOPT_TIMEOUT, 60);
$resp = curl_exec($ch);
$err = curl_error($ch);
$code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($resp === false) {
    echo "推送失败：{$err}\n";
    exit(1);
}
$data = json_decode($resp, true);
echo "接口返回 HTTP {$code}：" . $resp . "\n";

$success = is_array($data) && isset($data['success']) ? intval($data['success']) : 0;
$ok = ($code == 200 && $success > 0);
if ($ok) {
    // 只有推送成功的才记入历史（失败的留着下次再推）
    foreach ($final as $u => $last) {
        @file_put_contents(PUSH_LOG, json_encode(array(
            'ts' => date('Y-m-d H:i:s'), 'url' => $u, 'lastmod' => $last,
            'success' => $success, 'remain' => isset($data['remain']) ? $data['remain'] : null,
        ), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) . "\n", FILE_APPEND | LOCK_EX);
    }
    echo "✅ 成功推送 {$success} 条";
    if (isset($data['remain'])) { echo "，今日剩余配额 {$data['remain']} 条"; }
    echo "\n";
    if (!empty($data['not_same_site'])) { echo "⚠️ 非本站 URL：" . implode('、', (array)$data['not_same_site']) . "\n"; }
    if (!empty($data['not_valid'])) { echo "⚠️ 无效 URL：" . implode('、', (array)$data['not_valid']) . "\n"; }
} else {
    echo "❌ 推送未成功" . (isset($data['message']) ? "：{$data['message']}" : '') . "\n";
    echo "   常见原因：当日配额已用完、token 错误、站点未验证、或 URL 不属于该站点\n";
    exit(1);
}
