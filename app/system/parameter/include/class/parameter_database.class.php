<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_class('database');

/**
 * 字段数据库类
 */

class  parameter_database extends database
{
    /**
     * 初始化
     */
    public $parameter_list_database;
    public function __construct()
    {
        global $_M;
        $this->construct($_M['table']['parameter']);
        $this->parameter_list_database = load::mod_class('parameter/parameter_list_database', 'new');
    }

    public function table_para()
    {
        return 'id|name|options|description|no_order|type|access|wr_ok|class1|class2|class3|module|lang|wr_oks|related|edit_ok';
    }

    //获取list存放的表
    public function get_plist_table($module)
    {
        global $_M;
        switch ($module) {
            case 7:
                $table = $_M['table']['mlist'];
                break;
            case 8:
                $table = $_M['table']['flist'];
                break;
            case 10:
                $table = $_M['table']['user_list'];
                break;
            default:
                $table = $_M['table']['plist'];
                break;
        }
        return $table;
    }

    /**
     * 获取字段
     * @param  string $lang 语言
     * @param  string $module 模块（3:产品|4:下载|5:图片|6:简历|7:留言|8:反馈|10:会员）
     * @param  string $class1 一级栏目
     * @return array            字段数组
     */
    public function get_list($id = '', $module = '')
    {
        global $_M;
        $this->parameter_list_database->construct($module);
        $plist = $this->parameter_list_database->get_by_listid($id);
        $relist = array();
        foreach ($plist as $key => $val) {
            $relist[$val['paraid']] = $val;
        }
        return $relist;
    }

    /**
     * 添加
     * @param  string $lang 语言
     * @param  string $module 模块（3:产品|4:下载|5:图片|6:简历|7:留言|8:反馈|10:会员）
     * @param  string $class1 一级栏目
     * @return array            字段数组
     */
    public function insert_list($listid = '', $paraid = '', $info = '', $imgname = '', $module = '')
    {
        global $_M;
        $para_list = load::mod_class('parameter/parameter_list_database', 'new');
        $para_list->construct($module);
        return $para_list->update_by_listid_paraid($listid, $paraid, $info, $imgname);
    }

    /**
     * 更新内容属性
     * @param string $listid 内容id
     * @param string $paraid 属性id
     * @param string $info 属性值
     * @param string $imgname 属性名称
     * @param string $module 模块（3:产品|4:下载|5:图片|6:简历|7:留言|8:反馈|10:会员）
     * @return mixed
     */
    public function update_list($listid = '', $paraid = '', $info = '', $imgname = '', $module = '')
    {
        global $_M;
        $para_list = load::mod_class('parameter/parameter_list_database', 'new');
        $para_list->construct($module);
        return $para_list->update_by_listid_paraid($listid, $paraid, $info, $imgname);
    }

    /**
     * 按内容id删除属性规格
     * @param string $listid
     * @param string $module
     * @return mixed
     */
    public function del_list($listid = '', $module = '')
    {
        global $_M;
        $para_list = load::mod_class('parameter/parameter_list_database', 'new');
        $para_list->construct($module);
        return $para_list->del_by_listid($listid);
    }

    /**
     * 按内容id 和属性id 删除属性规格
     * @param $listid
     * @param $paraid
     * @param $module
     * @return mixed
     */
    public function delete_list($listid, $paraid, $module)
    {
        $para_list = load::mod_class('parameter/parameter_list_database', 'new');
        $para_list->construct($module);
        return $para_list->delete_list_value($listid, $paraid);
    }


    /**
     * 获取栏目木属性
     * @param  string $lang 语言
     * @param  string $module 模块（3:产品|4:下载|5:图片|6:简历|7:留言|8:反馈|10:会员）
     * @param  string $class1 一级栏目
     * @param  string $class2 二级栏目
     * @param  string $class3 三级栏目
     * @param null $type
     * @return array 字段数组
     */
    public function get_parameter($module = '', $class1 = '', $class2 = '', $class3 = '', $type = null)
    {
        global $_M;
        
        // 获取所有参数数据
        $allParameters = $_M['module_parameters'];
        $parameters = isset($allParameters[$module]) ? $allParameters[$module] : array();
        
        // 筛选符合条件的数据
        $result = array();
        foreach ($parameters as $param) {
            // 检查类型条件
            if ($type && $param['type'] != $type) {
                continue;
            }
            
            // 检查栏目条件
            if ($class1 || $class2 || $class3) {
                $match = false;
                
                // 检查全局参数
                if ($param['class1'] == 0 && $param['class2'] == 0 && $param['class3'] == 0) {
                    $match = true;
                }
                
                // 检查一级栏目
                if (!$match && $class1 && $param['class1'] == $class1 && $param['class2'] == 0 && $param['class3'] == 0) {
                    $match = true;
                }
                
                // 检查二级栏目
                if (!$match && $class2 && $param['class1'] == $class1 && $param['class2'] == $class2 && $param['class3'] == 0) {
                    $match = true;
                }
                
                // 检查三级栏目
                if (!$match && $class3 && $param['class1'] == $class1 && $param['class2'] == $class2 && $param['class3'] == $class3) {
                    $match = true;
                }
                
                if (!$match) {
                    continue;
                }
            }
            
            $result[] = $param;
        }
        
        return $result;
    }

    /**
     * @param $cid  栏目id || 模块名称
     * @return array|null
     */
    public function get_list_by_class_no_next($cid = '')
    {
        global $_M;
        if (is_numeric($cid)) {
            $class123 = $_M['class']['column_label']->get_class123_no_reclass($cid);
            $module = $class123['class1']['module'];
        } else {
            $module = $_M['class']['handle']->file_to_mod($cid);
        }
        $sql = " {$this->langsql} AND module = '{$module}' ";

        if ($class123['class1']['id']) {
            if ($module == 6 || $module == 7) {
                $sql .= " AND (class1 = '{$class123['class1']['id']}' OR class1 = 0)";
            } else {
                $sql .= " AND class1 = '{$class123['class1']['id']}' ";
            }
        } else {
            $sql .= " AND ( class1 = '' OR class1 = '0' ) ";
        }

        if ($class123['class2']['id']) {
            $sql .= " AND class2 = '{$class123['class2']['id']}' ";
        } else {
            $sql .= " AND ( class2 = '' OR class2 = '0' ) ";
        }

        if ($class123['class3']['id']) {
            $sql .= " AND class3 = '{$class123['class3']['id']}' ";
        } else {
            $sql .= " AND ( class3 = '' OR class3 = '0' ) ";
        }

        $query = "SELECT * FROM {$_M['table']['parameter']} WHERE $sql ";
        return DB::get_all($query);
    }

    /**
     * 获取属性规格
     * @param $module
     * @param $listid
     * @param $paraid
     * @param string $lang
     * @return array|void
     */
    public function get_parameter_value($module, $listid, $paraid, $lang = '')
    {
        global $_M;
        $lang = $lang ? $lang : $_M['lang'];
        $para_list = load::mod_class('parameter/parameter_list_database', 'new');
        $para_list->construct($module);
        $plist = $para_list->select_by_listid_paraid($listid, $paraid);
        return $plist;
    }

    public function get_parameter_by_id($id = '')
    {
        global $_M;
        $query = "SELECT * FROM {$_M['table']['parameter']} WHERE id = '{$id}'";
        $parameter = DB::get_one($query);
        return $parameter;
    }

    public function get_parameter_type($id = '')
    {
        global $_M;
        $parameter = self::get_parameter_by_id($id);
        return $parameter['type'];
    }

    public function get_para_value($paraid = '', $info = '')
    {
        $type = self::get_parameter_type($paraid);
        if ($type == 2 || $type == 4 || $type == 6) {
            return self::get_parameter_value_by_id($info);
        } else {
            return $info;
        }
    }

    /**
     * @param string $id
     * @return int|string
     */
    public function get_parameter_value_by_id($id = '')
    {
        global $_M;
        $id = intval($id);
        if (!is_numeric($id)) {
            return $id;
        }
        $query = "SELECT `value` FROM {$_M['table']['para']} WHERE id = '{$id}'";
        $para = DB::get_one($query);
        return $para['value'];
    }

    public function get_para_value_map(){
        global $_M;
        $query = "SELECT id,value FROM {$_M['table']['para']}";
        $paras = DB::get_all($query);
        $map = array();
        foreach ($paras as $para){
            $map[$para['id']] = $para['value'];
        }
        return $map;
    }

    public function update_para_value($option = '')
    {
        global $_M;
        $query = "UPDATE {$_M['table']['para']} SET value = '{$option['value']}',`order`='{$option['order']}' WHERE id = {$option['id']}";
        $row = DB::query($query);
        return $row;
    }

    /**
     * 获取属性选项
     * @param string $module 模块
     * @param string $pid 属性id
     * @return array
     */
    public function get_para_values($module = '', $pid = '', $lang = '')
    {
        global $_M;
        $lang = $lang ? $lang : $_M['lang'];
        $query = "SELECT * FROM {$_M['table']['para']} WHERE pid = '{$pid}' AND module = '{$module}' AND lang = '{$lang}' ORDER BY `order` ASC";
        return DB::get_all($query);
    }

    public function add_para_value($option = '', $lang = '')
    {
        global $_M;
        $lang = $lang ? $lang : $_M['lang'];
        $query = "SELECT * FROM {$_M['table']['para']} WHERE pid = '{$option['pid']}' AND value='{$option['value']}' AND module = '{$option['module']}' AND lang = '{$lang}'";
        $para = DB::get_one($query);

        if ($para) {
            return false;
        }

        //$query = "INSERT INTO {$_M['table']['para']} SET pid = {$option['pid']},module = '{$option['module']}',`order`='{$option['order']}',value='{$option['value']}',lang='{$lang}'";
        $query = "INSERT INTO {$_M['table']['para']} (`pid` ,`module` ,`order`, `value`, `lang`) VALUES ('{$option['pid']}' , '{$option['module']}', '{$option['order']}' , '{$option['value']}','{$lang}');";
        $res = DB::query($query);

        if ($res) {
            return DB::insert_id();
        }
        return false;
    }

    public function delete_para_value($pid = '', $pids = array())
    {
        global $_M;
        if (!empty($pids)) {
            $paraid = implode(',', $pids);
            $query = "DELETE FROM {$_M['table']['para']} WHERE id NOT IN ($paraid) AND pid = '{$pid}'";
            return DB::query($query);
        } else {
            $query = "DELETE FROM {$_M['table']['para']} WHERE pid = '{$pid}'";
            return DB::query($query);
        }

    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
