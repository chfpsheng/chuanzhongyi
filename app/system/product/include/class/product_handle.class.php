<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('base/base_handle');

class product_handle extends base_handle
{

    public function __construct()
    {
        global $_M;
        $this->construct('product');
    }

    /**
     * 处理list数组
     * @param  string $content 内容数组
     * @return array            处理过后数组
     */
    public function one_para_handle($content = array())
    {
        global $_M;
        $content = parent::one_para_handle($content);

        //商品数据
        if ($content && $_M['config']['shopv2_open'] && $this->contents_page_name == 'product') {
            $goods = load::plugin('doget_goods', 1, $content['id']);
            if ($goods && is_array($goods)) {
                $content = array_merge($content, $goods);
            }
        }

        if ($content) {
            // 中医馆结构化字段：擅长项目 / 出诊时间 / 是否医保 / 预约方式
            $content = $this->handle_clinic_fields($content);
            // 图片 alt：医馆名 + 所在区县（SEO/无障碍），列表页与详情页共用
            $content['img_alt'] = $this->build_img_alt($content);
            // 详情页 FAQ：供前台展示与 head.php 输出 FAQPage 结构化数据
            $content['faq_list'] = $this->build_faq($content);
        }

        return $content;
    }

    /**
     * 中医馆结构化字段处理
     */
    protected function handle_clinic_fields($content = array())
    {
        // 擅长项目：逗号/顿号分隔 → 数组 + 文本
        $raw = isset($content['specialty']) ? (string)$content['specialty'] : '';
        $raw = str_replace(array('，', '、', ';', '；'), ',', $raw);
        $items = array();
        foreach (explode(',', $raw) as $one) {
            $one = trim(strip_tags($one));
            if ($one !== '') {
                $items[] = $one;
            }
        }
        $items = array_slice(array_values(array_unique($items)), 0, 12);
        $content['specialty_list'] = $items;
        $content['specialty_text'] = implode('、', $items);

        // 出诊时间 / 预约方式：纯文本，输出前转义
        $content['visit_time'] = isset($content['visit_time']) ? htmlspecialchars(trim((string)$content['visit_time']), ENT_QUOTES, 'UTF-8') : '';
        $content['booking'] = isset($content['booking']) ? htmlspecialchars(trim((string)$content['booking']), ENT_QUOTES, 'UTF-8') : '';

        // 医保：1 支持、0 不支持、其余为未标注
        $insurance = isset($content['insurance']) ? intval($content['insurance']) : 2;
        if ($insurance === 1) {
            $content['insurance_ok'] = 1;
            $content['insurance_text'] = '支持医保';
        } elseif ($insurance === 0) {
            $content['insurance_ok'] = 0;
            $content['insurance_text'] = '不支持医保';
        } else {
            $content['insurance_ok'] = -1;
            $content['insurance_text'] = '医保信息未标注';
        }

        return $content;
    }

    /**
     * 生成图片 alt：医馆名 + 区县/城市
     */
    protected function build_img_alt($content = array())
    {
        $title = isset($content['title']) ? trim(html_entity_decode(strip_tags($content['title']), ENT_QUOTES, 'UTF-8')) : '';
        if ($title === '') {
            return '';
        }
        $area = '';
        if (!empty($content['region_district'])) {
            $area = trim($content['region_district']);
        } elseif (!empty($content['region_city'])) {
            $area = trim($content['region_city']);
        }
        $alt = $title . ($area ? '（' . $area . '）' : '') . '中医馆';
        return htmlspecialchars($alt, ENT_QUOTES, 'UTF-8');
    }

    /**
     * 生成中医馆详情页 FAQ（3~5 组）
     * 优先使用结构化字段（擅长项目/出诊时间/医保/预约方式），字段缺失时自动跳过对应问题
     */
    protected function build_faq($content = array())
    {
        $title = isset($content['title']) ? trim(html_entity_decode(strip_tags($content['title']), ENT_QUOTES, 'UTF-8')) : '';
        if ($title === '') {
            return array();
        }
        $city = isset($content['region_city']) ? trim($content['region_city']) : '';
        $district = isset($content['region_district']) ? trim($content['region_district']) : '';
        $area = trim($city . $district);
        $desc = isset($content['description']) ? trim(preg_replace('/\s+/', ' ', html_entity_decode(strip_tags($content['description']), ENT_QUOTES, 'UTF-8'))) : '';
        $specialty = isset($content['specialty_text']) ? trim($content['specialty_text']) : '';
        $visit_time = isset($content['visit_time']) ? trim($content['visit_time']) : '';
        $booking = isset($content['booking']) ? trim($content['booking']) : '';
        $insurance_text = isset($content['insurance_text']) ? trim($content['insurance_text']) : '';
        $insurance_ok = isset($content['insurance_ok']) ? intval($content['insurance_ok']) : -1;

        $faq = array();
        if ($area) {
            $faq[] = array(
                'q' => $title . '在哪里？',
                'a' => $title . '位于' . $area . '。具体门牌地址与交通路线以医馆现场公示为准，就诊前建议先电话确认。',
            );
        }
        if ($specialty) {
            $faq[] = array(
                'q' => $title . '擅长哪些项目？',
                'a' => $title . '主要开展' . $specialty . '等项目。具体诊疗范围与坐诊医师安排以医馆现场公示为准。',
            );
        } elseif ($desc) {
            $faq[] = array(
                'q' => $title . '擅长哪些项目？',
                'a' => $desc,
            );
        }
        if ($visit_time) {
            $faq[] = array(
                'q' => $title . '的出诊时间是什么时候？',
                'a' => $title . '的出诊（挂号）时间为' . $visit_time . '，节假日安排可能调整，建议出行前电话确认。',
            );
        }
        if ($insurance_ok === 1) {
            $faq[] = array(
                'q' => $title . '可以用医保吗？',
                'a' => $title . '支持医保结算。可报销项目（饮片、针灸、推拿等）与门诊统筹比例以医馆现场公示及当地医保政策为准。',
            );
        } elseif ($insurance_ok === 0) {
            $faq[] = array(
                'q' => $title . '可以用医保吗？',
                'a' => $title . '暂不支持医保结算，就诊费用以自费为主，具体收费项目请以医馆现场公示为准。',
            );
        } else {
            $faq[] = array(
                'q' => $title . '可以用医保吗？',
                'a' => '该医馆的医保与门诊统筹信息尚未确认，是否可就地结算建议就诊前电话咨询，可报销项目各馆不同。',
            );
        }
        if ($booking) {
            $faq[] = array(
                'q' => $title . '怎么预约挂号？',
                'a' => '可通过' . $booking . '预约。名老中医号源紧张，建议提前确认出诊时间并预约。',
            );
        } else {
            $faq[] = array(
                'q' => $title . '怎么预约挂号？',
                'a' => '可通过医馆电话预约或到馆现场挂号，部分医馆支持微信公众号放号；名老中医号源紧张，建议提前确认出诊时间。',
            );
        }
        $faq[] = array(
            'q' => '如何核验' . $title . '的资质？',
            'a' => '就诊前请核验医疗机构的执业许可证，以及坐诊医师的医师资格证与医师执业证，信息以机构现场公示为准。',
        );

        return array_slice($faq, 0, 5);
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
