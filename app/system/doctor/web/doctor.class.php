<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_class('web');

class doctor extends web
{
    public function __construct()
    {
        global $_M;
        parent::__construct();
    }

    public function dodoctor()
    {
        global $_M;

        if ($this->listpage('doctor') == 'list') {
            //列表页缩略图尺寸
            $_M['config']['met_doctorimg_x'] = $this->input['thumb_list_x'];
            $_M['config']['met_doctorimg_y'] = $this->input['thumb_list_y'];
            $_M['config']['met_doctor_list'] = $this->input['list_length'];

            $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
            $this->view('doctor', $this->input);
        } else {
            $this->doshowdoctor();
        }
    }

    public function doshowdoctor()
    {
        global $_M;
        $this->showpage('doctor');

        //详情页缩略图尺寸
        $_M['config']['met_doctordetail_x'] = $this->input['thumb_detail_x'];
        $_M['config']['met_doctordetail_y'] = $this->input['thumb_detail_y'];


        $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
        $this->view('showdoctor', $this->input);
    }

}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
