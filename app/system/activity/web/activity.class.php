<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_class('web');

class activity extends web
{
    public function __construct()
    {
        global $_M;
        parent::__construct();
    }

    public function doactivity()
    {
        global $_M;

        if ($this->listpage('activity') == 'list') {
            //列表页缩略图尺寸
            $_M['config']['met_activityimg_x'] = $this->input['thumb_list_x'];
            $_M['config']['met_activityimg_y'] = $this->input['thumb_list_y'];
            $_M['config']['met_activity_list'] = $this->input['list_length'];

            $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
            $this->view('activity', $this->input);
        } else {
            $this->doshowactivity();
        }
    }

    public function doshowactivity()
    {
        global $_M;
        $this->showpage('activity');

        //详情页缩略图尺寸
        $_M['config']['met_activitydetail_x'] = $this->input['thumb_detail_x'];
        $_M['config']['met_activitydetail_y'] = $this->input['thumb_detail_y'];


        $_M['class']['handle']->redirectUrl($this->input); //伪静态时动态链接跳转
        $this->view('showactivity', $this->input);
    }

}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
