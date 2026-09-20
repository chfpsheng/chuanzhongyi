<?php
/**
 * 中医资讯入库接口（MetInfo 独立接口，不加载框架内核）
 *
 * 用途：本地脚本 tools/article_agent 或人工调用，把一篇整理好的资讯以「草稿」写入 met_news，
 *      之后在后台审核、发布。即：贴 URL → 脚本生成 → 入库草稿 → 后台审核发布。
 *
 * 四条硬约束：
 *   1. 只写草稿      displaytype=0（MetInfo 原生「待审核」状态：不进前台列表、不进站点地图）
 *   2. 防重复        按「规范化来源链接」+「标题」查重，命中直接返回已有内容 id，不重复插入
 *   3. 只写白名单栏目 栏目 id 必须命中配置白名单，防止把内容写进别的模块
 *   4. 有鉴权         token（hash_equals 定时比较）+ 可选 IP 白名单 + 每小时写入上限 + 审计日志
 *
 * 用法（HTTP POST，表单或 JSON 均可）：
 *   POST /tools/api_add_news.php
 *   token=xxxxx&title=标题&content_html=<p>正文</p>&source_url=https://...&class2=106
 *
 * 参数：
 *   token           必填，接口令牌
 *   title           必填，标题（4~200 字）
 *   content_html    必填，正文 HTML（≥100 字，会做安全清洗）
 *   ctitle          选填，SEO 标题
 *   keywords        选填，关键词（逗号分隔）
 *   description     选填，SEO 描述
 *   tag             选填，标签（| 分隔）
 *   publisher       选填，来源 / 作者
 *   source_url      选填，原文链接（强烈建议传，用于查重）
 *   is_original     选填，是否原创，1/0，默认 0
 *   class1/class2   选填，栏目（默认取配置），必须在白名单内
 *   force           选填，1 = 跳过查重强制插入
 *   dry_run         选填，1 = 只校验不写库（返回会写入的内容摘要）
 *   action          选填，ping = 健康检查（返回站点/栏目/配置摘要，不写库）
 *
 * 返回 JSON：{"code":0,"msg":"...","data":{...}}
 *   code=0    成功
 *   code=1001 已存在（重复），HTTP 409
 *   code=1002 参数错误，HTTP 400
 *   code=1003 鉴权失败，HTTP 403
 *   code=1004 超过频率限制，HTTP 429
 *   code=1005 服务端错误（数据库 / 配置），HTTP 500
 *
 * 配置文件：tools/api_add_news.config.php（不在版本库；从 .example.php 复制改名）
 */

error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_WARNING);
ini_set('display_errors', '0');           // 避免 PHP 警告污染 JSON
header('Content-Type: application/json; charset=utf-8');
header('X-Robots-Tag: noindex, nofollow');

define('API_DIR', dirname(__FILE__));                     // tools/
define('API_SITE', dirname(API_DIR));                     // 站点根目录
define('API_LOG_DIR', API_DIR . '/logs');
define('API_LOG_FILE', API_LOG_DIR . '/api_add_news.log');

$API_T0 = microtime(true);

// ---------------------------------------------------------------- 工具函数

/**
 * 输出 JSON 并结束
 */
function api_out($code, $msg, $data = array(), $http = 200)
{
    global $API_T0;
    if (!headers_sent()) {
        header('HTTP/1.1 ' . $http . ' ' . (isset(api_http_text()[$http]) ? api_http_text()[$http] : 'OK'));
    }
    $body = array(
        'code' => $code,
        'msg'  => $msg,
        'data' => $data,
        'cost' => round((microtime(true) - $API_T0) * 1000) . 'ms',
    );
    echo json_encode($body, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function api_http_text()
{
    return array(
        200 => 'OK', 400 => 'Bad Request', 403 => 'Forbidden', 404 => 'Not Found',
        405 => 'Method Not Allowed', 409 => 'Conflict', 429 => 'Too Many Requests',
        500 => 'Internal Server Error',
    );
}

/**
 * 读取接口配置
 */
function api_config()
{
    $file = API_DIR . '/api_add_news.config.php';
    if (!is_file($file)) {
        api_out(1005, '接口未配置：请复制 tools/api_add_news.config.example.php 为 tools/api_add_news.config.php 并填写 token', array(), 500);
    }
    $cfg = include $file;
    if (!is_array($cfg)) {
        api_out(1005, '接口配置文件格式错误（应 return 一个数组）', array(), 500);
    }
    $defaults = array(
        'token'          => '',
        'allowed_class1' => array(101),
        'allowed_class2' => array(0, 106, 107),
        'class1'         => 101,
        'class2'         => 106,
        'lang'           => 'cn',
        'issue'          => 'laoyang',
        'admin_dir'      => 'admin',
        'web_url'        => '',
        'draft_mode'     => 'displaytype',   // displaytype（推荐）| recycle（更严格，进回收站）
        'ip_allow'       => array(),         // 空数组 = 不限制
        'rate_per_hour'  => 60,
        'max_content_kb' => 200,
    );
    foreach ($defaults as $k => $v) {
        if (!array_key_exists($k, $cfg)) {
            $cfg[$k] = $v;
        }
    }
    if (strlen($cfg['token']) < 16) {
        api_out(1005, '接口 token 未配置或过短（至少 16 位），请修改 tools/api_add_news.config.php', array(), 500);
    }
    return $cfg;
}

/**
 * 连接数据库：优先读站点自带的 config/config_db.php（MetInfo 用 parse_ini_file 读它）
 */
function api_db($cfg)
{
    $file = API_SITE . '/config/config_db.php';
    $db = array();
    if (is_file($file)) {
        $parsed = @parse_ini_file($file);
        if (is_array($parsed)) {
            $db = $parsed;
        }
        $raw = @file_get_contents($file);
        if ($raw !== false) {
            foreach (array('con_db_host', 'con_db_port', 'con_db_id', 'con_db_pass', 'con_db_name', 'tablepre', 'db_charset') as $k) {
                if (empty($db[$k]) && preg_match('/' . preg_quote($k, '/') . '\s*=\s*"([^"]*)"/i', $raw, $m)) {
                    $db[$k] = $m[1];
                }
            }
        }
    }
    // 配置文件里显式写的优先（换服务器/换库时不用改站点文件）
    foreach (array('con_db_host', 'con_db_port', 'con_db_id', 'con_db_pass', 'con_db_name', 'tablepre') as $k) {
        if (!empty($cfg[$k])) {
            $db[$k] = $cfg[$k];
        }
    }
    if (empty($db['con_db_host']) || empty($db['con_db_id'])) {
        api_out(1005, '读不到数据库配置，请检查 config/config_db.php 或在接口配置里显式填写 con_db_*', array(), 500);
    }
    mysqli_report(MYSQLI_REPORT_OFF);
    $port = !empty($db['con_db_port']) ? intval($db['con_db_port']) : 3306;
    $link = @new mysqli($db['con_db_host'], $db['con_db_id'], $db['con_db_pass'], $db['con_db_name'], $port);
    if ($link->connect_errno) {
        api_out(1005, '数据库连接失败：' . $link->connect_error, array(), 500);
    }
    $link->set_charset(!empty($db['db_charset']) ? $db['db_charset'] : 'utf8');
    return array($link, (!empty($db['tablepre']) ? $db['tablepre'] : 'met_'));
}

/**
 * 审计日志（一行一条 JSON）
 */
function api_log($row)
{
    if (!is_dir(API_LOG_DIR)) {
        @mkdir(API_LOG_DIR, 0755, true);
    }
    $row['ts'] = date('Y-m-d H:i:s');
    $row['ip'] = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
    @file_put_contents(API_LOG_FILE, json_encode($row, JSON_UNESCAPED_UNICODE) . "\n", FILE_APPEND | LOCK_EX);
}

/**
 * 最近一小时成功入库次数（用于限流）
 */
function api_recent_count($seconds = 3600)
{
    if (!is_file(API_LOG_FILE)) {
        return 0;
    }
    $lines = @file(API_LOG_FILE, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    if (!is_array($lines)) {
        return 0;
    }
    $from = time() - $seconds;
    $n = 0;
    foreach (array_slice($lines, -500) as $line) {
        $item = json_decode($line, true);
        if (is_array($item) && !empty($item['ok']) && !empty($item['ts']) && strtotime($item['ts']) >= $from) {
            $n++;
        }
    }
    return $n;
}

/**
 * 正文 HTML 安全清洗
 */
function api_clean_html($html)
{
    $html = (string)$html;
    // 整段危险标签连内容一起丢掉
    $html = preg_replace('#<(script|style|iframe|object|embed|form|input|button|link|meta)[^>]*>.*?</\1>#is', '', $html);
    $html = preg_replace('#<(script|style|iframe|object|embed|form|input|button|link|meta)[^>]*/?>#is', '', $html);
    // 标签白名单
    $html = strip_tags($html, '<p><br><h2><h3><h4><strong><b><em><i><u><s><ul><ol><li><blockquote><a><img><table><thead><tbody><tr><th><td><figure><figcaption><span><div><hr><small><sup><sub>');
    // 事件属性
    $html = preg_replace('#\son[a-z]+\s*=\s*("[^"]*"|\'[^\']*\'|[^\s>]+)#i', '', $html);
    // 危险协议
    $html = preg_replace('#\s(href|src)\s*=\s*("|\')?\s*(javascript|vbscript|data)\s*:[^"\'>\s]*#i', ' $1="#"', $html);
    // 四字节字符：库是 utf8（非 utf8mb4），直接写会报错
    $html = preg_replace('/[\x{10000}-\x{10FFFF}]/u', '', $html);
    return trim($html);
}

/**
 * 单行文本清洗：去标签 + HTML 转义（与后台 htmlentities 的存法保持一致）
 */
function api_clean_text($text, $max = 0)
{
    $text = trim(strip_tags((string)$text));
    $text = preg_replace('/[\x{10000}-\x{10FFFF}]/u', '', $text);
    $text = str_replace(array("\r\n", "\r", "\n", "\t"), ' ', $text);
    if ($max > 0 && mb_strlen($text, 'UTF-8') > $max) {
        $text = mb_substr($text, 0, $max, 'UTF-8');
    }
    return htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
}

/**
 * 来源链接规范化：小写主机、去锚点、去跟踪参数、去结尾斜杠
 */
function api_normalize_url($url)
{
    $url = trim((string)$url);
    if ($url === '' || !preg_match('#^https?://#i', $url)) {
        return '';
    }
    $parts = @parse_url($url);
    if (!$parts || empty($parts['host'])) {
        return '';
    }
    $scheme = strtolower($parts['scheme']);
    $host = strtolower($parts['host']);
    $path = isset($parts['path']) ? $parts['path'] : '/';
    $drop = array('utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content',
                  'spm', 'from', 'share_token', 'wxopenid', 'scene', 'share_source');
    $query = '';
    if (!empty($parts['query'])) {
        parse_str($parts['query'], $q);
        foreach ($drop as $k) {
            unset($q[$k]);
        }
        if ($q) {
            ksort($q);
            $query = '?' . http_build_query($q);
        }
    }
    $path = preg_replace('#/+#', '/', $path);
    if ($path !== '/' && substr($path, -1) === '/') {
        $path = substr($path, 0, -1);
    }
    return $scheme . '://' . $host . $path . $query;
}

/**
 * 组装后台/前台链接
 */
function api_urls($cfg, $id, $class1, $class2, $class3 = 0)
{
    $base = rtrim($cfg['web_url'], '/');
    $edit = $base . '/' . trim($cfg['admin_dir'], '/') . '/index.php?lang=' . urlencode($cfg['lang'])
        . '&n=news&c=news&a=doeditor&id=' . $id
        . '&class1=' . intval($class1) . '&class2=' . intval($class2) . '&class3=' . intval($class3);
    return array(
        'edit_url'   => $edit,
        'review_url' => $base . '/' . trim($cfg['admin_dir'], '/') . '/index.php?lang=' . urlencode($cfg['lang'])
            . '&n=news&c=news&a=doindex&class1=' . intval($class1) . '&class2=' . intval($class2),
        'draft_url'  => $base . '/news/' . $id . '.html',
    );
}

// ---------------------------------------------------------------- 1. 请求方式与输入

if (strtoupper(isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : 'GET') !== 'POST') {
    api_out(1002, '只接受 POST 请求', array(), 405);
}

$raw = file_get_contents('php://input');
$input = $_POST;
if (empty($input) && $raw) {
    $json = json_decode($raw, true);
    if (is_array($json)) {
        $input = $json;
    }
}
if (empty($input)) {
    api_out(1002, '没有收到任何参数（请用 POST 提交表单或 JSON）', array(), 400);
}

$cfg = api_config();

// ---------------------------------------------------------------- 2. 鉴权：IP 白名单 + token

$ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
if (!empty($cfg['ip_allow']) && !in_array($ip, (array)$cfg['ip_allow'], true)) {
    api_log(array('ok' => 0, 'action' => 'auth', 'reason' => 'ip_denied', 'title' => ''));
    api_out(1003, 'IP 不在白名单内：' . $ip, array(), 403);
}

$token = isset($input['token']) ? (string)$input['token'] : '';
if ($token === '' || !hash_equals($cfg['token'], $token)) {
    api_log(array('ok' => 0, 'action' => 'auth', 'reason' => 'token_invalid', 'title' => ''));
    api_out(1003, 'token 校验失败', array(), 403);
}

// ---------------------------------------------------------------- 3. 健康检查

$action = isset($input['action']) ? strtolower(trim((string)$input['action'])) : '';
if ($action === 'ping') {
    list($link, $prefix) = api_db($cfg);
    $col = api_column_check($link, $prefix, $cfg, intval($cfg['class1']), intval($cfg['class2']), false);
    $cnt = array('total' => 0, 'draft' => 0);
    $rs = $link->query("SELECT COUNT(*) t, SUM(displaytype <> 1) d FROM {$prefix}news");
    if ($rs && ($row = $rs->fetch_assoc())) {
        $cnt['total'] = intval($row['t']);
        $cnt['draft'] = intval($row['d']);
    }
    api_out(0, '接口正常', array(
        'site'        => rtrim($cfg['web_url'], '/'),
        'draft_mode'  => $cfg['draft_mode'],
        'column'      => $col,
        'news_count'  => $cnt,
        'recent_1h'   => api_recent_count(),
        'rate_limit'  => intval($cfg['rate_per_hour']),
    ));
}

// ---------------------------------------------------------------- 4. 参数校验与清洗

$title = api_clean_text(isset($input['title']) ? $input['title'] : '', 200);
$content = api_clean_html(isset($input['content_html']) ? $input['content_html'] : (isset($input['content']) ? $input['content'] : ''));
$ctitle = api_clean_text(isset($input['ctitle']) ? $input['ctitle'] : '', 200);
$keywords = api_clean_text(isset($input['keywords']) ? $input['keywords'] : '', 220);
$description = api_clean_text(isset($input['description']) ? $input['description'] : '', 500);
$tag = api_clean_text(isset($input['tag']) ? $input['tag'] : '', 200);
$publisher = api_clean_text(isset($input['publisher']) ? $input['publisher'] : '', 50);
$source_url = api_normalize_url(isset($input['source_url']) ? $input['source_url'] : '');
$is_original = (!empty($input['is_original']) && intval($input['is_original']) === 1) ? 1 : 0;
$force = !empty($input['force']);
$dry_run = !empty($input['dry_run']);

$class1 = isset($input['class1']) && $input['class1'] !== '' ? intval($input['class1']) : intval($cfg['class1']);
$class2 = isset($input['class2']) && $input['class2'] !== '' ? intval($input['class2']) : intval($cfg['class2']);
$class3 = 0;

$errors = array();
if (mb_strlen($title, 'UTF-8') < 4) {
    $errors[] = 'title 太短（至少 4 个字符）';
}
if (mb_strlen($content, 'UTF-8') < 100) {
    $errors[] = 'content_html 太短（至少 100 个字符，注意是清洗后的长度：' . mb_strlen($content, 'UTF-8') . '）';
}
if (mb_strlen($content, 'UTF-8') * 3 > intval($cfg['max_content_kb']) * 1024) {
    $errors[] = 'content_html 过大（超过 ' . intval($cfg['max_content_kb']) . ' KB）';
}
if ($class1 <= 0) {
    $errors[] = 'class1 非法';
}
if (!in_array($class1, array_map('intval', (array)$cfg['allowed_class1']), true)) {
    $errors[] = 'class1=' . $class1 . ' 不在白名单内（只允许写入：' . implode(',', (array)$cfg['allowed_class1']) . '）';
}
if (!in_array($class2, array_map('intval', (array)$cfg['allowed_class2']), true)) {
    $errors[] = 'class2=' . $class2 . ' 不在白名单内（只允许：' . implode(',', (array)$cfg['allowed_class2']) . '）';
}
if ($errors) {
    api_log(array('ok' => 0, 'action' => 'validate', 'reason' => implode('；', $errors), 'title' => $title));
    api_out(1002, implode('；', $errors), array('errors' => $errors), 400);
}

// ---------------------------------------------------------------- 5. 限流

$recent = api_recent_count();
if (!$dry_run && intval($cfg['rate_per_hour']) > 0 && $recent >= intval($cfg['rate_per_hour'])) {
    api_log(array('ok' => 0, 'action' => 'ratelimit', 'reason' => 'over ' . $cfg['rate_per_hour'] . '/h', 'title' => $title));
    api_out(1004, '最近一小时已入库 ' . $recent . ' 篇，达到上限 ' . intval($cfg['rate_per_hour']) . ' 篇/小时', array(), 429);
}

// ---------------------------------------------------------------- 6. 连接数据库 + 栏目校验

list($link, $prefix) = api_db($cfg);
$table = $prefix . 'news';
$column = api_column_check($link, $prefix, $cfg, $class1, $class2, true);

// ---------------------------------------------------------------- 7. 查重

$dup = null;
if (!$force) {
    if ($source_url !== '') {
        $stmt = $link->prepare("SELECT id,title,displaytype FROM {$table} WHERE source_url = ? ORDER BY id DESC LIMIT 1");
        if ($stmt) {
            $stmt->bind_param('s', $source_url);
            $stmt->execute();
            $res = $stmt->get_result();
            $dup = $res ? $res->fetch_assoc() : null;
            $stmt->close();
        }
    }
    if (!$dup) {
        $stmt = $link->prepare("SELECT id,title,displaytype FROM {$table} WHERE title = ? ORDER BY id DESC LIMIT 1");
        if ($stmt) {
            $stmt->bind_param('s', $title);
            $stmt->execute();
            $res = $stmt->get_result();
            $dup = $res ? $res->fetch_assoc() : null;
            $stmt->close();
        }
    }
}

if ($dup) {
    $urls = api_urls($cfg, intval($dup['id']), $class1, $class2, $class3);
    api_log(array('ok' => 0, 'action' => 'duplicate', 'reason' => 'exists #' . $dup['id'], 'title' => $title));
    api_out(1001, '内容已存在，未重复写入', array(
        'duplicate'  => true,
        'id'         => intval($dup['id']),
        'title'      => $dup['title'],
        'published'  => intval($dup['displaytype']) === 1 ? true : false,
        'edit_url'   => $urls['edit_url'],
        'draft_url'  => $urls['draft_url'],
        'hint'       => '如需强行新增，请加 force=1',
    ), 409);
}

// ---------------------------------------------------------------- 8. 组装草稿数据

$now = date('Y-m-d H:i:s');
// 草稿：MetInfo 原生「待审核」= displaytype 0（前台列表条件为 displaytype=1），recycle 保持 0
$row = array(
    'title'       => $title,
    'ctitle'      => $ctitle,
    'keywords'    => $keywords,
    'description' => $description,
    'content'     => $content,
    'class1'      => $class1,
    'class2'      => $class2,
    'class3'      => $class3,
    'no_order'    => 0,
    'wap_ok'      => 1,
    'img_ok'      => 0,
    'imgurl'      => '',
    'imgurls'     => '',
    'com_ok'      => 0,
    'issue'       => (string)$cfg['issue'],
    'hits'        => 0,
    'updatetime'  => $now,
    'addtime'     => $now,
    'access'      => isset($column['access']) ? (string)$column['access'] : '0',
    'top_ok'      => 0,
    'filename'    => '',
    'lang'        => (string)$cfg['lang'],
    'recycle'     => 0,
    'displaytype' => 0,
    'tag'         => $tag,
    'links'       => '',
    'text_size'   => 0,
    'text_color'  => '',
    'other_info'  => '',
    'custom_info' => '',
    'publisher'   => $publisher,
    'source_url'  => $source_url,
    'is_original' => $is_original,
);
// 更严格的草稿策略：直接进回收站（前台连直链都打不开），后台「回收站」里可见
if ($cfg['draft_mode'] === 'recycle') {
    $row['recycle'] = 1;
}

if ($dry_run) {
    api_log(array('ok' => 0, 'action' => 'dry_run', 'reason' => 'checked', 'title' => $title));
    api_out(0, '校验通过（dry_run，未写库）', array(
        'would_insert' => array(
            'title'       => htmlspecialchars_decode($title, ENT_QUOTES),
            'class1'      => $class1,
            'class2'      => $class2,
            'content_len' => mb_strlen($content, 'UTF-8'),
            'tag'         => $tag,
            'publisher'   => htmlspecialchars_decode($publisher, ENT_QUOTES),
            'source_url'  => $source_url,
            'is_original' => $is_original,
            'displaytype' => $row['displaytype'],
            'recycle'     => $row['recycle'],
        ),
        'column' => $column,
    ));
}

// ---------------------------------------------------------------- 9. 写入

$cols = array_keys($row);
$placeholders = array();
$types = '';
$vals = array();
foreach ($row as $k => $v) {
    $placeholders[] = '?';
    $types .= 's';
    $vals[] = (string)$v;
}
$sql = 'INSERT INTO ' . $table . ' (`' . implode('`,`', $cols) . '`) VALUES (' . implode(',', $placeholders) . ')';

$stmt = $link->prepare($sql);
if (!$stmt) {
    api_log(array('ok' => 0, 'action' => 'insert', 'reason' => 'prepare failed: ' . $link->error, 'title' => $title));
    api_out(1005, 'SQL 预处理失败：' . $link->error, array(), 500);
}
// 绑定参数（PHP 5.6+ 支持展开）
$bind = array($types);
foreach ($vals as $i => $v) {
    $bind[] = &$vals[$i];
}
call_user_func_array(array($stmt, 'bind_param'), $bind);

if (!$stmt->execute()) {
    $err = $stmt->error;
    $stmt->close();
    api_log(array('ok' => 0, 'action' => 'insert', 'reason' => 'execute failed: ' . $err, 'title' => $title));
    api_out(1005, '写入失败：' . $err, array(), 500);
}
$id = $stmt->insert_id;
$stmt->close();

$urls = api_urls($cfg, $id, $class1, $class2, $class3);
api_log(array(
    'ok' => 1, 'action' => 'insert', 'id' => $id,
    'title' => htmlspecialchars_decode($title, ENT_QUOTES),
    'class1' => $class1, 'class2' => $class2,
    'source_url' => $source_url,
    'chars' => mb_strlen($content, 'UTF-8'),
    'model' => isset($input['model']) ? substr((string)$input['model'], 0, 40) : '',
    'duplicate' => 0,
));

api_out(0, '已写入草稿（待后台审核发布）', array(
    'duplicate'   => false,
    'id'          => intval($id),
    'draft'       => ($row['recycle'] == 1) ? 'recycle' : 'displaytype=0',
    'class1'      => $class1,
    'class2'      => $class2,
    'edit_url'    => $urls['edit_url'],
    'review_url'  => $urls['review_url'],
    'draft_url'   => $urls['draft_url'],
    'hint'        => '草稿不进前台列表；后台「资讯」列表里可编辑、预览、审核发布',
));

// ---------------------------------------------------------------- 栏目校验函数

/**
 * 校验栏目归属：必须是资讯模块下、且在白名单内的栏目
 *
 * @param mysqli $link
 * @param string $prefix
 * @param array $cfg
 * @param int $class1
 * @param int $class2
 * @param bool $strict true=校验失败直接输出错误结束
 * @return array 栏目信息
 */
function api_column_check($link, $prefix, $cfg, $class1, $class2, $strict = true)
{
    $table = $prefix . 'column';
    $info = array('class1' => $class1, 'class2' => $class2, 'name' => '', 'module' => 0, 'foldername' => 'news', 'access' => '0');
    $ids = array($class1);
    if ($class2) {
        $ids[] = $class2;
    }
    $idlist = implode(',', array_map('intval', $ids));
    $rs = $link->query("SELECT id,name,module,bigclass,foldername,access FROM {$table} WHERE id IN ({$idlist})");
    $found = array();
    if ($rs) {
        while ($r = $rs->fetch_assoc()) {
            $found[intval($r['id'])] = $r;
        }
    }
    // 一级栏目必须是资讯模块（module=2）
    if (empty($found[$class1]) || intval($found[$class1]['module']) !== 2) {
        if ($strict) {
            api_out(1002, 'class1=' . $class1 . ' 不是资讯模块的栏目（或不存在）', array(), 400);
        }
        return $info;
    }
    $info['name'] = $found[$class1]['name'];
    $info['module'] = intval($found[$class1]['module']);
    $info['foldername'] = $found[$class1]['foldername'] ? $found[$class1]['foldername'] : 'news';
    $info['access'] = $found[$class1]['access'];
    // 二级栏目必须挂在这个一级栏目下
    if ($class2) {
        if (empty($found[$class2]) || intval($found[$class2]['bigclass']) !== $class1) {
            if ($strict) {
                api_out(1002, 'class2=' . $class2 . ' 不是栏目 ' . $class1 . ' 下的子栏目', array(), 400);
            }
            return $info;
        }
        $info['sub_name'] = $found[$class2]['name'];
        $info['access'] = $found[$class2]['access'];
    }
    return $info;
}
