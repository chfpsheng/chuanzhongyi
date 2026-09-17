<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('base/base_handle');


class shaoer_handle extends base_handle
{

    public function __construct()
    {
        global $_M;
        $this->construct('shaoer');
    }

    public function one_para_handle($content = array())
    {
        $content = parent::one_para_handle($content);

        if ($content) {
            //活动时间：起止时间都有时用 ~ 连接
            $start = !empty($content['start_time']) ? strtotime($content['start_time']) : 0;
            $end = !empty($content['end_time']) ? strtotime($content['end_time']) : 0;
            $content['start_time_text'] = $start ? date('Y-m-d H:i', $start) : '';
            $content['end_time_text'] = $end ? date('Y-m-d H:i', $end) : '';
            if ($start && $end) {
                $content['shaoer_time'] = $content['start_time_text'] . ' ~ ' . $content['end_time_text'];
            } else {
                $content['shaoer_time'] = $content['start_time_text'] ? $content['start_time_text'] : $content['end_time_text'];
            }

            //活动地点为纯文本，输出前转义
            $content['location'] = isset($content['location']) ? htmlspecialchars($content['location'], ENT_QUOTES, 'UTF-8') : '';

            //所属地区：四川省 市/州 + 区/县，输出前转义并拼成可读文本
            $region_city = isset($content['region_city']) ? trim($content['region_city']) : '';
            $region_district = isset($content['region_district']) ? trim($content['region_district']) : '';
            $content['region_city'] = htmlspecialchars($region_city, ENT_QUOTES, 'UTF-8');
            $content['region_district'] = htmlspecialchars($region_district, ENT_QUOTES, 'UTF-8');
            $content['region_text'] = htmlspecialchars(trim($region_city . ' ' . $region_district), ENT_QUOTES, 'UTF-8');

            //是否免费：1免费 0收费，默认免费
            $content['is_free'] = (isset($content['is_free']) && $content['is_free'] == 0) ? 0 : 1;
            $content['is_free_text'] = $content['is_free'] ? '免费' : '收费';
        }

        return $content;
    }

}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
