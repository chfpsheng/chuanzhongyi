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
$_seo_cur    = $_seo_site . (isset($data['url']) ? str_replace('../', '', $data['url']) : '');
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
?>
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="<?php echo htmlspecialchars($_seo_title, ENT_QUOTES, 'UTF-8'); ?>" />
<meta name="twitter:description" content="<?php echo htmlspecialchars($_seo_clean($_seo_pdesc), ENT_QUOTES, 'UTF-8'); ?>" />
<?php if ($_seo_img) { ?>
<meta name="twitter:image" content="<?php echo htmlspecialchars($_seo_img, ENT_QUOTES, 'UTF-8'); ?>" />
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
);

// 机构（站点主体）
$_seo_org = array(
    '@type'       => 'Organization',
    '@id'         => $_seo_site . '#organization',
    'name'        => $_seo_name,
    'url'         => $_seo_site,
    'description' => $_seo_clean($_seo_desc),
    'areaServed'  => array('@type' => 'AdministrativeArea', 'name' => '四川省成都市'),
    'knowsAbout'  => array('中医馆', '名老中医', '中医养生', '药食同源', '少儿中医研学', '中医活动', '中医针灸'),
);
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
            );
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
            $_seo_addr = array('@type' => 'PostalAddress', 'addressCountry' => 'CN');
            if (!empty($data['region_city'])) {
                $_seo_addr['addressRegion'] = $_seo_clean($data['region_city']);
            }
            if (!empty($data['region_district'])) {
                $_seo_addr['addressLocality'] = $_seo_clean($data['region_district']);
            }
            $_seo_entity['address'] = $_seo_addr;
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
            if (!empty($data['updatetime'])) {
                $_seo_entity['datePublished'] = $_seo_clean($data['updatetime']);
                $_seo_entity['dateModified']  = $_seo_clean($data['updatetime']);
            }
            if (!empty($_seo_col['name'])) {
                $_seo_entity['articleSection'] = $_seo_col['name'];
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
$_seo_graph[] = $_seo_page;

$_seo_json = json_encode(
    array('@context' => 'https://schema.org', '@graph' => $_seo_graph),
    JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_INVALID_UTF8_SUBSTITUTE
);
if ($_seo_json) {
    echo '<script type="application/ld+json">' . $_seo_json . '</script>' . "\n";
}
?>
