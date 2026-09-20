<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('base/admin/base_admin');

class news_admin extends base_admin
{
    public $module;
    public $database;
    public $para_list;
    public $plist_database;

    /**
     * news_admin constructor.
     */
    public function __construct()
    {
        global $_M;
        parent::__construct();
        $this->module = 2;
        $this->database = load::mod_class('news/news_database', 'new');
    }

    public function dopara()
    {
        return parent::paramentList();
    }

    /**
     * 来源信息格式化（转载标注用）
     * - publisher：来源/作者名称
     * - source_url：原文链接，限制为 http/https，其他协议一律丢弃
     * - is_original：是否原创，1=是 0=否（默认 0=转载）
     *
     * 注意：表单字段用 news_ 前缀命名，避免与「其他设置」里的同名项冲突，
     * 这里再映射回数据库字段。
     *
     * @param array $form 表单数据
     * @return array array('publisher' => string, 'source_url' => string, 'is_original' => int)
     */
    private function format_source($form = array())
    {
        $result = array();
        if (array_key_exists('news_publisher', $form)) {
            $result['publisher'] = is_scalar($form['news_publisher']) ? trim((string)$form['news_publisher']) : '';
        }
        if (array_key_exists('news_is_original', $form)) {
            $result['is_original'] = (!is_scalar($form['news_is_original']) || !intval($form['news_is_original'])) ? 0 : 1;
        }
        if (array_key_exists('news_source_url', $form)) {
            $url = is_scalar($form['news_source_url']) ? trim((string)$form['news_source_url']) : '';
            if ($url !== '' && !preg_match('#^https?://#i', $url)) {
                // 只接受 http/https，避免 javascript: 等协议被写入前台链接
                $url = '';
            }
            // 原创时链接照旧保存（不丢失），前台与结构化数据都不会输出，见 shownews 模板与 head.php
            $result['source_url'] = $url;
        }
        return $result;
    }

    public function docolumnjson()
    {
        return parent::docolumnjson();
    }

    /**
     * 新增内容
     */
    public function doadd()
    {
        global $_M;
        $redata = array();
        $list = $this->add();
        $list['class1'] = $_M['form']['class1'];
        $list['class2'] = $_M['form']['class2'];
        $list['class3'] = $_M['form']['class3'];
        $access_option = $this->access_option($list['access']);
        $column_list = $this->_columnjson();
        $redata['list'] = $list;
        $redata['access_option'] = $access_option;
        $redata = array_merge($redata, $column_list);
        if (is_mobile()) {
            $this->success($redata);
        } else {
            return $redata;
        }
    }

    /**
     * 添加数据保存
     */
    public function doaddsave()
    {
        global $_M;
        $redata = array();
        $_M['form']['addtime'] = $_M['form']['addtype'] == 2 ? $_M['form']['addtime'] : $_M['form']['updatetime'];
        $_M['form']['issue'] = $this->admin_member['admin_id'];
        $_M['form']['hits'] = intval($_M['form']['hits']);
        //来源/作者、来源链接
        $_M['form'] = array_merge($_M['form'], $this->format_source($_M['form']));
        $id = $this->insert_list($_M['form']);
        if ($id && is_numeric($id)) {
            //plugin
            $plugin_para = array(
                'lang' => $_M['lang'],
                'module' => $this->module,
                'aid' => $id,
            );
            load::plugin('doaddsave', 0, $plugin_para);

            $url = "{$_M['url']['own_form']}a=doindex{$_M['form']['turnurl']}";
            $html_res = $this->html_op->htmlGenerate($_M['form']['class1'], $id, $url);
            //写日志
            logs::addAdminLog('administration', 'addinfo', 'jsok', 'doaddsave');
            $redata['status'] = 1;
            $redata['msg'] = $_M['word']['jsok'];
            $redata['html_res'] = $html_res;
            $redata['back_url'] = $url;
            $this->ajaxReturn($redata);
        } else {
            //写日志
            logs::addAdminLog('administration', 'addinfo', 'dataerror', 'doaddsave');
            $this->error($_M['word']['dataerror']);
        }
    }

    /**
     * 编辑文章页面
     */
    public function doeditor()
    {
        global $_M;
        $id = $_M['form']['id'] ? intval($_M['form']['id']) : null;
        $hid = $_M['form']['hid'] ? intval($_M['form']['hid']) : null;

        $data = $this->database->get_list_one_by_id($id);
        if (!$data) return is_mobile() ? $this->error() : array();

        if ($hid) {
            $data_his = load::mod_class('history/history_op', 'new')->getHistoryByid($hid);//历史记录
            if (!$data_his) return is_mobile() ? $this->error() : array();
            unset($data_his['aid']);
            $data_his['id'] = $data['id'];
            $data = $data_his;
        }

        $list = $this->listAnalysis($data);
        $column_own = $_M['class']['column_label']->get_column_id($list['class_now']);
        $access_option = $this->access_option($column_own['access']);
        $column_list = $this->_columnjson();

        $redata = array();
        $redata['list'] = $list;
        $redata['access_option'] = $access_option;
        $redata = array_merge($redata, $column_list);

        return is_mobile() ? $this->success($redata) : $redata;
    }

    /**
     * 修改保存页面
     * @param  array $list 插入的数组
     * @return number 插入后的数据ID
     */
    public function doeditorsave()
    {
        global $_M;
        $list = $_M['form'];
        //来源/作者、来源链接
        $list = array_merge($list, $this->format_source($list));
        $id = $_M['form']['id'] ? intval($_M['form']['id']) : null;

        if (!$id){
            logs::addAdminLog('administration', 'physicalupdate', 'dataerror', 'doeditorsave');
            $this->error($_M['word']['dataerror'], "No id");
        }

        if ($this->update_list($list, $id)) {
            //plugin
            $plugin_para = array(
                'lang' => $_M['lang'],
                'module' => $this->module,
                'aid' => $id,
            );
            load::plugin('doeditorsave', 0, $plugin_para);

            $url = "{$_M['url']['own_form']}a=doindex&class1={$_M['form']['class1']}&class2={$_M['form']['class2']}&class3={$_M['form']['class3']}";
            $html_res =  $this->html_op->htmlGenerate($_M['form']['class1'], $_M['form']['id'], $url);

            $redata = array();
            $redata['status'] = 1;
            $redata['msg'] = $_M['word']['jsok'];
            $redata['html_res'] = $html_res;
            $redata['back_url'] = $url;
            $this->ajaxReturn($redata);
        } else {
            $this->error($_M['word']['dataerror']);
        }
    }

    /**
     * 分页数据
     */
    public function dojson_list()
    {
        global $_M;
        $class1 = is_numeric($_M['form']['class1']) ? $_M['form']['class1'] : '';
        $class2 = is_numeric($_M['form']['class2']) ? $_M['form']['class2'] : '';
        $class3 = is_numeric($_M['form']['class3']) ? $_M['form']['class3'] : '';
        $keyword = $_M['form']['keyword'];
        $search_type = $_M['form']['search_type'];
        foreach ($_M['form']['order'] as $key => $value) {
            $order[$value['name']] = $value['value'];
        }

        $list = $this->getJsonList($class1, $class2, $class3, $keyword, $search_type, $order['hits'], $order['updatetime']);
        $this->json_return($list);
    }

    /**
     * @param string $class1
     * @param string $class2
     * @param string $class3
     * @param string $keyword
     * @param string $search_type
     * @param string $orderby_hits
     * @param string $orderby_updatetime
     * @return array
     */
    public function getJsonList($class1 = '', $class2 = '', $class3 = '', $keyword = '', $search_type = '', $orderby_hits = '', $orderby_updatetime = '')
    {
        global $_M;

        //栏目访问权限
        if (($class1 && !in_array($class1, $this->allow_class['class1'])) || ($class2 && !in_array($class2, $this->allow_class['class2'])) || ($class3 && !in_array($class3, $this->allow_class['class3']))) {
            return false;
        }

        $allow_class1 = implode(',', $this->allow_class['class1']);
        $allow_class2 = implode(',', $this->allow_class['class2']);
        $allow_class3 = implode(',', $this->allow_class['class3']);

        $classnow = $class3 ? $class3 : ($class2 ? $class2 : $class1);
        $_where = '';

        #$_where = $class1 ? " AND class1 = '{$class1}'" : ' and class1 = 0 ';
        $_where .= $class1 ? " AND class1 = '{$class1}'" : " AND class1 IN ({$allow_class1}) ";
        $_where .= $class2 ? " AND class2 = '{$class2}'" : " AND  class2 IN ({$allow_class2}) ";
        $_where .= $class3 ? " AND class3 = '{$class3}'" : " AND  class3 IN ({$allow_class3}) ";
        $_where .= $keyword ? " AND title like '%{$keyword}%'" : '';
        switch ($search_type) {
            case 0:
                break;
            case 1:
                $_where .= " AND displaytype = '0'";
                break;
            case 2:
                $_where .= " AND com_ok = '1'";
                break;
            case 3:
                $_where .= " AND top_ok = '1'";
                break;
            case 4:
                $_where .= " AND displaytype = '-1'";
                break;
        }

        if ($this->admin_member['admin_issueok']) {
            $_where .= " AND issue = '{$this->admin_member['admin_id']}'";
        }
        $met_class = $this->column(2, $this->module);

        //sql排序
        $order = $this->list_order($met_class[$classnow]['list_order']);
        // 验证排序方向，防止SQL注入
        $allowed_order = array('ASC', 'DESC');
        if ($orderby_hits && in_array(strtoupper($orderby_hits), $allowed_order)) {
            $order = "hits {$orderby_hits}";
        }
        if ($orderby_updatetime && in_array(strtoupper($orderby_updatetime), $allowed_order)) {
            $order = "updatetime {$orderby_updatetime}";
        }
        $userlist = $this->pagelist($_where, $order);

        foreach ($userlist as $key => $val) {
            $list['id'] = $val['id'];
            $list['title'] = $val['title'];
            $list['no_order'] = $val['no_order'];
            $list['url'] = $this->url($val, $this->module);
            $list['hits'] = $val['hits'];
            $list['com_ok'] = $val['com_ok'];
            $list['top_ok'] = $val['top_ok'];
            $list['addtype'] = strtotime($val['addtime']) > time() ? 1 : 0;
            $list['imgurl'] = $val['imgurl'];
            $list['updatetime'] = date("Y-m-d H:i:s", strtotime($val['updatetime']));
            $list['addtime'] = date("Y-m-d H:i:s", strtotime($val['addtime']));
            $list['displaytype'] = $val['displaytype'];
            $list['editor_url'] = "{$_M['url']['own_form']}a=doeditor&id={$val['id']}&class1={$class1}&class2={$class2}&class3={$class3}";
            $list['del_url'] = "{$_M['url']['own_form']}a=dolistsave&submit_type=del&allid={$val['id']}&class1={$class1}&class2={$class2}&class3={$class3}";

            if ($this->module == 4) {
                $list['downloadurl'] = $val['downloadurl'];
            }

            $rarray[] = $list;
        }

        return $rarray;
    }

    /**
     * 列表操作保存
     */
    function dolistsave()
    {
        global $_M;
        $redata = array();
        $list = explode(",", $_M['form']['allid']);

        foreach ($list as $id) {
            if ($id) {
                switch ($_M['form']['submit_type']) {
                    case 'save':
                        $log_name = 'submit';
                        $list['no_order'] = $_M['form']['no_order-' . $id];
                        $res = $this->list_no_order($id, $list['no_order']);
                        break;
                    case 'del':
                        $log_name = 'jslang1';
                        $this->html_op->htmlDel($id, $this->module);
                        $res = $this->del_list($id, $_M['form']['recycle']);
                        break;
                    case 'recycle':
                        $log_name = 'jslang0';
                        $res = $this->del_list($id, 1);
                        $this->html_op->htmlDel($id, $this->module);
                        break;
                    case 'comok':
                        $log_name = 'recom';
                        $res = $this->list_com($id, 1);
                        break;
                    case 'comno':
                        $log_name = 'unrecom';
                        $res = $this->list_com($id, 0);
                        break;
                    case 'topok':
                        $log_name = 'top';
                        $res = $this->list_top($id, 1);
                        break;
                    case 'topno':
                        $log_name = 'untop';
                        $res = $this->list_top($id, 0);
                        break;
                    case 'displayok':
                        $log_name = 'frontshow';
                        $res = $this->list_display($id, 1);
                        break;
                    case 'displayno':
                        $log_name = 'fronthidden';
                        $res = $this->list_display($id, 0);
                        $this->html_op->htmlDel($id, $this->module);
                        break;
                    case 'move':
                        if (!isset($_M['form']['columnid'])) {
                            break;
                        }
                        $log_name = 'columnmove1';
                        $class = explode("-", $_M['form']['columnid']);
                        $class1 = $class[0];
                        $class2 = $class[1];
                        $class3 = $class[2];
                        $res = $this->list_move($id, $class1, $class2, $class3);
                        break;
                    case 'copy':
                        if (!isset($_M['form']['columnid'])) {
                            break;
                        }
                        $log_name = 'copycontnet';
                        $class = explode("-", $_M['form']['columnid']);
                        $class1 = $class[0];
                        $class2 = $class[1];
                        $class3 = $class[2];
                        $newid = $this->list_copy($id, $class1, $class2, $class3);
                        break;
                    case 'copy_tolang':
                        if (!isset($_M['form']['columnid'])) {
                            break;
                        }
                        $log_name = 'copyotherlang';
                        $new_class = explode("-", $_M['form']['columnid']);
                        $tolang = $_M['form']['tolang'];
                        $module = $_M['form']['module'];
                        $res = $this->copy_tolang($id, $module, $tolang, $new_class);
                        break;
                }
            }
        }

        if (!$this->error) {
            $url = "{$_M['url']['own_form']}a=doindex&class1={$_M['form']['class1']}&class2={$_M['form']['class2']}&class3={$_M['form']['class3']}";
            $html_res = $this->html_op->htmlGenerate($_M['form']['class1'], $_M['form']['allid'], $url);
            $redata['status'] = 1;
            $redata['msg'] = $_M['word']['jsok'];
            $redata['html_res'] = $html_res;
            $redata['back_url'] = $url;
            logs::addAdminLog('administration', $log_name, 'jsok', 'dolistsave');
        } else {
            $redata['status'] = 0;
            $redata['msg'] = $this->error[0];
            $redata['error'] = $this->error;
            logs::addAdminLog('administration', $log_name, $this->error[0], 'dolistsave');
        }
        $this->ajaxReturn($redata);
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
