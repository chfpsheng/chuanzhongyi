<?php
defined('IN_MET') or exit('No permission');

if (!function_exists('_sidebar_brand')) {
    /**
     * 从医馆标题中提取品牌核心，用于判断连锁店
     */
    function _sidebar_brand($title) {
        $title = html_entity_decode((string)$title, ENT_QUOTES, 'UTF-8');
        $title = trim($title);
        // 去掉括号及内容
        $title = preg_replace('/[（(].*?[）)]/u', '', $title);
        // 按常见分隔符取第一部分
        if (preg_match('/^([^·•\s]+)/u', $title, $m)) {
            $b = $m[1];
        } else {
            $b = $title;
        }
        // 去掉中医馆/国医馆/医馆/总店/店/馆等后缀
        $b = preg_replace('/(中医馆|国医馆|医馆|总店|店|馆)$/u', '', $b);
        return trim($b);
    }
}

/**
 * 侧边栏「医师团队」数据准备
 * 排序：置顶(top_ok) > 推荐(com_ok) > 最新(updatetime) > id，取 service_num 条（默认 4）
 *
 * 单独放一个文件的原因：米拓模板引擎会解析模板源码里的花括号与 {$var}，
 * 多行 PHP 代码块直接写在 UI 模板里会导致模板编译失败（Unclosed '{' / 语法错误）。
 * 本文件以 include 方式载入，不参与模板编译，可自由书写 PHP。
 */

$_sidebar_service = array();

if (!empty($ui['service_ok'])) {
    $_sid = intval($ui['service_id']) ? intval($ui['service_id']) : intval($data['classnow']);
    $_num = intval($ui['service_num']) ? intval($ui['service_num']) : 4;

    $_col = DB::get_one("SELECT id,module FROM " . $_M['table']['column'] . " WHERE id='" . $_sid . "' AND lang='" . $_M['lang'] . "'");
    $_mod = $_col ? intval($_col['module']) : 0;

    // 模块编号 => 模块标识（对应的内容表需同时具备 top_ok / com_ok 字段）
    $_modmap = array(
        2 => 'news',
        3 => 'product',
        5 => 'img',
        14 => 'doctor',
        15 => 'activity',
        16 => 'shaoer',
    );

    if (isset($_modmap[$_mod]) && isset($_M['table'][$_modmap[$_mod]])) {
        $_modname = $_modmap[$_mod];
        $_tb = $_M['table'][$_modname];

        $_list = DB::get_all(
            "SELECT * FROM " . $_tb .
            " WHERE lang='" . $_M['lang'] . "'" .
            " AND recycle=0 AND displaytype!=-1" .
            " AND (class1='" . $_sid . "' OR class2='" . $_sid . "' OR class3='" . $_sid . "')" .
            " ORDER BY top_ok DESC, com_ok DESC, updatetime DESC, id DESC LIMIT " . $_num
        );

        foreach ((array)$_list as $_k => $_v) {
            $_list[$_k]['original_addtime'] = $_v['addtime'];
            $_list[$_k]['url'] = load::mod_class($_modname . '/' . $_modname . '_handle', 'new')->get_content_url($_v);
        }
        $_sidebar_service = $_list;
    }
}

// 侧边栏「热门推荐」：当前医馆的同品牌连锁店优先，再按最新排序，取 6 条
$_sidebar_hot = array();
if (!empty($data['module']) && intval($data['module']) === 3 && !empty($data['id'])) {
    $_hot_cls = intval($data['class1']) ? intval($data['class1']) : intval($data['classnow']);
    if ($_hot_cls) {
        $_current_id = intval($data['id']);
        $_current_brand = _sidebar_brand(isset($data['title']) ? $data['title'] : '');

        $_hot_list = DB::get_all(
            "SELECT * FROM " . $_M['table']['product'] .
            " WHERE lang='" . $_M['lang'] . "'" .
            " AND recycle=0 AND displaytype!=-1" .
            " AND class1='" . $_hot_cls . "'" .
            " AND id!='" . $_current_id . "'" .
            " ORDER BY updatetime DESC, id DESC LIMIT 50"
        );

        foreach ((array)$_hot_list as $_k => $_v) {
            $_b = _sidebar_brand($_v['title']);
            $_same = false;
            if ($_current_brand && $_b) {
                $_min = min(mb_strlen($_current_brand, 'UTF-8'), mb_strlen($_b, 'UTF-8'));
                $_common = '';
                for ($_i = 0; $_i < $_min; $_i++) {
                    if (mb_substr($_current_brand, $_i, 1, 'UTF-8') === mb_substr($_b, $_i, 1, 'UTF-8')) {
                        $_common .= mb_substr($_current_brand, $_i, 1, 'UTF-8');
                    } else {
                        break;
                    }
                }
                // 共同前缀 >=3 字视为同品牌
                if (mb_strlen($_common, 'UTF-8') >= 3) {
                    $_same = true;
                }
            }
            $_hot_list[$_k]['_same_brand'] = $_same ? 1 : 0;
            $_hot_list[$_k]['url'] = load::mod_class('product/product_handle', 'new')->get_content_url($_v);
        }

        usort($_hot_list, function ($a, $b) {
            if ($a['_same_brand'] !== $b['_same_brand']) {
                return $b['_same_brand'] - $a['_same_brand'];
            }
            $ta = strtotime($a['updatetime']); $tb = strtotime($b['updatetime']);
            if ($ta !== $tb) return $tb - $ta;
            return $b['id'] - $a['id'];
        });

        $_sidebar_hot = array_slice($_hot_list, 0, 6);
    }
} else if (!empty($data['module']) && intval($data['module']) === 3) {
    // 列表页：当前栏目下热门医馆（置顶 > 推荐 > 评分 > 最新），取 6 条
    $_hot_cls = intval($data['class1']) ? intval($data['class1']) : intval($data['classnow']);
    if ($_hot_cls) {
        $_score_sub = "(SELECT COALESCE(MAX(CAST(pl.info AS SIGNED)),0) FROM " . $_M['table']['plist'] . " pl WHERE pl.listid=" . $_M['table']['product'] . ".id AND pl.paraid=(SELECT pa.id FROM " . $_M['table']['parameter'] . " pa WHERE pa.name='评分' AND pa.class1=104 AND pa.lang='" . $_M['lang'] . "' LIMIT 1) AND pl.lang='" . $_M['lang'] . "')";
        $_hot_list = DB::get_all(
            "SELECT * FROM " . $_M['table']['product'] .
            " WHERE lang='" . $_M['lang'] . "'" .
            " AND recycle=0 AND displaytype!=-1" .
            " AND (class1='" . $_hot_cls . "' OR class2='" . $_hot_cls . "' OR class3='" . $_hot_cls . "')" .
            " ORDER BY top_ok DESC, com_ok DESC, " . $_score_sub . " DESC, updatetime DESC, id DESC LIMIT 6"
        );
        foreach ((array)$_hot_list as $_k => $_v) {
            $_hot_list[$_k]['url'] = load::mod_class('product/product_handle', 'new')->get_content_url($_v);
        }
        $_sidebar_hot = $_hot_list;
    }
}

