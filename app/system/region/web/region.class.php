<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');

load::sys_class('web');

/**
 * 地区聚合页：按 市/州 → 区/县 聚合「中医馆」内容
 *
 * URL：
 *   /region/                                  地区索引（四川省各市/州）
 *   /region/?city=成都市                       市级聚合页
 *   /region/?city=成都市&district=武侯区       区级聚合页
 *
 * 数据：met_product.region_city / region_district
 * SEO：面包屑 + CollectionPage/ItemList 结构化数据由 head.php 统一输出；
 *      内容少于 2 条的地区自动 noindex，避免薄内容被收录。
 */
class region extends web
{
    /** 中医馆栏目ID（自动识别，识别不到时回退 104） */
    protected $column_id = 104;
    protected $column_name = '中医馆';
    protected $column_url = '';
    /** 低于该条数的地区页输出 noindex */
    protected $min_index = 2;

    public function __construct()
    {
        global $_M;
        parent::__construct();
    }

    public function doregion()
    {
        global $_M;

        $this->init_column();

        $city = $this->safe_name(isset($_M['form']['city']) ? $_M['form']['city'] : '');
        $district = $this->safe_name(isset($_M['form']['district']) ? $_M['form']['district'] : '');

        $tree = $this->get_tree();

        // 参数校验：库里不存在的地区一律回到上级，避免任意参数生成无穷空页面
        if ($city && !isset($tree[$city])) {
            $city = '';
            $district = '';
        }
        if ($city && $district && !isset($tree[$city][$district])) {
            $district = '';
        }

        $list = $this->get_list($city, $district);

        // 当前地址
        $query = '';
        if ($city) {
            $query .= '?city=' . rawurlencode($city);
            if ($district) {
                $query .= '&district=' . rawurlencode($district);
            }
        }
        $cur_url = $_M['url']['web_site'] . 'region/' . $query;

        // 面包屑：首页 > 中医馆 > 成都市 > 武侯区
        $breadcrumb = array(
            array('name' => '首页', 'url' => $_M['url']['web_site']),
            array('name' => $this->column_name, 'url' => $this->column_url),
        );
        if ($city) {
            $breadcrumb[] = array('name' => $city, 'url' => $_M['url']['web_site'] . 'region/?city=' . rawurlencode($city));
        }
        if ($district) {
            $breadcrumb[] = array('name' => $district, 'url' => $cur_url);
        }

        // TDK
        $city_total = $city && isset($tree[$city]) ? $this->city_total($tree[$city]) : 0;
        if ($district) {
            $name = $city . $district;
            $title = $city . $district . '中医馆（' . count($list) . '家）地址与擅长项目';
            $keywords = $city . $district . '中医馆,' . $district . '中医馆推荐,' . $city . '针灸馆,' . $district . '中医理疗';
            $description = $city . $district . '中医馆名录，共收录 ' . count($list) . ' 家中医馆，提供擅长项目、地址与联系方式，方便就近选择。';
        } elseif ($city) {
            $name = $city;
            $title = $city . '中医馆名单（' . $city_total . '家）按区县查找';
            $keywords = $city . '中医馆,' . $city . '中医馆推荐,' . $city . '针灸推拿,' . $city . '中医养生';
            $description = $city . '中医馆按区县汇总，共 ' . $city_total . ' 家，可按区/县筛选查看擅长项目、地址与联系方式。';
        } else {
            $name = '中医馆地区分布';
            $title = '四川中医馆地区分布 - 按市/区县查找中医馆';
            $keywords = '四川中医馆,成都中医馆,中医馆地区,中医馆推荐';
            $description = '按四川省各市/州及区/县汇总中医馆名录，方便就近查找中医馆、针灸馆的地址与擅长项目。';
        }

        $this->seo($title, $keywords, $description);

        // 结构化数据条目（ItemList）
        $items = array();
        foreach ($list as $v) {
            $items[] = array('name' => $v['title'], 'url' => $v['url']);
        }

        $this->add_input('class1', $this->column_id);
        $this->add_input('classnow', $this->column_id);
        $this->add_input('module', 3);
        $this->add_input('url', 'region/' . $query);
        $this->add_input('canonical', $cur_url);
        $this->add_input('schema_page_type', 'CollectionPage');
        $this->add_input('schema_item_list', $items);
        $this->add_input('region_tree', $tree);
        $this->add_input('region_city', $city);
        $this->add_input('region_district', $district);
        $this->add_input('region_list', $list);
        $this->add_input('region_name', $name);
        $this->add_input('region_breadcrumb', $breadcrumb);
        $this->add_input('noindex', (count($list) < $this->min_index) ? 1 : 0);

        $this->view('region', $this->input);
    }

    /**
     * 定位「中医馆」栏目
     */
    protected function init_column()
    {
        global $_M;
        $query = "SELECT id,name,foldername FROM {$_M['table']['column']} WHERE lang = '{$_M['lang']}' AND module = 3 AND bigclass = 0 ORDER BY no_order ASC, id ASC LIMIT 1";
        $row = DB::get_one($query);
        if ($row && !empty($row['id'])) {
            $this->column_id = intval($row['id']);
            $this->column_name = $row['name'];
            $this->column_url = $_M['url']['web_site'] . $row['foldername'] . '/';
        } else {
            $this->column_url = $_M['url']['web_site'] . 'product/';
        }
    }

    /**
     * 地区名称安全过滤
     */
    protected function safe_name($s)
    {
        $s = trim(strip_tags((string)$s));
        $s = str_replace(array('"', "'", '<', '>', '\\'), '', $s);
        if (function_exists('mb_substr')) {
            $s = mb_substr($s, 0, 20, 'UTF-8');
        }
        return $s;
    }

    /**
     * 查询条件：已发布、有地区、属于中医馆栏目
     */
    protected function base_where()
    {
        global $_M;
        $lang = addslashes($_M['lang']);
        return "lang = '{$lang}' AND recycle = 0 AND displaytype != -1 AND class1 = '{$this->column_id}' AND region_city <> ''";
    }

    /**
     * 地区树：city => [district => count]
     */
    protected function get_tree()
    {
        global $_M;
        $query = "SELECT region_city, region_district, COUNT(*) AS cnt FROM {$_M['table']['product']} WHERE " . $this->base_where() . " GROUP BY region_city, region_district ORDER BY region_city ASC, cnt DESC, region_district ASC";
        $rows = DB::get_all($query);
        $tree = array();
        foreach ((array)$rows as $r) {
            $c = trim($r['region_city']);
            $d = trim($r['region_district']);
            if ($c === '') {
                continue;
            }
            if (!isset($tree[$c])) {
                $tree[$c] = array();
            }
            if ($d !== '') {
                $tree[$c][$d] = intval($r['cnt']);
            }
        }
        return $tree;
    }

    /**
     * 某城市下的总数
     */
    protected function city_total($districts)
    {
        $n = 0;
        foreach ((array)$districts as $c) {
            $n += intval($c);
        }
        return $n;
    }

    /**
     * 医馆列表
     */
    protected function get_list($city = '', $district = '')
    {
        global $_M;
        $where = $this->base_where();
        if ($city) {
            $where .= " AND region_city = '" . addslashes($city) . "'";
        }
        if ($district) {
            $where .= " AND region_district = '" . addslashes($district) . "'";
        }
        $query = "SELECT id,title,imgurl,description,region_city,region_district,updatetime FROM {$_M['table']['product']} WHERE {$where} ORDER BY updatetime DESC, id DESC";
        $rows = DB::get_all($query);
        $list = array();
        foreach ((array)$rows as $r) {
            $img = trim($r['imgurl']);
            if ($img) {
                $img = str_replace('../', $_M['url']['web_site'], $img);
            }
            $desc = trim(strip_tags(html_entity_decode($r['description'], ENT_QUOTES, 'UTF-8')));
            if (function_exists('mb_substr') && mb_strlen($desc, 'UTF-8') > 90) {
                $desc = mb_substr($desc, 0, 90, 'UTF-8') . '…';
            }
            $list[] = array(
                'id' => intval($r['id']),
                'title' => $r['title'],
                'url' => $_M['url']['web_site'] . 'product/showproduct.php?id=' . intval($r['id']),
                'imgurl' => $img,
                'description' => $desc,
                'region_city' => $r['region_city'],
                'region_district' => $r['region_district'],
                'updatetime' => $r['updatetime'],
            );
        }
        return $list;
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
