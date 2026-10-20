<?php
// 医师页标题优化：若简介/正文含「名中医」等权威头衔，优先替换页面标题中的职称后缀。
// 这样 <title>、搜索结果与结构化数据都会显示更权威的职称（如「四川省名中医」而非「主治医师」）。
$_seo_honor = '';
if (isset($data['module']) && intval($data['module']) === 14 && !empty($data['page_title'])) {
    $_seo_honor_search = '';
    if (!empty($data['page_description'])) {
        $_seo_honor_search .= (string)$data['page_description'] . ' ';
    }
    if (!empty($data['description'])) {
        $_seo_honor_search .= (string)$data['description'] . ' ';
    }
    if (!empty($data['content'])) {
        $_seo_honor_search .= mb_substr(strip_tags((string)$data['content']), 0, 500, 'UTF-8');
    }
    if (preg_match('/([^\\s,，;；]{0,15}名中医)/u', $_seo_honor_search, $_m_honor)) {
        $_seo_honor = $_m_honor[1];
        if (preg_match('/^(.*?)[（(].*?[）)]$/u', $data['page_title'], $_m_title)) {
            $data['page_title'] = $_m_title[1] . '（' . $_seo_honor . '）';
        } else {
            $data['page_title'] = $data['page_title'] . '（' . $_seo_honor . '）';
        }
    }
}
?>
<met_meta page="$met_page" /><ui name="head_nav" style="met_m1156_7" id="1" />
<ui name="banner" style="met_m1156_2" id="52" />
<?php
/**
 * SEO / GEO：结构化数据（schema.org JSON-LD）与社交媒体卡片
 * 作用：帮助搜索引擎与生成式引擎（AI 搜索）准确识别站点实体、栏目与内容（中医馆/中医师/活动/资讯）
 */
$_seo_site   = isset($_M['url']['web_site']) ? $_M['url']['web_site'] : '';
$_seo_name   = isset($c['met_webname']) ? $c['met_webname'] : '';
$_seo_desc   = isset($c['met_description']) ? $c['met_description'] : '';
$_seo_title  = isset($data['page_title']) ? $data['page_title'] : '';
$_seo_pdesc  = isset($data['page_description']) && $data['page_description'] ? $data['page_description'] : $_seo_desc;
// 统一规范为「站点根 + 带前导斜杠的路径」，避免 $data['url'] 缺前导斜杠时把 @id/url 拼成无效地址
$_seo_cur    = rtrim($_seo_site, '/') . '/' . ltrim(str_replace('../', '', isset($data['url']) ? (string)$data['url'] : ''), '/');
// 机构对外信息：如需调整电话或社交账号主页，只改这里即可
$_seo_tel    = ''; // 咨询电话（不需要对外展示时置为空字符串）
// 平台官方主页（sameAs）：供搜索引擎与生成式引擎做实体消歧/引用。
// 优先读取后台「页脚设置」已填的新浪微博主页；其余在下方数组手动维护真实 URL。
// 没有就保持空数组（不影响其它结构化数据）。注意：不要编造不存在的 URL。
$_seo_sameas = array();
if (!empty($c['footinfo_sina']) && stripos((string)$c['footinfo_sina'], 'http') === 0) {
    $_seo_sameas[] = (string)$c['footinfo_sina'];
}
// 手动补充示例（取消注释并替换为真实地址即可生效）：
// $_seo_sameas[] = 'https://weibo.com/你的微博UID';
// $_seo_sameas[] = 'https://www.douyin.com/user/你的抖音ID';
// $_seo_sameas[] = 'https://www.qcc.com/web/search?key=四川中医馆';
$_seo_img    = '';
if (!empty($data['imgurl'])) {
    $_seo_img = $_seo_site . str_replace('../', '', $data['imgurl']);
} elseif (!empty($c['met_logo'])) {
    $_seo_img = $_seo_site . str_replace('../', '', $c['met_logo']);
}
$_seo_clean = function ($s) {
    $s = html_entity_decode(strip_tags((string)$s), ENT_QUOTES, 'UTF-8');
    return trim(preg_replace('/\s+/', ' ', $s));
};
$_seo_abs = function ($u) use ($_seo_site) {
    return $_seo_site . str_replace('../', '', (string)$u);
};
// 取产品参数值（参数管理里「地点/电话/官网/经纬度」等），用于 JSON-LD 真实字段填充
$_seo_para = function ($n) use ($data) {
    if (empty($data['para']) || !is_array($data['para'])) {
        return '';
    }
    foreach ($data['para'] as $_seo_p) {
        if (isset($_seo_p['name']) && (string)$_seo_p['name'] === (string)$n && isset($_seo_p['value'])) {
            return trim((string)$_seo_p['value']);
        }
    }
    return '';
};

// 产品详情页（中医馆，module=3）若未单独设置 SEO 描述，则用「擅长项目 + 地址 + 医保」动态生成，
// 让大多数未手动优化描述的馆也拥有唯一、命中长尾意图的 meta / JSON-LD 描述，缓解 meta 雷同导致的低 CTR
if (empty($data['page_description']) && !empty($data['module']) && intval($data['module']) === 3 && !empty($data['id'])) {
    $_seo_spec = array();
    if (!empty($data['specialty_list']) && is_array($data['specialty_list'])) {
        foreach (array_slice($data['specialty_list'], 0, 6) as $_seo_sp) {
            $_seo_sp = $_seo_clean($_seo_sp);
            if ($_seo_sp !== '') {
                $_seo_spec[] = $_seo_sp;
            }
        }
    }
    $_seo_addr = '';
    if (!empty($data['para']) && is_array($data['para'])) {
        foreach ($data['para'] as $_seo_p) {
            if (!empty($_seo_p['name']) && $_seo_p['name'] === '地点' && !empty($_seo_p['value'])) {
                $_seo_addr = $_seo_clean($_seo_p['value']);
            }
        }
    }
    $_seo_built = $_seo_clean($data['title']) . '是成都的中医诊疗机构';
    if ($_seo_addr !== '') {
        $_seo_built .= '，位于' . $_seo_addr;
    }
    if ($_seo_spec) {
        $_seo_built .= '，擅长' . implode('、', $_seo_spec);
    }
    $_seo_built .= '。提供针灸、推拿、艾灸、拔罐及中医内科等调理服务，医保与收费以医馆现场公示为准，就诊前建议电话确认。';
    $_seo_pdesc = $_seo_built;
}
?>
<?php
// canonical：统一规范链接，避免 / 与 /index.php?lang=cn 等重复内容被分别收录
$_seo_can_mark = isset($_M['html_plugin']['head_script']) ? $_M['html_plugin']['head_script'] : '';
if (strpos($_seo_can_mark, 'canonical') === false) {
    if (!empty($data['canonical'])) {
        // 地区聚合页等自定义页面：带查询参数的地址需要保留参数，避免全部归一到同一 URL
        $_seo_can_abs = strpos($data['canonical'], 'http') === 0
            ? (string)$data['canonical']
            : rtrim($_seo_site, '/') . '/' . ltrim(str_replace('../', '', (string)$data['canonical']), '/');
        echo '<link rel="canonical" href="' . htmlspecialchars($_seo_can_abs, ENT_QUOTES, 'UTF-8') . '" />' . "\n";
    } else {
        $_seo_can = isset($data['url']) ? str_replace('../', '', (string)$data['url']) : '';
        if ($_seo_can === '' || strpos($_seo_can, 'index.php') !== false) {
            $_seo_can = isset($_SERVER['REQUEST_URI']) ? (string)$_SERVER['REQUEST_URI'] : '/';
        }
        if (strpos($_seo_can, '?') !== false && strpos($_seo_can, 'id=') === false) {
            $_seo_can = strtok($_seo_can, '?');
        }
        $_seo_can = str_replace('index.php', '', $_seo_can);
        $_seo_can = '/' . ltrim($_seo_can, '/');
        echo '<link rel="canonical" href="' . htmlspecialchars(rtrim($_seo_site, '/') . $_seo_can, ENT_QUOTES, 'UTF-8') . '" />' . "\n";
    }
}
?>
<?php
// 已隐藏栏目（内容待补）：从导航/网站地图移除后，仍可能通过直接地址访问，这里补 noindex
// 米拓栏目表 display=1 即不出现在导航与栏目循环；栏目ID 见后台「栏目管理」
$_seo_hidden_columns = array(105); // 105 医师团队（仍为模板 demo 数据，待真实医师图文替换后放开）；109 医馆环境已有内容，已放开
$_seo_hide = !empty($data['noindex']);
if (!$_seo_hide && !empty($data['classnow']) && in_array(intval($data['classnow']), $_seo_hidden_columns, true)) {
    $_seo_hide = true;
}
if (!$_seo_hide && !empty($data['class1']) && in_array(intval($data['class1']), $_seo_hidden_columns, true)) {
    $_seo_hide = true;
}
// 薄内容控制：详情页（有 id 的正式内容页）一律允许收录，不再用固定字数门槛硬性 noindex，
// 避免误伤商品/医师/资讯等核心页面；空内容页的质量判断交给搜索引擎本身。
// 若确需排除真正空内容页，可放开下面注释并设极低阈值（如 <20 字）：
// if (!$_seo_hide && !empty($data['id'])) {
//     $_seo_plain = '';
//     if (!empty($data['content'])) $_seo_plain .= (string)$data['content'];
//     if (!empty($data['contents']) && is_array($data['contents'])) {
//         foreach ($data['contents'] as $_seo_c) { if (!empty($_seo_c['content'])) $_seo_plain .= (string)$_seo_c['content']; }
//     }
//     $_seo_plain = preg_replace('/<!--met-rel-start-->.*?<!--met-rel-end-->/s', '', $_seo_plain);
//     $_seo_plain = trim(strip_tags(html_entity_decode($_seo_plain, ENT_QUOTES, 'UTF-8')));
//     $_seo_plain_len = function_exists('mb_strlen') ? mb_strlen($_seo_plain, 'UTF-8') : strlen($_seo_plain);
//     if ($_seo_plain_len < 20) $_seo_hide = true;
// }
// 站内搜索页：结果由查询词动态生成，不参与索引
if (!$_seo_hide && isset($_SERVER['REQUEST_URI']) && strpos((string)$_SERVER['REQUEST_URI'], '/search/') !== false) {
    $_seo_hide = true;
}
// 参数筛选页 / 标签聚合页：参数组合无限、内容高度重复，统一 noindex
// 放行：分页(page/dpage)、内容 id、栏目 class1-3、可视化 pageset、语言 lang
// 地区聚合页等自定义页面自带 canonical，已在下方判断中跳过
if (!$_seo_hide && empty($data['canonical'])) {
    $_seo_qs = isset($_SERVER['QUERY_STRING']) ? trim((string)$_SERVER['QUERY_STRING']) : '';
    if ($_seo_qs !== '') {
        parse_str($_seo_qs, $_seo_query);
        // metid / pseudo_jump 是米拓伪静态的内部重写参数（每个详情页都会带），
        // 必须放行；否则 /news/62.html、/product/33.html 等全会被误判成
        // 「参数组合页」而输出 noindex，导致详情页永远不被搜索引擎收录。
        foreach (array('lang', 'page', 'dpage', 'pageset', 'id', 'metid', 'pseudo_jump', 'class1', 'class2', 'class3', 'list') as $_seo_allow) {
            unset($_seo_query[$_seo_allow]);
        }
        if ($_seo_query) {
            $_seo_hide = true;
        }
    }
}
if ($_seo_hide) { ?>
<meta name="robots" content="noindex,follow" />
<?php } ?>
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="<?php echo htmlspecialchars($_seo_title, ENT_QUOTES, 'UTF-8'); ?>" />
<meta name="twitter:description" content="<?php echo htmlspecialchars($_seo_clean($_seo_pdesc), ENT_QUOTES, 'UTF-8'); ?>" />
<?php if ($_seo_img) { ?>
<meta name="twitter:image" content="<?php echo htmlspecialchars($_seo_img, ENT_QUOTES, 'UTF-8'); ?>" />
<?php } ?>
<?php // Open Graph：微信/QQ/微博等分享卡片依赖 og: 抓取标题/描述/缩略图 ?>
<meta property="og:type" content="website" />
<meta property="og:title" content="<?php echo htmlspecialchars($_seo_title, ENT_QUOTES, 'UTF-8'); ?>" />
<meta property="og:description" content="<?php echo htmlspecialchars($_seo_clean($_seo_pdesc), ENT_QUOTES, 'UTF-8'); ?>" />
<meta property="og:url" content="<?php echo htmlspecialchars($_seo_cur, ENT_QUOTES, 'UTF-8'); ?>" />
<meta property="og:site_name" content="<?php echo htmlspecialchars($_seo_name, ENT_QUOTES, 'UTF-8'); ?>" />
<?php if ($_seo_img) { ?>
<meta property="og:image" content="<?php echo htmlspecialchars($_seo_img, ENT_QUOTES, 'UTF-8'); ?>" />
<?php } ?>
<?php
$_seo_graph = array();

// 站点
$_seo_graph[] = array(
    '@type'       => 'WebSite',
    '@id'         => $_seo_site . '#website',
    'name'        => $_seo_name,
    'url'         => $_seo_site,
    'description' => $_seo_clean($_seo_desc),
    'inLanguage'  => 'zh-CN',
    'publisher'   => array('@id' => $_seo_site . '#organization'),
    // 站内搜索：米拓搜索页真实地址为 search/index.php?lang=xx&searchword=关键词
    'potentialAction' => array(
        '@type'       => 'SearchAction',
        'target'      => array(
            '@type'       => 'EntryPoint',
            'urlTemplate' => rtrim($_seo_site, '/') . '/search/index.php?lang=' . (isset($_M['lang']) ? $_M['lang'] : 'cn') . '&searchword={search_term_string}',
        ),
        'query-input' => 'required name=search_term_string',
    ),
);

// 机构（站点主体）：中医医疗信息平台，使用 MedicalOrganization 便于 AI 识别行业属性
$_seo_org = array(
    '@type'       => array('Organization', 'MedicalOrganization'),
    '@id'         => $_seo_site . '#organization',
    'name'        => $_seo_name,
    'url'         => $_seo_site,
    'description' => $_seo_clean($_seo_desc),
    'areaServed'  => array(
        array('@type' => 'City', 'name' => '成都市'),
        array('@type' => 'State', 'name' => '四川省'),
    ),
    'knowsAbout'  => array('中医馆', '名老中医', '中医养生', '药食同源', '少儿中医研学', '中医活动', '中医针灸'),
    'medicalSpecialty' => array('中医儿科', '针灸推拿', '中医养生', '少儿中医研学', '药食同源'),
    'address'     => array(
        '@type'           => 'PostalAddress',
        'addressCountry'  => 'CN',
        'addressRegion'   => '四川省',
        'addressLocality' => '成都市',
    ),
);
if ($_seo_tel) {
    $_seo_org['telephone'] = $_seo_tel;
}
if ($_seo_sameas) {
    $_seo_org['sameAs'] = array_values($_seo_sameas);
}
if ($_seo_img) {
    $_seo_org['logo'] = array('@type' => 'ImageObject', 'url' => $_seo_img);
}
$_seo_graph[] = $_seo_org;

// 面包屑
$_seo_items = array();
$_seo_pos   = 1;
$_seo_items[] = array('@type' => 'ListItem', 'position' => $_seo_pos, 'name' => '首页', 'item' => $_seo_site);
$_seo_col = array();
if (!empty($data['classnow']) && $data['classnow'] != 10001) {
    try {
        $_seo_column_label = load::sys_class('label', 'new')->get('column');
        $_seo_col = $_seo_column_label->get_column_id(intval($data['classnow']));
    } catch (Throwable $e) {
        $_seo_col = array();
    }
}
if (!empty($_seo_col['name'])) {
    if (!empty($_seo_col['bigclass'])) {
        try {
            $_seo_parent = load::sys_class('label', 'new')->get('column')->get_column_id(intval($_seo_col['bigclass']));
        } catch (Throwable $e) {
            $_seo_parent = array();
        }
        if (!empty($_seo_parent['name'])) {
            $_seo_pos++;
            $_seo_items[] = array('@type' => 'ListItem', 'position' => $_seo_pos, 'name' => $_seo_parent['name'], 'item' => $_seo_abs($_seo_parent['url']));
        }
    }
    $_seo_pos++;
    $_seo_items[] = array('@type' => 'ListItem', 'position' => $_seo_pos, 'name' => $_seo_col['name'], 'item' => $_seo_abs($_seo_col['url']));
}
// 地区聚合页：市/州、区/县 两级追加到面包屑（由 region 模块传入）
if (!empty($data['region_breadcrumb']) && is_array($data['region_breadcrumb'])) {
    foreach ($data['region_breadcrumb'] as $_seo_rb) {
        if (empty($_seo_rb['name']) || $_seo_rb['name'] === '首页') {
            continue;
        }
        if (!empty($_seo_col['name']) && $_seo_rb['name'] === $_seo_col['name']) {
            continue;
        }
        $_seo_pos++;
        $_seo_items[] = array('@type' => 'ListItem', 'position' => $_seo_pos, 'name' => $_seo_clean($_seo_rb['name']), 'item' => isset($_seo_rb['url']) ? (string)$_seo_rb['url'] : '');
    }
}
$_seo_is_detail = !empty($data['id']) && !empty($data['module']) && in_array($data['module'], array(2, 3, 14, 15, 16));
if ($_seo_is_detail) {
    $_seo_pos++;
    $_seo_items[] = array('@type' => 'ListItem', 'position' => $_seo_pos, 'name' => $_seo_clean($data['title']), 'item' => $_seo_cur);
}
$_seo_graph[] = array(
    '@type'           => 'BreadcrumbList',
    '@id'             => $_seo_cur . '#breadcrumb',
    'itemListElement' => $_seo_items,
);

// 当前页
$_seo_module = isset($data['module']) ? intval($data['module']) : 0;
$_seo_page   = array(
    '@type'       => 'WebPage',
    '@id'         => $_seo_cur . '#webpage',
    'url'         => $_seo_cur,
    'name'        => $_seo_title,
    'description' => $_seo_clean($_seo_pdesc),
    'inLanguage'  => 'zh-CN',
    'isPartOf'    => array('@id' => $_seo_site . '#website'),
    'breadcrumb'  => array('@id' => $_seo_cur . '#breadcrumb'),
);
if (!empty($_seo_col['name'])) {
    $_seo_page['about'] = array('@type' => 'Thing', 'name' => $_seo_col['name']);
}

// 详情页实体：按模块输出对应类型，便于搜索引擎与生成式引擎识别
if ($_seo_is_detail) {
    $_seo_entity = array();
    switch ($_seo_module) {
        case 14: // 中医师
            $_seo_entity = array(
                '@type'       => 'Physician',
                '@id'         => $_seo_cur . '#physician',
                'name'        => $_seo_clean($data['title']),
                'url'         => $_seo_cur,
                'description' => $_seo_clean($_seo_pdesc),
                'medicalSpecialty' => '中医',
                'knowsAbout'  => array('中医', '中医内科', '针灸', '推拿', '中药调理'),
            );
            // 若简介含「名中医」等权威头衔，输出到 Physician 的 jobTitle，
            // 供搜索引擎/AI 引擎识别医师等级，与页面标题保持一致。
            if (!empty($_seo_honor)) {
                $_seo_entity['jobTitle'] = $_seo_honor;
            }
            //医师「擅长」长文本：拆成短语输出到 knowsAbout（过长或无有效短语时保留默认值）
            if (!empty($data['specialty_text'])) {
                $_seo_spec_items = preg_split('/[、，,；;\/\|\n\r]+/u', (string)$data['specialty_text']);
                $_seo_spec_ok = array();
                foreach ((array)$_seo_spec_items as $_seo_si) {
                    $_seo_si = $_seo_clean($_seo_si);
                    if ($_seo_si === '') {
                        continue;
                    }
                    $_seo_len = function_exists('mb_strlen') ? mb_strlen($_seo_si, 'UTF-8') : strlen($_seo_si);
                    if ($_seo_len >= 2 && $_seo_len <= 20) {
                        $_seo_spec_ok[] = $_seo_si;
                    }
                    if (count($_seo_spec_ok) >= 10) {
                        break;
                    }
                }
                if ($_seo_spec_ok) {
                    $_seo_entity['knowsAbout'] = array_values(array_unique($_seo_spec_ok));
                }
            }
            if (!empty($data['hospital'])) {
                $_seo_entity['worksFor'] = array('@type' => 'MedicalOrganization', 'name' => $_seo_clean($data['hospital']));
            }
            if (!empty($data['school'])) {
                $_seo_entity['alumniOf'] = array('@type' => 'EducationalOrganization', 'name' => $_seo_clean($data['school']));
            }
            if (!empty($data['fee'])) {
                $_seo_entity['priceRange'] = '¥' . intval($data['fee']);
            }
            break;
        case 15: // 中医活动
            // 无排期（如活动综述、资讯型内容）：输出 Article，避免产出缺 startDate 的无效 Event
            if (empty($data['start_time'])) {
                $_seo_entity = array(
                    '@type'            => 'Article',
                    '@id'              => $_seo_cur . '#article',
                    'headline'         => mb_substr($_seo_clean($data['title']), 0, 110),
                    'url'              => $_seo_cur,
                    'description'      => $_seo_clean($_seo_pdesc),
                    'inLanguage'       => 'zh-CN',
                    'author'           => array('@id' => $_seo_site . '#organization'),
                    'publisher'        => array('@id' => $_seo_site . '#organization'),
                    'mainEntityOfPage' => array('@id' => $_seo_cur . '#webpage'),
                );
                if (!empty($data['addtime'])) {
                    $_seo_entity['datePublished'] = str_replace(' ', 'T', trim($data['addtime'])) . '+08:00';
                }
                if (!empty($data['updatetime'])) {
                    $_seo_entity['dateModified'] = str_replace(' ', 'T', trim($data['updatetime'])) . '+08:00';
                }
                break;
            }
            $_seo_entity = array(
                '@type'       => 'Event',
                '@id'         => $_seo_cur . '#event',
                'name'        => $_seo_clean($data['title']),
                'url'         => $_seo_cur,
                'description' => $_seo_clean($_seo_pdesc),
                'eventStatus' => 'https://schema.org/EventScheduled',
                'organizer'   => array('@id' => $_seo_site . '#organization'),
            );
            if (!empty($data['start_time'])) {
                $_seo_entity['startDate'] = $_seo_clean($data['start_time']);
            }
            if (!empty($data['end_time'])) {
                $_seo_entity['endDate'] = $_seo_clean($data['end_time']);
            }
            if (!empty($data['location'])) {
                $_seo_entity['location'] = array(
                    '@type'   => 'Place',
                    'name'    => $_seo_clean($data['location']),
                    'address' => array('@type' => 'PostalAddress', 'addressCountry' => 'CN'),
                );
            }
            if (isset($data['is_free'])) {
                $_seo_entity['isAccessibleForFree'] = $data['is_free'] ? true : false;
            }
            break;
        case 3: // 中医馆
            $_seo_entity = array(
                '@type'       => 'MedicalClinic',
                '@id'         => $_seo_cur . '#clinic',
                'name'        => $_seo_clean($data['title']),
                'url'         => $_seo_cur,
                'description' => $_seo_clean($_seo_pdesc),
                'knowsAbout'  => '中医',
            );
            // 地址：国家/省/市/区 + 街道（街道来自参数「地点」，约 23 家馆已填）
            $_seo_addr = array('@type' => 'PostalAddress', 'addressCountry' => 'CN');
            if (!empty($data['region_city'])) {
                $_seo_addr['addressRegion'] = $_seo_clean($data['region_city']);
            }
            if (!empty($data['region_district'])) {
                $_seo_addr['addressLocality'] = $_seo_clean($data['region_district']);
            }
            $_seo_street = $_seo_para('地点');
            if ($_seo_street !== '') {
                $_seo_addr['streetAddress'] = $_seo_street;
            }
            $_seo_entity['address'] = $_seo_addr;
            // 电话（参数「电话」，约 16 家馆已填）
            $_seo_tel = $_seo_para('电话');
            if ($_seo_tel !== '') {
                $_seo_entity['telephone'] = $_seo_tel;
            }
            // 服务区域（本地 GEO 信号）
            $_seo_entity['areaServed'] = array(
                array('@type' => 'City', 'name' => '成都市'),
                array('@type' => 'State', 'name' => '四川省'),
            );
            // 结构化字段：擅长项目
            if (!empty($data['specialty_list']) && is_array($data['specialty_list'])) {
                $_seo_spec = array();
                foreach ($data['specialty_list'] as $_seo_sp) {
                    $_seo_sp = $_seo_clean($_seo_sp);
                    if ($_seo_sp !== '') {
                        $_seo_spec[] = $_seo_sp;
                    }
                }
                if ($_seo_spec) {
                    $_seo_entity['medicalSpecialty'] = $_seo_spec;
                }
            } elseif (!empty($data['specialty_text'])) {
                $_seo_entity['medicalSpecialty'] = $_seo_clean($data['specialty_text']);
            }
            // 营业时间：把 "9:00-22:00" 转成标准 openingHoursSpecification（每日），
            // 同时保留 openingHours 文本串以兼容旧解析器
            if (!empty($data['visit_time'])) {
                $_seo_vt = $_seo_clean($data['visit_time']);
                if (preg_match('/(\d{1,2}):?(\d{2})?\s*[-~至]\s*(\d{1,2}):?(\d{2})?/u', $_seo_vt, $_m)) {
                    $_seo_o = sprintf('%02d:%02d', intval($_m[1]), intval($_m[2] ?: 0));
                    $_seo_c = sprintf('%02d:%02d', intval($_m[3]), intval($_m[4] ?: 0));
                    $_seo_entity['openingHoursSpecification'] = array(
                        'dayOfWeek' => array('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
                        'opens'     => $_seo_o,
                        'closes'    => $_seo_c,
                    );
                    $_seo_entity['openingHours'] = 'Mo-Su ' . $_seo_o . '-' . $_seo_c;
                } else {
                    $_seo_entity['openingHours'] = $_seo_vt;
                }
            }
            // 经纬度（参数「经纬度」，格式 "纬度,经度"；未填则不出 geo，避免编造坐标）
            $_seo_geo = $_seo_para('经纬度');
            if ($_seo_geo !== '' && preg_match('/([\d.]+)\s*,\s*([\d.]+)/', $_seo_geo, $_g)) {
                $_seo_entity['geo'] = array(
                    '@type'     => 'GeoCoordinates',
                    'latitude'  => floatval($_g[1]),
                    'longitude' => floatval($_g[2]),
                );
            }
            // 官网（参数「官网」）作 sameAs，供搜索引擎与生成式引擎做实体消歧/引用；
            // 与页面上的「官网」按钮同源，留空则不输出
            $_seo_site_url = $_seo_para('官网');
            if ($_seo_site_url === '' && !empty($data['para_url']) && is_array($data['para_url'])) {
                foreach ($data['para_url'] as $_seo_pu) {
                    if (empty($_seo_pu['value']) || empty($_seo_pu['name']) || strpos((string)$_seo_pu['name'], '官网') === false) {
                        continue;
                    }
                    $_seo_site_url = trim($_seo_clean($_seo_pu['value']));
                    break;
                }
            }
            if ($_seo_site_url !== '' && stripos($_seo_site_url, 'http') === 0) {
                $_seo_entity['sameAs'] = $_seo_site_url;
            }
            break;
        case 2: // 中医资讯
            $_seo_entity = array(
                '@type'          => 'NewsArticle',
                '@id'            => $_seo_cur . '#article',
                'headline'       => mb_substr($_seo_clean($data['title']), 0, 110),
                'url'            => $_seo_cur,
                'description'    => $_seo_clean($_seo_pdesc),
                'inLanguage'     => 'zh-CN',
                'author'         => array('@id' => $_seo_site . '#organization'),
                'publisher'      => array('@id' => $_seo_site . '#organization'),
                'mainEntityOfPage' => array('@id' => $_seo_cur . '#webpage'),
            );
            //发布时间取 addtime（转载时可填原文发布时间），修改时间取 updatetime；统一输出 ISO 8601（北京时间）
            if (!empty($data['addtime'])) {
                $_seo_entity['datePublished'] = str_replace(' ', 'T', trim($data['addtime'])) . '+08:00';
            }
            if (!empty($data['updatetime'])) {
                $_seo_entity['dateModified'] = str_replace(' ', 'T', trim($data['updatetime'])) . '+08:00';
            }
            if (!empty($_seo_col['name'])) {
                $_seo_entity['articleSection'] = $_seo_col['name'];
            }
            //原创：作者署名；转载：来源署名（creditText）与原文地址（isBasedOn）
            $_seo_original = !empty($data['is_original']);
            if (!empty($data['publisher'])) {
                if ($_seo_original) {
                    $_seo_entity['author'] = array('@type' => 'Person', 'name' => $_seo_clean($data['publisher']));
                } else {
                    $_seo_entity['creditText'] = $_seo_clean($data['publisher']);
                    $_seo_entity['copyrightNotice'] = '来源：' . $_seo_clean($data['publisher']);
                }
            }
            if (!$_seo_original && !empty($data['source_url'])) {
                $_seo_entity['isBasedOn'] = $_seo_clean($data['source_url']);
            }
            break;
        case 16: // 少儿中医
            $_seo_entity = array(
                '@type'       => 'Course',
                '@id'         => $_seo_cur . '#course',
                'name'        => $_seo_clean($data['title']),
                'url'         => $_seo_cur,
                'description' => $_seo_clean($_seo_pdesc),
                'inLanguage'  => 'zh-CN',
                'provider'    => array('@id' => $_seo_site . '#organization'),
            );
            // 有排期的输出「课程班次」：时间 + 地点，便于搜索引擎与生成式引擎识别为可报名活动
            if (!empty($data['start_time'])) {
                $_seo_inst = array(
                    '@type'      => 'CourseInstance',
                    'courseMode' => 'onsite',
                    'startDate'  => $_seo_clean($data['start_time']),
                );
                if (!empty($data['end_time'])) {
                    $_seo_inst['endDate'] = $_seo_clean($data['end_time']);
                }
                $_seo_loc = $_seo_clean(isset($data['location']) ? $data['location'] : '');
                if ($_seo_loc === '' && !empty($data['region_city'])) {
                    $_seo_loc = $_seo_clean($data['region_city'])
                             . $_seo_clean(isset($data['region_district']) ? $data['region_district'] : '');
                }
                if ($_seo_loc !== '') {
                    $_seo_addr = array('@type' => 'PostalAddress', 'addressCountry' => 'CN');
                    if (!empty($data['region_city'])) {
                        $_seo_addr['addressRegion'] = $_seo_clean($data['region_city']);
                    }
                    if (!empty($data['region_district'])) {
                        $_seo_addr['addressLocality'] = $_seo_clean($data['region_district']);
                    }
                    $_seo_inst['location'] = array('@type' => 'Place', 'name' => $_seo_loc, 'address' => $_seo_addr);
                }
                $_seo_entity['hasCourseInstance'] = $_seo_inst;
            }
            if (isset($data['is_free'])) {
                $_seo_entity['isAccessibleForFree'] = $data['is_free'] ? true : false;
            }
            break;
    }
    if ($_seo_entity) {
        if ($_seo_img) {
            $_seo_entity['image'] = $_seo_img;
        }
        $_seo_graph[] = $_seo_entity;
        $_seo_page['mainEntity'] = array('@id' => $_seo_entity['@id']);
    }
} elseif ($_seo_module == 1 && !empty($data['classnow'])) {
    // 单页（关于我们 / 联系我们 等）
    if (!empty($data['classnow']) && $data['classnow'] == 118) {
        $_seo_page['@type'] = 'ContactPage';
    } elseif (isset($_seo_col['foldername']) && $_seo_col['foldername'] == 'about') {
        $_seo_page['@type'] = 'AboutPage';
    }
}
// FAQ：GEO 最易被 AI 直接引用的结构化内容（首页输出）
$_seo_is_home = (isset($data['classnow']) && intval($data['classnow']) === 10001)
    || (empty($data['id']) && empty($_seo_module));
if ($_seo_is_home) {
    $_seo_faq = array(
        array(
            'q' => '四川中医馆（四川中医网）是做什么的？',
            'a' => '四川中医馆（四川中医网）是面向四川及成都地区的中医信息服务平台，收录特色中医馆、名老中医、中医活动与少儿中医研学信息，帮助用户查找可查证的中医就医与养生资源。',
        ),
        array(
            'q' => '如何在四川中医网上查找成都附近的中医馆？',
            'a' => '进入中医馆栏目，按城市与区县筛选，可查看中医馆的擅长项目、地址与联系方式；就诊前建议先电话确认出诊时间。',
        ),
        array(
            'q' => '网站上的中医师与中医馆信息是否经过审核？',
            'a' => '平台信息来源于公开渠道整理，仅作就医参考，不构成医疗推荐。就诊前请核验机构执业许可与医师的医师资格证、医师执业证，并以医疗机构现场公示信息为准。',
        ),
        array(
            'q' => '少儿中医研学活动适合多大年龄的孩子？',
            'a' => '各期活动的年龄要求不同，一般适合 6 至 15 岁儿童，具体以活动详情页说明为准，参加时需家长陪同。',
        ),
        array(
            'q' => '网站上的中医养生内容可以替代医生诊疗吗？',
            'a' => '不可以。站内养生与科普内容仅供健康参考，不能替代执业医师的面诊诊断与处方，身体不适请及时到正规医疗机构就诊。',
        ),
    );
    $_seo_faq_items = array();
    foreach ($_seo_faq as $_seo_qa) {
        $_seo_faq_items[] = array(
            '@type'          => 'Question',
            'name'           => $_seo_qa['q'],
            'acceptedAnswer' => array('@type' => 'Answer', 'text' => $_seo_qa['a']),
        );
    }
    $_seo_graph[] = array(
        '@type'          => 'FAQPage',
        '@id'            => $_seo_site . '#faq',
        'url'            => $_seo_site,
        'inLanguage'     => 'zh-CN',
        'mainEntity'     => $_seo_faq_items,
    );
}

// 医保问答以「参数管理 → 支持医保」为准（参数在 handle 之后由 systemPara 挂到 $data['para']）
// 这样后台只需在参数管理维护一处，前台 FAQ 与结构化数据自动跟随
if (!empty($data['para']) && is_array($data['para']) && !empty($data['faq_list']) && is_array($data['faq_list'])) {
    $_seo_ins_found = false;
    $_seo_ins_val = '';
    foreach ($data['para'] as $_seo_p) {
        if (!empty($_seo_p['name']) && mb_strpos((string)$_seo_p['name'], '医保', 0, 'UTF-8') !== false) {
            $_seo_ins_found = true;
            $_seo_ins_val = trim(strip_tags((string)$_seo_p['value']));
            break;
        }
    }
    // 只要参数里存在「医保」字段，就以它为准（未填写时给「尚未确认」的通用答复）
    if ($_seo_ins_found) {
        $_seo_ins_title = isset($data['title']) ? trim(html_entity_decode(strip_tags($data['title']), ENT_QUOTES, 'UTF-8')) : '';
        $_seo_ins_text = '该医馆的医保与门诊统筹信息尚未确认，是否可就地结算建议就诊前电话咨询，可报销项目各馆不同。';
        if ($_seo_ins_val === '是' || $_seo_ins_val === '支持') {
            $_seo_ins_text = $_seo_ins_title . '支持医保结算。可报销项目（饮片、针灸、推拿等）与门诊统筹比例以医馆现场公示及当地医保政策为准。';
        } elseif ($_seo_ins_val === '否' || $_seo_ins_val === '不支持') {
            $_seo_ins_text = $_seo_ins_title . '暂不支持医保结算，就诊费用以自费为主，具体收费项目请以医馆现场公示为准。';
        }
        foreach ($data['faq_list'] as $_seo_k => $_seo_f) {
            if (empty($_seo_f['q'])) {
                continue;
            }
            if (mb_strpos((string)$_seo_f['q'], '医保', 0, 'UTF-8') !== false) {
                $data['faq_list'][$_seo_k]['a'] = $_seo_ins_text;
            }
        }
    }
}

// 医馆页：后台未配 FAQ 时，用真实参数（医保/营业时间/地址/电话）自动生成数据型 FAQ。
// 这是 AI 问答引擎最易直接引用的结构化内容；后台若已配 faq_list 则优先用后台的。
// 放在医保覆盖块之后，避免通用医保话术覆盖掉带馆名的答案。
if ($_seo_module === 3 && empty($data['faq_list'])) {
    $_seo_cf = array();
    $_seo_cn = $_seo_clean($data['title']);
    // 医保（与参数「支持医保」一致）
    $_seo_med = '';
    if (!empty($data['para']) && is_array($data['para'])) {
        foreach ($data['para'] as $_seo_p) {
            if (!empty($_seo_p['name']) && mb_strpos((string)$_seo_p['name'], '医保', 0, 'UTF-8') !== false) {
                $_seo_med = trim(strip_tags((string)$_seo_p['value']));
                break;
            }
        }
    }
    if ($_seo_med === '是' || $_seo_med === '支持') {
        $_seo_cf[] = array('q' => $_seo_cn . '支持医保吗？', 'a' => $_seo_cn . '支持医保结算，可报销项目（饮片、针灸、推拿等）与门诊统筹比例以医馆现场公示及当地医保政策为准。');
    } elseif ($_seo_med === '否' || $_seo_med === '不支持') {
        $_seo_cf[] = array('q' => $_seo_cn . '支持医保吗？', 'a' => $_seo_cn . '暂不支持医保结算，就诊费用以自费为主，具体收费项目请以医馆现场公示为准。');
    } else {
        $_seo_cf[] = array('q' => '去' . $_seo_cn . '就诊能用医保吗？', 'a' => $_seo_cn . '的医保与门诊统筹信息以现场公示为准，是否可就地结算建议就诊前电话咨询确认。');
    }
    // 营业时间
    if (!empty($data['visit_time'])) {
        $_seo_cf[] = array('q' => $_seo_cn . '的营业时间是几点到几点？', 'a' => $_seo_cn . '的营业时间为' . $_seo_clean($data['visit_time']) . '，建议就诊前电话确认当天是否正常开诊。');
    }
    // 地址 / 电话
    $_seo_addr_t = $_seo_para('地点');
    $_seo_tel_t  = $_seo_para('电话');
    if ($_seo_addr_t !== '' || $_seo_tel_t !== '') {
        $_seo_a   = $_seo_addr_t !== '' ? '地址：' . $_seo_addr_t : '';
        $_seo_t   = $_seo_tel_t !== '' ? '电话：' . $_seo_tel_t : '';
        $_seo_sep = ($_seo_a !== '' && $_seo_t !== '') ? '；' : '';
        $_seo_cf[] = array('q' => '怎么去' . $_seo_cn . '？', 'a' => $_seo_a . $_seo_sep . $_seo_t . '。建议前往前先电话确认。');
    }
    // 预约
    $_seo_cf[] = array('q' => '去' . $_seo_cn . '需要预约吗？', 'a' => '建议提前电话预约，尤其是名老中医坐诊时段；具体排号与预约方式以医馆安排为准。');
    if ($_seo_cf) {
        $data['faq_list'] = $_seo_cf;
    }
}

// 详情页 FAQ（中医馆 / 中医师）：由对应模块的 handle 生成，AI 搜索最易直接引用
if (!$_seo_is_home && !empty($data['faq_list']) && is_array($data['faq_list'])) {
    $_seo_qa = array();
    foreach ($data['faq_list'] as $_seo_row) {
        if (empty($_seo_row['q']) || empty($_seo_row['a'])) {
            continue;
        }
        $_seo_qa[] = array(
            '@type'          => 'Question',
            'name'           => $_seo_clean($_seo_row['q']),
            'acceptedAnswer' => array('@type' => 'Answer', 'text' => $_seo_clean($_seo_row['a'])),
        );
    }
    if ($_seo_qa) {
        $_seo_graph[] = array(
            '@type'      => 'FAQPage',
            '@id'        => $_seo_cur . '#faq',
            'url'        => $_seo_cur,
            'inLanguage' => 'zh-CN',
            'mainEntity' => $_seo_qa,
        );
    }
}

// 聚合页（地区聚合等）：页面类型升级为 CollectionPage，并输出条目列表 ItemList
if (!empty($data['schema_page_type'])) {
    $_seo_page['@type'] = (string)$data['schema_page_type'];
}
if (!empty($data['schema_item_list']) && is_array($data['schema_item_list'])) {
    $_seo_il = array();
    $_seo_il_pos = 0;
    foreach ($data['schema_item_list'] as $_seo_it) {
        if (empty($_seo_it['name'])) {
            continue;
        }
        $_seo_il_pos++;
        $_seo_il[] = array(
            '@type'    => 'ListItem',
            'position' => $_seo_il_pos,
            'name'     => $_seo_clean($_seo_it['name']),
            'url'      => isset($_seo_it['url']) ? (string)$_seo_it['url'] : '',
        );
    }
    if ($_seo_il) {
        $_seo_graph[] = array(
            '@type'           => 'ItemList',
            '@id'             => $_seo_cur . '#itemlist',
            'numberOfItems'   => $_seo_il_pos,
            'itemListElement' => $_seo_il,
        );
        $_seo_page['mainEntity'] = array('@id' => $_seo_cur . '#itemlist');
    }
}

$_seo_graph[] = $_seo_page;

$_seo_json = json_encode(
    array('@context' => 'https://schema.org', '@graph' => $_seo_graph),
    JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_INVALID_UTF8_SUBSTITUTE
);
if ($_seo_json) {
    echo '<script type="application/ld+json">' . $_seo_json . '</script>' . "\n";
}
?>
