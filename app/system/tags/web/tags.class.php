<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_class('web');

class tags extends web
{
    public function __construct()
    {
        global $_M;
        parent::__construct();
    }


    public function doGetTagData()
    {
        global $_M;
        $data = $this->input_class();
        $this->check($data['access']);

        // 标签聚合页（/tags/）不是栏目，取不到栏目数据，这里补默认 TDK，避免标题为空
        if (empty($data['name'])) {
            $tag_title = '中医标签_中医馆·中医养生·药食同源话题聚合';
            $tag_keywords = '中医标签,中医馆标签,中医养生,药食同源,少儿中医,名老中医';
            $tag_description = '按标签汇总四川中医网的中医馆、中医师、中医养生与少儿中医内容，方便按话题查找相关的中医就诊与养生资料。';
            $this->seo($tag_title, $tag_keywords, $tag_description);
        } else {
            $this->seo($data['name'], $data['keywords'], $data['description']);
            $this->seo_title($data['ctitle']);
        }

        $this->add_input('searchword', urldecode($_M['form']['searchword']));
        $this->seo_canonical($data['url']);
        $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
        $this->view('tags', $this->input);
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
