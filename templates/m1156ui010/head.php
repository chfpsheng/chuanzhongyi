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
// 机构对外信息：如需调整电话或社交账号主页，只改这里即可
$_seo_tel    = '18026954495'; // 咨询电话（不需要对外展示时置为空字符串）
$_seo_sameas = array(         // 微信公众号主页 / 微博主页 / 其他官方主页，没有就留空数组
    // 'https://weibo.com/你的微博主页',
);
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
<?php if (!empty($data['noindex'])) { ?>
<meta name="robots" content="noindex,follow" />
<?php } ?>
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
