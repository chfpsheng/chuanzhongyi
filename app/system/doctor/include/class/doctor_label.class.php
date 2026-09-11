<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('base/base_label');

class doctor_label extends base_label
{
    public function __construct()
    {
        global $_M;
        $this->construct('doctor', 14, $_M['config']['met_doctor_list']);
    }

    /**
     * 按所属医馆获取中医师列表（带分页信息，供医馆详情页调用）
     * @param int $yiguan 医馆（产品）内容ID
     * @param int $page 当前页码
     * @param int $num 每页条数
     * @return array
     */
    public function get_list_by_yiguan($yiguan = 0, $page = 1, $num = 12)
    {
        $page = intval($page) > 0 ? intval($page) : 1;
        $num = intval($num) > 0 ? intval($num) : 12;
        $result = array('list' => array(), 'total' => 0, 'pages' => 0, 'page' => 1, 'num' => $num);

        $total = $this->database->get_count_by_yiguan($yiguan);
        if (!$total) {
            return $result;
        }

        $pages = intval(ceil($total / $num));
        $page = $page > $pages ? $pages : $page;

        $result['list'] = $this->handle->para_handle($this->database->get_list_by_yiguan($yiguan, ($page - 1) * $num, $num));
        $result['total'] = $total;
        $result['pages'] = $pages;
        $result['page'] = $page;

        return $result;
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
