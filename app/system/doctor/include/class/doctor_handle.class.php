<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('base/base_handle');


class doctor_handle extends base_handle
{

    public function __construct()
    {
        global $_M;
        $this->construct('doctor');
    }

    /**
     * 处理内容数据
     * 追加“所属医馆”的ID、名称和医馆详情页链接
     */
    public function one_para_handle($content = array())
    {
        $content = parent::one_para_handle($content);

        if ($content) {
            //挂号费转数值，空值统一为 0，前台按数值判断是否显示
            $content['fee'] = isset($content['fee']) ? floatval($content['fee']) : 0;
            //所属医院、毕业院校为纯文本，输出前转义
            $content['hospital'] = isset($content['hospital']) ? htmlspecialchars($content['hospital'], ENT_QUOTES, 'UTF-8') : '';
            $content['school'] = isset($content['school']) ? htmlspecialchars($content['school'], ENT_QUOTES, 'UTF-8') : '';
        }

        //数据异常时直接返回，避免对非数组内容赋值
        if (!is_array($content) || !$content) {
            return $content;
        }

        //“坐诊医馆”为多选，字段存逗号分隔的医馆内容ID（如 42,43）
        $content['yiguan_list'] = array();
        $content['yiguan_ids'] = '';
        $content['yiguan_names'] = '';
        $content['yiguan_links_html'] = '';

        if (isset($content['yiguan']) && $content['yiguan'] !== '' && $content['yiguan'] !== null) {
            $names = array();
            $links = array();
            foreach (self::parse_yiguan_ids($content['yiguan']) as $id) {
                $yiguan = $this->get_yiguan($id);
                if (!$yiguan) {
                    continue;
                }
                $content['yiguan_list'][] = array(
                    'id' => $id,
                    'name' => $yiguan['title'],
                    'url' => $yiguan['url'],
                );
                $names[] = $yiguan['title'];
                //医馆名称与链接均已由系统生成/已做实体编码，直接拼接输出
                $links[] = '<a href="' . $yiguan['url'] . '" title="' . $yiguan['title'] . '" target="_blank" rel="noopener">' . $yiguan['title'] . '</a>';
            }
            if ($content['yiguan_list']) {
                $content['yiguan_ids'] = implode(',', array_column($content['yiguan_list'], 'id'));
                $content['yiguan_names'] = implode('、', $names);
                $content['yiguan_links_html'] = implode('、', $links);
                //兼容只使用单个医馆的旧模板/旧调用：默认取第一个
                $first = reset($content['yiguan_list']);
                $content['yiguan_id'] = $first['id'];
                $content['yiguan_name'] = $first['name'];
                $content['yiguan_url'] = $first['url'];
            }
        }

        // 详情页 FAQ：供前台展示与 head.php 输出 FAQPage 结构化数据
        $content['faq_list'] = $this->build_faq($content);

        return $content;
    }

    /**
     * 生成中医师详情页 FAQ（3~5 组）
     * 说明：问答由已有字段推导，无需额外录入；字段缺失时自动跳过对应问题。
     */
    protected function build_faq($content = array())
    {
        $name = isset($content['title']) ? trim(html_entity_decode(strip_tags($content['title']), ENT_QUOTES, 'UTF-8')) : '';
        if ($name === '') {
            return array();
        }
        $desc = isset($content['description']) ? trim(preg_replace('/\s+/', ' ', html_entity_decode(strip_tags($content['description']), ENT_QUOTES, 'UTF-8'))) : '';
        $hospital = isset($content['hospital']) ? trim($content['hospital']) : '';
        $fee = isset($content['fee']) ? floatval($content['fee']) : 0;
        $yiguan = isset($content['yiguan_names']) ? trim($content['yiguan_names']) : '';

        $faq = array();
        if ($desc) {
            $faq[] = array(
                'q' => $name . '医生擅长什么？',
                'a' => $desc,
            );
        }
        if ($yiguan) {
            $faq[] = array(
                'q' => $name . '医生在哪里坐诊？',
                'a' => $name . '医生目前在' . $yiguan . '坐诊，出诊时间以医馆排班为准，建议提前电话确认。',
            );
        }
        if ($fee > 0) {
            $faq[] = array(
                'q' => $name . '医生的挂号费是多少？',
                'a' => $name . '医生挂号费约 ' . $fee . ' 元，实际以医馆现场公示为准。',
            );
        }
        if ($hospital) {
            $faq[] = array(
                'q' => $name . '医生属于哪家医院？',
                'a' => $name . '医生所属医院为' . $hospital . '。',
            );
        }
        $faq[] = array(
            'q' => '怎么预约' . $name . '医生的号？',
            'a' => '可通过所在医馆电话预约或到馆现场挂号，名老中医号源紧张，建议提前确认出诊时间。',
        );
        $faq[] = array(
            'q' => '如何核验' . $name . '医生的资质？',
            'a' => '就诊前请核验医师的医师资格证与医师执业证，信息以医疗机构现场公示为准。',
        );

        return array_slice($faq, 0, 5);
    }

    /**
     * 解析“坐诊医馆”的多选值，返回医馆内容ID数组
     *
     * @param mixed $value 逗号分隔字符串（如 "42,43"）或数组
     * @return array
     */
    public static function parse_yiguan_ids($value = '')
    {
        if (is_array($value)) {
            $ids = $value;
        } else {
            $ids = explode(',', (string)$value);
        }
        $ids = array_map('intval', $ids);
        $ids = array_filter($ids); //去掉 0 与空值
        return array_values(array_unique($ids));
    }

    /**
     * 根据ID获取所属医馆（中医馆栏目的内容）
     * @param int $id 医馆内容ID
     * @return array
     */
    public function get_yiguan($id = 0)
    {
        global $_M;
        static $list = array();
        $id = intval($id);
        if (!$id) {
            return array();
        }
        if (!isset($list[$id])) {
            $list[$id] = array();
            $one = load::sys_class('label', 'new')->get('product')->database->get_list_one_by_id($id);
            if ($one && $one['recycle'] == 0) {
                //借用产品模块的URL规则生成医馆详情页链接
                $one['original_addtime'] = $one['addtime'];
                $one['url'] = load::mod_class('product/product_handle', 'new')->get_content_url($one);
                $list[$id] = $one;
            }
        }
        return $list[$id];
    }

}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
