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

        if ($content && $content['yiguan']) {
            $yiguan = $this->get_yiguan($content['yiguan']);
            if ($yiguan) {
                $content['yiguan_id'] = $yiguan['id'];
                $content['yiguan_name'] = $yiguan['title'];
                $content['yiguan_url'] = $yiguan['url'];
            }
        }

        return $content;
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
