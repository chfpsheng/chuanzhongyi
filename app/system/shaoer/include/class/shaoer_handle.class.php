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

            //活动状态：结束时间（无则开始时间）早于当前时间即视为已结束，保留页面与收录
            $content['is_past'] = 0;
            $deadline = $end ? $end : $start;
            if ($deadline && $deadline < time()) {
                $content['is_past'] = 1;
            }
            $content['status_text'] = $content['is_past'] ? '已结束' : '进行中/报名中';

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

            //所属医馆：中医馆内容ID，输出名称与详情链接（双向关联用）
            $content['yiguan_name'] = '';
            $content['yiguan_url'] = '';
            if (!empty($content['yiguan'])) {
                $yiguan = load::mod_class('doctor/doctor_handle', 'new')->get_yiguan($content['yiguan']);
                if ($yiguan) {
                    $content['yiguan_name'] = $yiguan['title'];
                    $content['yiguan_url'] = $yiguan['url'];
                }
            }

            // 详情页 FAQ：供前台展示与 head.php 输出 FAQPage 结构化数据
            $content['faq_list'] = $this->build_faq($content);
        }

        return $content;
    }

    /**
     * 生成少儿中医详情页 FAQ（3~5 组），字段缺失时自动跳过对应问题
     */
    protected function build_faq($content = array())
    {
        $title = isset($content['title']) ? trim(html_entity_decode(strip_tags($content['title']), ENT_QUOTES, 'UTF-8')) : '';
        if ($title === '') {
            return array();
        }
        $time = isset($content['shaoer_time']) ? trim($content['shaoer_time']) : '';
        $location = isset($content['location']) ? trim($content['location']) : '';
        $region = isset($content['region_text']) ? trim($content['region_text']) : '';
        $yiguan = isset($content['yiguan_name']) ? trim($content['yiguan_name']) : '';
        $free = !empty($content['is_free']);

        $faq = array();
        $faq[] = array(
            'q' => $title . '适合多大年龄的孩子？',
            'a' => '各期活动的年龄要求不同，一般适合 6 至 15 岁的儿童与青少年参加，具体以活动详情页说明为准。',
        );
        if ($time) {
            $faq[] = array(
                'q' => $title . '什么时候举办？',
                'a' => $title . '的活动时间为 ' . $time . '。具体场次与集合时间以主办方通知为准。',
            );
        }
        if ($location || $region) {
            $faq[] = array(
                'q' => $title . '在哪里举办？',
                'a' => $title . '举办地点为' . trim($region . ' ' . $location) . ($yiguan ? '，由' . $yiguan . '承办' : '') . '。出行前建议通过导航确认具体位置。',
            );
        }
        $faq[] = array(
            'q' => $title . '需要收费吗？',
            'a' => $title . ($free ? '为公益活动，不收取费用' : '为收费活动') . '。材料费、餐费与退改规则以主办方公布为准。',
        );
        $faq[] = array(
            'q' => '参加' . $title . '需要家长陪同吗？',
            'a' => '需要。未成年参与者须由家长或监护人陪同，活动期间请配合现场工作人员安排，注意孩子的安全与过敏史告知。',
        );

        return array_slice($faq, 0, 5);
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
