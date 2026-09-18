<?php
/**
 * SEO/GEO 工具：统一站点域名并重建 sitemap.xml / robots.txt
 *
 * 用法（CLI）：
 *   php tools/rebuild_seo.php                     按当前后台配置的站点地址重建
 *   php tools/rebuild_seo.php https://www.xxx.com 先把站点地址改为该域名，再重建
 *
 * 说明：域名必须以 http:// 或 https:// 开头，并以 / 结尾（脚本会自动补全末尾斜杠）。
 *      重建后会自动清理系统与模板缓存，使新的站点地址立即生效。
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

// 1. 域名
if (isset($argv[1]) && $argv[1] !== '') {
    $domain = rtrim($argv[1], '/') . '/';
    if (!preg_match('#^https?://#i', $domain)) {
        exit("域名必须以 http:// 或 https:// 开头\n");
    }
    $st = $db->prepare("UPDATE {$pre}config SET value=? WHERE name='met_weburl'");
    $st->bind_param('s', $domain);
    $st->execute();
    echo "站点地址已更新为：{$domain}（影响 " . $st->affected_rows . " 条配置）\n";
    $st->close();
} else {
    $r = $db->query("SELECT value FROM {$pre}config WHERE name='met_weburl' LIMIT 1");
    $row = $r ? $r->fetch_assoc() : array('value' => '');
    $domain = rtrim(isset($row['value']) ? $row['value'] : '', '/') . '/';
    echo "使用后台配置站点地址：{$domain}\n";
}

// 2. 收集 URL
$urls = array();
$add = function ($loc, $priority = '0.6', $lastmod = '') use (&$urls) {
    if (!$loc) {
        return;
    }
    $urls[$loc] = array('priority' => $priority, 'lastmod' => $lastmod ? $lastmod : date('Y-m-d'));
};

$add($domain, '1.0');

// 栏目（排除表单、会员、搜索、外部链接等无收录价值栏目）
$skipModule = array(0, 7, 8, 10, 11, 12);
// 说明：isshow 只用于单页(module=1)的显示判断，不能作为收录过滤条件，
// 否则会把「中医馆(104)」这类 isshow=0 的一级栏目及其全部内容排除在 sitemap 之外。
// display=1 为已隐藏栏目（内容待补），不进 sitemap
$r = $db->query("SELECT id,name,foldername,module,bigclass,display FROM {$pre}column WHERE lang='cn' ORDER BY no_order,id");
$columns = array();
while ($x = $r->fetch_assoc()) {
    $columns[$x['id']] = $x;
}
foreach ($columns as $id => $c) {
    if (in_array(intval($c['module']), $skipModule)) {
        continue;
    }
    if (isset($c['display']) && intval($c['display']) === 1) {
        continue;
    }
    if (empty($c['foldername'])) {
        continue;
    }
    if ($c['module'] == 1) {
        // 单页：about 及其子栏目统一使用所在目录的 show.php
        $folder = $c['foldername'];
        $add($domain . $folder . '/show.php?id=' . $id, '0.7');
    } else {
        $add($domain . $c['foldername'] . '/', '0.8');
    }
}

// 内容详情
$contentMap = array(
    array('table' => $pre . 'news', 'module' => 2, 'file' => 'shownews.php'),
    array('table' => $pre . 'product', 'module' => 3, 'file' => 'showproduct.php'),
    array('table' => $pre . 'doctor', 'module' => 14, 'file' => 'showdoctor.php'),
    array('table' => $pre . 'activity', 'module' => 15, 'file' => 'showactivity.php'),
    array('table' => $pre . 'shaoer', 'module' => 16, 'file' => 'showshaoer.php'),
);
foreach ($contentMap as $m) {
    $res = @$db->query("SHOW TABLES LIKE '{$m['table']}'");
    if (!$res || !$res->num_rows) {
        continue;
    }
    $folderMap = array();
    foreach ($columns as $cid => $c) {
        if (intval($c['module']) == $m['module'] && !empty($c['foldername'])) {
            $folderMap[$cid] = $c['foldername'];
        }
    }
    if (!$folderMap) {
        continue;
    }
    $hasRecycle = false;
    $rc = $db->query("SHOW COLUMNS FROM {$m['table']} LIKE 'recycle'");
    if ($rc && $rc->num_rows) {
        $hasRecycle = true;
    }
    $hasUpdatetime = false;
    $rc2 = $db->query("SHOW COLUMNS FROM {$m['table']} LIKE 'updatetime'");
    if ($rc2 && $rc2->num_rows) {
        $hasUpdatetime = true;
    }
    $fields = array('id', 'class1');
    if ($hasRecycle) {
        $fields[] = 'recycle';
    }
    if ($hasUpdatetime) {
        $fields[] = 'updatetime';
    }
    $hasContent = false;
    $rc3 = $db->query("SHOW COLUMNS FROM {$m['table']} LIKE 'content'");
    if ($rc3 && $rc3->num_rows) {
        $hasContent = true;
        $fields[] = 'content';
    }
    $sql = 'SELECT ' . implode(',', $fields) . " FROM {$m['table']} WHERE lang='cn'";
    $rr = @$db->query($sql);
    if (!$rr) {
        continue;
    }
    while ($x = $rr->fetch_assoc()) {
        if ($hasRecycle && intval($x['recycle']) > 0) {
            continue;
        }
        // 薄内容（正文不足 300 字）暂不提交给搜索引擎，正文补全后自动纳入
        if ($hasContent) {
            $plain = trim(strip_tags(isset($x['content']) ? (string)$x['content'] : ''));
            $len = function_exists('mb_strlen') ? mb_strlen($plain, 'UTF-8') : strlen($plain);
            if ($len < 300) {
                continue;
            }
        }
        $cid = intval($x['class1']);
        // 内容归属栏目：优先一级栏目
        if (!isset($folderMap[$cid])) {
            if (isset($columns[$cid]) && !empty($columns[$cid]['bigclass'])) {
                $cid = intval($columns[$cid]['bigclass']);
            }
        }
        if (!isset($folderMap[$cid])) {
            continue;
        }
        $last = ($hasUpdatetime && !empty($x['updatetime'])) ? date('Y-m-d', strtotime($x['updatetime'])) : date('Y-m-d');
        $add($domain . $folderMap[$cid] . '/' . $m['file'] . '?id=' . intval($x['id']), '0.6', $last);
    }
}

// 地区聚合页（/region/）：索引页 + 市级页 + 区/县级页
// 只收录条目数达到 2 条及以上的地区，避免薄内容进入 sitemap
$regionTable = $pre . 'product';
$res = @$db->query("SHOW TABLES LIKE '{$regionTable}'");
if ($res && $res->num_rows) {
    $hasRegion = false;
    $rc = $db->query("SHOW COLUMNS FROM {$regionTable} LIKE 'region_city'");
    if ($rc && $rc->num_rows) {
        $hasRegion = true;
    }
    $hasDisplay = false;
    $rc2 = $db->query("SHOW COLUMNS FROM {$regionTable} LIKE 'displaytype'");
    if ($rc2 && $rc2->num_rows) {
        $hasDisplay = true;
    }
    if ($hasRegion) {
        $where = "WHERE lang='cn' AND recycle=0 AND region_city<>''";
        if ($hasDisplay) {
            $where .= " AND displaytype!=-1";
        }
        $sql = "SELECT region_city, region_district, COUNT(*) AS cnt, MAX(updatetime) AS lastmod FROM {$regionTable} {$where} GROUP BY region_city, region_district ORDER BY region_city ASC, cnt DESC";
        $rr = @$db->query($sql);
        $cities = array();   // city => array('total' => n, 'last' => date)
        $districts = array(); // city => array(district => array('cnt' => n, 'last' => date))
        if ($rr) {
            while ($x = $rr->fetch_assoc()) {
                $c = trim($x['region_city']);
                if ($c === '') {
                    continue;
                }
                $d = trim($x['region_district']);
                $cnt = intval($x['cnt']);
                $last = !empty($x['lastmod']) ? date('Y-m-d', strtotime($x['lastmod'])) : date('Y-m-d');
                if (!isset($cities[$c])) {
                    $cities[$c] = array('total' => 0, 'last' => $last);
                }
                $cities[$c]['total'] += $cnt;
                if (strtotime($last) > strtotime($cities[$c]['last'])) {
                    $cities[$c]['last'] = $last;
                }
                if ($d !== '') {
                    $districts[$c][$d] = array('cnt' => $cnt, 'last' => $last);
                }
            }
        }
        $regionCount = 0;
        foreach ($cities as $c => $info) {
            if ($info['total'] >= 2) {
                $add($domain . 'region/?city=' . rawurlencode($c), '0.7', $info['last']);
                $regionCount++;
            }
            if (isset($districts[$c])) {
                foreach ($districts[$c] as $d => $di) {
                    if ($di['cnt'] >= 2) {
                        $add($domain . 'region/?city=' . rawurlencode($c) . '&district=' . rawurlencode($d), '0.6', $di['last']);
                        $regionCount++;
                    }
                }
            }
        }
        if ($regionCount) {
            $add($domain . 'region/', '0.7');
            echo "地区聚合页：{$regionCount} 个（含索引页）\n";
        }
    }
}

// 3. 生成 sitemap.xml
$xml = '<?xml version="1.0" encoding="utf-8"?>' . "\n";
$xml .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";
foreach ($urls as $loc => $info) {
    $xml .= "  <url>\n";
    $xml .= '    <loc>' . htmlspecialchars($loc, ENT_XML1 | ENT_COMPAT, 'UTF-8') . "</loc>\n";
    $xml .= '    <priority>' . $info['priority'] . "</priority>\n";
    $xml .= '    <lastmod>' . $info['lastmod'] . "</lastmod>\n";
    $xml .= "  </url>\n";
}
$xml .= '</urlset>';
file_put_contents(ROOT_PATH . 'sitemap.xml', $xml);
echo 'sitemap.xml 已重建，共 ' . count($urls) . " 条 URL\n";

// 4. 生成 robots.txt
$robots = "# robots.txt - 四川中医馆（四川中医网）\n";
$robots .= "User-agent: *\n";
$robots .= "Allow: /\n\n";
$robots .= "# 后台与系统目录\n";
$robots .= "Disallow: /admin/\n";
$robots .= "Disallow: /app/\n";
$robots .= "Disallow: /cache/\n";
$robots .= "Disallow: /templates/\n";
$robots .= "Disallow: /install/\n";
$robots .= "Disallow: /config/\n";
$robots .= "Disallow: /*?lang=\n\n";
$robots .= "# 站点地图\n";
$robots .= 'Sitemap: ' . $domain . "sitemap.xml\n";
file_put_contents(ROOT_PATH . 'robots.txt', $robots);
echo "robots.txt 已重建，Sitemap 指向：" . $domain . "sitemap.xml\n";

// 5. 清理缓存
$cacheDirs = array(
    ROOT_PATH . 'cache/',
    ROOT_PATH . 'cache/templates/',
    ROOT_PATH . 'cache/config/',
    ROOT_PATH . 'cache/data/',
    ROOT_PATH . 'templates/m1156ui010/cache/',
);
$cleared = 0;
foreach ($cacheDirs as $dir) {
    if (!is_dir($dir)) {
        continue;
    }
    $files = glob($dir . '*.php');
    foreach ((array)$files as $f) {
        if (is_file($f)) {
            @unlink($f);
            $cleared++;
        }
    }
}
echo "已清理缓存文件：{$cleared} 个\n";
echo "完成。请确认后台「系统设置 → 网站地址」与 sitemap、robots、og:url 三者一致。\n";
