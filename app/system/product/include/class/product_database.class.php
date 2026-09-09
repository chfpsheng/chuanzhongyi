<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.


defined('IN_MET') or exit('No permission');

load::mod_class('base/base_database');

/**
 * 系统标签类.
 */
class product_database extends base_database
{
    /**
     * classother 是否有数据的缓存标记
     * null = 未检测, true = 有数据, false = 全空
     * @var bool|null
     */
    private $has_classother_data = null;

    public function __construct()
    {
        global $_M;
        $this->construct($_M['table']['product']);

        if (M_MODULE != 'admin' && $_M['config']['shopv2_open']) {//开启在线订购时
            $p = $_M['table']['product'];
            $s = $_M['table']['shopv2_product'];
            $table = $p . ' Left JOIN ' . $s . " ON ({$p}.id = {$s}.pid)";
            $this->construct($table);
        } else {
            $this->construct($_M['table']['product']);
        }

        $this->multi_column = 1;
    }

    public function table_para()
    {
        return 'id|title|ctitle|keywords|description|content|content1|content2|content3|content4|class1|class2|class3|no_order|wap_ok|imgurl|imgurls|com_ok|issue|hits|updatetime|addtime|access|top_ok|filename|lang|recycle|displaytype|tag|links|displayimg|classother|imgsize|text_size|text_color|other_info|custom_info|video';
    }

    /**
     * 删除.
     * @param string $id id
     * @return bool 删除是否成功
     */
    public function del_by_id($id = '')
    {
        if (parent::del_by_id($id)) {
            load::mod_class('parameter/parameter_database', 'new')->del_list($id, $this->table_to_module($this->table));

            return true;
        } else {
            return false;
        }
    }

    public function get_multi_column_sql($class1 = '', $class2 = '', $class3 = '')
    {
        $sql = '';
        if ($class1 || $class2 || $class3) {
            // 组装精确匹配条件（可走索引）
            $exact = '';
            if ($class1) {
                $exact .= " class1 = '{$class1}' AND ";
            }
            if ($class2) {
                $exact .= " class2 = '{$class2}' AND ";
            }
            if ($class3) {
                $exact .= " class3 = '{$class3}' AND ";
            }
            $exact = rtrim($exact, ' AND ');

            // 仅当表中存在 classother 数据时才添加 LIKE 分支
            if ($this->hasClassotherData()) {
                $like = "classother LIKE '%|-{$class1}-";
                if ($class2) {
                    $like .= "{$class2}-";
                    if ($class3) {
                        $like .= "{$class3}-|%'";
                    } else {
                        $like .= "%'";
                    }
                } else {
                    $like .= "%'";
                }

                // classother != '' 前置过滤：空行直接跳过 LIKE 求值
                $sql .= "AND ( ({$exact}) OR (classother != '' AND {$like}) )";
            } else {
                // classother 全表无数据，完全跳过 LIKE 分支
                // 查询变为纯 class1/class2/class3 精确匹配，可充分利用索引
                $sql .= "AND ( {$exact} )";
            }
        }

        return $sql;
    }

    /**
     * 检测 product 表中 classother 字段是否有非空数据（缓存结果）
     * @return bool
     */
    private function hasClassotherData()
    {
        if ($this->has_classother_data === null) {
            global $_M;
            $query = "SELECT 1 FROM {$_M['table']['product']} WHERE classother != '' AND classother IS NOT NULL LIMIT 1";
            $this->has_classother_data = (bool) DB::get_one($query);
        }
        return $this->has_classother_data;
    }

    /**
     * @param int $class1
     * @param int $class2
     * @param int $class3
     * @return array|void
     */
    public function get_list_by_class123($class1 = 0, $class2 = 0, $class3 = 0)
    {
        global $_M;
        $sql = self::get_multi_column_sql($class1, $class2, $class3);

        $query = "SELECT id,title,access,displaytype FROM {$this->table} WHERE  recycle = 0 AND lang='{$_M['lang']}' {$sql} ORDER BY no_order DESC";

        return DB::get_all($query);
    }

}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.