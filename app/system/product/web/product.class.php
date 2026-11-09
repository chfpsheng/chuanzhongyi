<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('news/web/news');

class product extends news
{
    public function __construct()
    {
        global $_M;
        parent::__construct();
    }

    /**
     * 判断当前是否为「院内制剂」栏目（目录名 yuanneizhiji）。
     * 兼容两种情况：
     *   1) 列表/详情页正好命中 yuanneizhiji 栏目本身；
     *   2) 当前栏目是 yuanneizhiji 的子栏目（取顶级栏目目录名判断）。
     */
    private function is_yuanneizhiji()
    {
        global $_M;
        // 0) 终极兜底：请求路径本身含栏目目录名（覆盖栏目目录入口 /yuanneizhiji/、/yuanneizhiji/index.php 等路由）
        if (!empty($_SERVER['REQUEST_URI']) && stripos($_SERVER['REQUEST_URI'], 'yuanneizhiji') !== false) {
            return true;
        }
        // 1) 目录名：input 与原始 form 都查（input 可能在部分流程中尚未填充）
        foreach (array($this->input['folder_name'], $_M['form']['folder_name']) as $fn) {
            if (!empty($fn) && $fn == 'yuanneizhiji') {
                return true;
            }
        }
        // 2) 伪静态列表页：metid 直接是栏目目录名/静态页名
        if (!empty($_M['form']['metid']) && $_M['form']['metid'] == 'yuanneizhiji') {
            return true;
        }
        // 3) 栏目 id 反查：input 与 form 的 class1/2/3 任一命中即视为该栏目
        foreach (array('class1', 'class2', 'class3') as $k) {
            foreach (array($this->input[$k], $_M['form'][$k]) as $cid) {
                if (!empty($cid) && is_numeric($cid)) {
                    $col = $_M['class']['column_label']->get_column_id($cid);
                    if ($col && $col['foldername'] == 'yuanneizhiji') {
                        return true;
                    }
                }
            }
        }
        // 4) 详情页：仅带 id（无 classN），由产品 id 反查所属栏目
        if (!empty($this->input['id']) && is_numeric($this->input['id'])) {
            $pid = (int)$this->input['id'];
            $prod = DB::get_one("SELECT class1 FROM {$_M['table']['product']} WHERE id='{$pid}' AND lang='{$_M['lang']}'");
            if ($prod && $prod['class1']) {
                $col = $_M['class']['column_label']->get_column_id($prod['class1']);
                if ($col && $col['foldername'] == 'yuanneizhiji') {
                    return true;
                }
            }
        }
        return false;
    }

    public function doproduct()
    {
        global $_M;

        if ($this->listpage('product') == 'list') {
            //列表页缩略图尺寸
            $_M['config']['met_productimg_x'] = $this->input['thumb_list_x'];
            $_M['config']['met_productimg_y'] = $this->input['thumb_list_y'];
            $_M['config']['met_product_list'] = $this->input['list_length'];

            // 院内制剂不走伪静态重定向（其栏目目录名会生成不可解析的伪静态地址）；其余栏目保持原逻辑
            if (!$this->is_yuanneizhiji()) {
                $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
            }
            // 院内制剂栏目使用独立模板；其余产品栏目（如中医馆）仍走 product.php
            if ($this->is_yuanneizhiji()) {
                $this->view('yuanneizhiji', $this->input);
            } else {
                $this->view('product', $this->input);
            }
        } else {
            $this->doshowproduct();
        }
    }

    public function doshowproduct()
    {
        global $_M;
        // 修复：/product/showproduct.php?lang=cn&id=X 全部 404（lang 参数 + 院内制剂栏目路径不匹配）。
        // 在 showpage()（会按栏目路径校验并 404）之前做 301 跳转，避免死链（书签/外链/Google 旧链接），
        // 同时把 ?lang=cn 的重复 URL 收敛到规范 ?id= 形态。
        $yz_id = isset($this->input['id']) ? (int)$this->input['id'] : 0;
        $yz_has_lang = isset($_GET['lang']) || (isset($_SERVER['QUERY_STRING']) && stripos($_SERVER['QUERY_STRING'], 'lang=') !== false);
        $yz_is = $this->is_yuanneizhiji();
        if ($yz_id > 0 && ($yz_has_lang || ($yz_is && stripos($_SERVER['REQUEST_URI'], '/product/') !== false))) {
            $yz_base = $yz_is ? '/yuanneizhiji/showproduct.php' : '/product/showproduct.php';
            header('HTTP/1.1 301 Moved Permanently');
            header('Location: ' . $yz_base . '?id=' . $yz_id);
            exit;
        }
        $this->showpage('product');
        //详情页缩略图尺寸
        $_M['config']['met_productdetail_x'] = $this->input['thumb_detail_x'];
        $_M['config']['met_productdetail_y'] = $this->input['thumb_detail_y'];

        $shop_plugin_file = PATH_ALL_APP . 'shop/plugin/plugin_shop.class.php';
        if ($_M['config']['shopv2_open'] && file_exists($shop_plugin_file)) {
            define('MET_SHOP_PARA', 1);
            if (!$this->is_yuanneizhiji()) {
                $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
            }
            load::plugin('doproduct_show', 0, $this->input);
        } else {
            // 院内制剂不走伪静态重定向（避免跳到不可解析的 /yuanneizhiji/{id}.html）
            if (!$this->is_yuanneizhiji()) {
                $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
            }
            // 院内制剂详情使用独立模板；其余产品栏目仍走 showproduct.php
            if ($this->is_yuanneizhiji()) {
                $this->view('showyuanneizhiji', $this->input);
            } else {
                $this->view('showproduct', $this->input);
            }
        }
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
