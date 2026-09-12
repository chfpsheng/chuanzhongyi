<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

/**
 * parameter标签类
 */

class parameter_label
{
    public $lang;

    /**
     * 初始化
     */
    public function __construct()
    {
        global $_M;
        $this->parameter_database = load::mod_class('parameter/parameter_database', 'new');
    }

    /**
     * @param string $module
     * @param string $class1
     * @param string $class2
     * @param string $class3
     * @param null $type
     * @return mixed
     */
    public function get_parameter($module = '', $class1 = '', $class2 = '', $class3 = '', $type = null)
    {
        return $this->parameter_database->get_parameter($module, $class1, $class2, $class3, $type);
    }

    /**
     * 获取字段提交表单，前台留言，反馈，招聘模块使用
     * @param string $module
     * @param array $parameter
     * @param array $column_config
     * @param null $simplify
     * @return mixed
     */
    public function build_parameter_form($module = '', $parameter = array(), $simplify = true)
    {
        global $_M;
        $userclass = load::sys_class('user', 'new');

        $parameter_list = array();
        foreach ($parameter as $key => $row) {
            $list = $this->parameter_database->get_para_values($module, $row['id']);
            $row['para_list'] = $list;
            //属性权限检测
            $power = $userclass->check_power($row['access']);
            if ($power > 0) {
                $parameter_list[] = $row;
            }
        }
        $paras = load::mod_class('parameter/parameter_handle', 'new')->para_handle_formation($module, $parameter_list, $simplify);
        return $paras;
    }

    /**
     * @param $module  模块编号
     * @param $id      内容id
     * @param $class1
     * @param $class2
     * @param $class3
     * @param int $type
     * @return array
     */

    //TODO
    //需要优化
    public function get_parameter_contents($module, $id, $class1, $class2, $class3, $type = 0, $one = array())
    {
        global $_M;
        $parameter = $this->parameter_database->get_parameter($module, $class1, $class2, $class3);
        $list = $this->parameter_database->get_list($id, $module);
        $userclass = load::sys_class('user', 'new');

        $relist = array();
        foreach ($parameter as $key => $val) {
            if ($type && $val['type'] != $type) {
                continue;
            }

            if (!$type && $val['type'] == 10) {
                continue;
            }

            //参数权限控制
            if ($_M['config']['access_type'] == 2) {
                $power = $userclass->check_power($val['access']);
                if ($power < 0) {
                    continue;
                }
            }

            if (
                ($val['class1'] == 0) ||
                ($val['class1'] == $class1 && $val['class2'] == 0) ||
                ($val['class1'] == $class1 && $val['class2'] == $class2 && $val['class3'] == 0) ||
                ($val['class1'] == $class1 && $val['class2'] == $class2 && $val['class3'] == $class3)
            ) {
                if ($val['type'] == 5) {//附件
                    if ($list[$val['id']]['info']) {
                        $url = $_M['class']['handle']->url_transform($list[$val['id']]['info']);
                        $value = "<a target='_blank' href='{$url}'>{$_M['word']['downloadtext1']}</a>";
                    } else {
                        $value = '';
                    }
                } elseif (in_array($val['type'], array(2, 4, 6))) {//单选、多选、下拉

                    $paraMaps = $this->parameter_database->get_para_value_map();
                    $value = '';
                    $info = $list[$val['id']]['info'];
                    $para_ids = array();
                    if (strstr($info, ',')) {
                        $para_ids = explode(',', $info);
                    } else {
                        $para_ids[] = $info;
                    }
                    foreach ($para_ids as $para_id) {
                        $para_value = $paraMaps[$para_id];
                        if ($para_value) {
                            $value .= "," . $para_value;
                        }
                    }
                    $value = trim($value, ',');
                } else {
                    $value = $list[$val['id']]['info'];
                }

                $value = trim($value, ',');
                $para = array();
                $para['id'] = $val['id'];
                $para['name'] = $val['name'];
                if ($val['type'] == 10) {
                    $para['value'] = $val['access'] ? ($value != '' ? $userclass->check_power_link($value, $val['access']) : '') : $value;
                } else {
                    $para['value'] = $val['access'] ? ($value != '' ? $userclass->check_power_script($value, $val['access']) : '') : $value;
                }

                // 详情页：未填值的参数整行不显示（去掉空白后为空视为未填）
                if (trim((string)$para['value']) === '') {
                    continue;
                }

                $relist[] = $para;
            }
        }
        if ($type == 10) {
            $inquiry = self::inquiry($one);
            if ($inquiry) {
                $relist[] = $inquiry;
            }
        }

        return $relist;
    }

    /**
     * 在线询价
     * @param array $one
     * @return array
     */
    protected function inquiry($one = array())
    {
        global $_M;
        $feedback = load::mod_class('feedback/feedback_database', 'new');
        $inquiry = $feedback->get_inquiry();
        $currentArr = array($one['class1'], $one['class2'], $one['class3']);
        $para = array();
        if ($inquiry) {
            $inquiryArr = explode('-', $inquiry['value']);
            $match = true;
            for ($i = 0; $i < count($inquiryArr); $i++) {
                if ($inquiryArr[$i] != '0' && $inquiryArr[$i] != $currentArr[$i]) {
                    $match = false;
                    break;
                }
            }
            if ($match) {
                $fd_column = load::mod_class('column/column_database', 'new')->get_column_by_id($inquiry['columnid']);
                $one_title = isset($one['title']) ? urlencode($one['title']) : '';
               
                $para['id'] = 0;
                $para['name'] = $_M['word']['feedbackinquiry'];
                $para['value'] = $_M['url']['web_site'] . "{$fd_column['foldername']}/index.php?fdtitle={$one_title}&lang={$_M['lang']}";
            }
        }
        return $para;
    }

    /**
     * 获取字段搜索sql语句
     * @param  string $module 模块类型
     * @param  string /array  $info    被搜索信息
     * @return string                 sql语句
     */
    public function get_search_list_sql($module, $precision, $info)
    {
        global $_M;
        $mod = $_M['class']['handle']->file_to_mod($module);
        if (!is_array($info)) {
            if ($precision) {
                $sql = "SELECT listid FROM {$_M['table']['plist']} WHERE info = '{$info}'";
            } else {
                
                $sql = "SELECT listid FROM {$_M['table']['plist']} WHERE info like '%{$info}%' AND module = '{$mod}'";
            }
           
        } else {
            $list = array();
            $para_num = 0;
            $pidMap = array();
            foreach ($info as $key => $val) {
                if (!$val['info']) {
                    continue;
                }
                $pids = array();
                foreach($_M['module_plist'][$mod] as $item){
                    if(!$item['info']){
                        continue;
                    }
                    if($item['paraid'] == $val['id']){
                        $infos = explode(',', $item['info']);

                        if(in_array($val['info'][0], $infos)){
                            $pids[] = $item['listid'];
                            $pidMap[$item['listid']][] = $item['paraid'];
                        }
                    }
                }
                
                
            }
            $listid = array();
            foreach($pidMap as $key => $val){
                if(count($val) == count($info)){
                    $listid[] = $key;
                }
            }
            $listid = array_unique($listid);
            if($listid){    
                $query = "SELECT listid FROM {$_M['table']['plist']} WHERE listid IN(" . implode(',', $listid) . ") AND module = '{$mod}'";
            }else{
                $query = "0";
            }
            return $query;
        }

        return $sql;
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
