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
            // 图片 alt：医馆名 + 所在区县（SEO/无障碍），列表页与详情页共用
            $content['img_alt'] = $this->build_img_alt($content);
            // 详情页 FAQ：供前台展示与 head.php 输出 FAQPage 结构化数据
            $content['faq_list'] = $this->build_faq($content);
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
     * 说明：问答由已有字段推导，无需额外录入；字段缺失时自动跳过对应问题。
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

        $faq = array();
        if ($area) {
            $faq[] = array(
                'q' => $title . '在哪里？',
                'a' => $title . '位于' . $area . '。具体门牌地址与交通路线以医馆现场公示为准，就诊前建议先电话确认。',
            );
        }
        if ($desc) {
            $faq[] = array(
                'q' => $title . '擅长哪些项目？',
                'a' => $desc,
            );
        }
        $faq[] = array(
            'q' => $title . '怎么预约挂号？',
            'a' => '可通过医馆电话预约或到馆现场挂号，部分医馆支持微信公众号放号；名老中医号源紧张，建议提前确认出诊时间。',
        );
        $faq[] = array(
            'q' => $title . '可以用医保吗？',
            'a' => '是否支持医保及门诊统筹报销以医馆现场公示为准，可报销项目（饮片、针灸、推拿等）各馆不同，就诊前建议电话确认。',
        );
        $faq[] = array(
            'q' => '如何核验' . $title . '的资质？',
            'a' => '就诊前请核验医疗机构的执业许可证，以及坐诊医师的医师资格证与医师执业证，信息以机构现场公示为准。',
        );

        return array_slice($faq, 0, 5);
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
