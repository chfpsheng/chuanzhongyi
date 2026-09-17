<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_class('web');

class shaoer extends web
{
    public function __construct()
    {
        global $_M;
        parent::__construct();
    }

    public function doshaoer()
    {
        global $_M;

        if ($this->listpage('shaoer') == 'list') {
            //列表页缩略图尺寸
            $_M['config']['met_shaoerimg_x'] = $this->input['thumb_list_x'];
            $_M['config']['met_shaoerimg_y'] = $this->input['thumb_list_y'];
            $_M['config']['met_shaoer_list'] = $this->input['list_length'];

            $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
            $this->view('shaoer', $this->input);
        } else {
            $this->doshowshaoer();
        }
    }

    public function doshowshaoer()
    {
        global $_M;
        $this->showpage('shaoer');

        //详情页缩略图尺寸
        $_M['config']['met_shaoerdetail_x'] = $this->input['thumb_detail_x'];
        $_M['config']['met_shaoerdetail_y'] = $this->input['thumb_detail_y'];


        $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
        $this->view('showshaoer', $this->input);
    }

}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
