<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.


defined('IN_MET') or exit('No permission');

load::mod_class('base/base_database');

/**
 * 系统标签类.
 */
class doctor_database extends base_database
{
    public $multi_column = 0; //是否支持多栏目

    public function __construct()
    {
        global $_M;
        $this->construct($_M['table']['doctor']);
    }

    //字段注册
    public function table_para()
    {
        return 'id|title|yiguan|hospital|fee|school|specialty|tuijian|ctitle|keywords|description|content|class1|class2|class3|no_order|wap_ok|img_ok|imgurl|imgurls|com_ok|issue|hits|updatetime|addtime|access|top_ok|filename|lang|recycle|displaytype|tag|links|text_size|text_color|other_info|custom_info|publisher';
    }

    /**
     * 列表排序（覆盖系统默认）
     *
     * 中医师的排序规则，优先级从高到低：
     *   1. tuijian   重点推荐：选“是”的排最前
     *   2. top_ok    置顶
     *   3. com_ok    推荐
     *   4. no_order  排序号：数字越小越靠前（后台填写的序号）
     *   5. updatetime / id：序号相同时，新更新的在前
     *
     * 系统默认是 no_order DESC（数字越大越靠前），这里改为 ASC 以符合“序号越小越靠前”的习惯。
     *
     * @param string $order 栏目设置的排序方式（本模块统一按上述规则，不使用该参数）
     * @return string 排序 SQL
     */
    public function get_column_order($order = '')
    {
        return ' ORDER BY tuijian DESC, top_ok DESC, com_ok DESC, no_order ASC, updatetime DESC, id DESC ';
    }

    /**
     * 获取某个医馆下的中医师列表
     * @param int $yiguan 医馆（产品）内容ID
     * @param int $offset 偏移量
     * @param int $length 条数
     * @return array
     */
    public function get_list_by_yiguan($yiguan = 0, $offset = 0, $length = 12)
    {
        $cond = $this->yiguan_cond($yiguan);
        if (!$cond) {
            return array();
        }
        $offset = intval($offset);
        $length = intval($length);
        $sql = " {$cond} ORDER BY tuijian DESC, top_ok DESC, com_ok DESC, no_order ASC, updatetime DESC, id DESC LIMIT {$offset} , {$length} ";
        $data = $this->get_all($sql);
        return $data ? $data : array();
    }

    /**
     * 获取某个医馆下的中医师总数
     * @param int $yiguan 医馆（产品）内容ID
     * @return int
     */
    public function get_count_by_yiguan($yiguan = 0)
    {
        $cond = $this->yiguan_cond($yiguan);
        if (!$cond) {
            return 0;
        }
        return intval(DB::counter($this->table, " {$this->langsql} {$cond} "));
    }

    /**
     * 中医师按医馆查询的筛选条件（不含语言条件）
     * @param int $yiguan 医馆（产品）内容ID
     * @return string
     */
    private function yiguan_cond($yiguan = 0)
    {
        $yiguan = intval($yiguan);
        if (!$yiguan) {
            return '';
        }
        $time = date('Y-m-d H:i');
        //“坐诊医馆”为多选，字段存逗号分隔的医馆内容ID（如 42,43），用 FIND_IN_SET 精确匹配单个ID
        return " AND (recycle='0' or recycle='-1') AND displaytype='1' AND addtime < '{$time}' AND (links = '' OR links is null) AND FIND_IN_SET('{$yiguan}', yiguan) ";
    }

}
# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.