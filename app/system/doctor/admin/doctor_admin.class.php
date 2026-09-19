<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('base/admin/base_admin');

class doctor_admin extends base_admin
{
    public $module;
    public $database;
    public $para_list;
    public $plist_database;

    /**
     * 「中医馆」栏目ID（“所属医馆”下拉框的数据来源）
     * 如果中医馆栏目的ID有变动，只需修改此处的数字
     */
    public $yiguan_column = 104;

    /**
     * 默认排序号
     * 新增医师或排序留空时使用（越小越靠前，即默认排在同为 4 的医师之前/之后按更新时间）
     * 与 met_doctor.no_order 的列默认值、编辑页表单默认值保持一致
     */
    const DEFAULT_NO_ORDER = 4;

    /**
     * doctor_admin constructor.
     */
    public function __construct()
    {
        global $_M;
        parent::__construct();
        $this->module = 14;
        $this->database = load::mod_class('doctor/doctor_database', 'new');
    }

    public function dopara()
    {
        return parent::paramentList();
    }

    public function docolumnjson()
    {
        return parent::docolumnjson();
    }

    /**
     * 解析“坐诊医馆”的多选值，返回医馆内容ID数组
     *
     * @param mixed $value 逗号分隔字符串（如 "42,43"）或数组
     * @return array
     */
    public function yiguan_ids($value = '')
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
     * 规范化“坐诊医馆”多选值，落库统一为逗号分隔字符串
     * 未选择任何医馆时存空字符串
     *
     * @param mixed $value 表单提交值（逗号分隔字符串或数组）
     * @return string
     */
    private function format_yiguan($value = '')
    {
        return implode(',', $this->yiguan_ids($value));
    }

    /**
     * “坐诊医馆”多选框选项（支持多选）
     * 数据来源：「中医馆」栏目下的内容(met_product)
     *
     * @param mixed $choice 当前已选中的医馆内容ID，多个用逗号分隔
     * @return array
     */
    public function yiguan_option($choice = '')
    {
        global $_M;
        $option = array();
        $selected = $this->yiguan_ids($choice);
        $query = "SELECT id,title FROM {$_M['table']['product']} WHERE class1 = '{$this->yiguan_column}' AND lang = '{$_M['lang']}' AND recycle = 0 AND displaytype != -1 ORDER BY no_order ASC, id ASC";
        $list = DB::get_all($query);
        foreach ($list as $val) {
            $title = trim($val['title']);
            if ($title === '') {
                continue;
            }
            $option[] = array(
                'name' => $title,
                'val' => $val['id'],
                'checked' => in_array(intval($val['id']), $selected) ? 1 : 0,
            );
        }
        return $option;
    }

    /**
     * AJAX 搜索「中医馆」栏目下的内容，用于医生编辑页「所属医馆」下拉框。
     * GET 参数:
     *   keyword  关键字（模糊匹配 title），留空返回前 limit 条
     *   limit    返回条数上限，默认 50，最大 100
     * 返回 JSON 数组: [{id: int, name: string}, ...]
     */
    public function doyiguan_search()
    {
        global $_M;
        $keyword = isset($_M['form']['keyword']) ? trim($_M['form']['keyword']) : '';
        $limit = isset($_M['form']['limit']) ? max(1, min(100, (int)$_M['form']['limit'])) : 50;

        $where = "class1 = '{$this->yiguan_column}' AND lang = '{$_M['lang']}' AND recycle = 0 AND displaytype != -1";

        if ($keyword !== '') {
            // 转义 LIKE 通配符，避免用户输入 % / _ 影响匹配语义
            $kw = str_replace(array('\\', '%', '_'), array('\\\\', '\\%', '\\_'), $keyword);
            $where .= " AND title LIKE '%{$kw}%'";
        }

        $query = "SELECT id, title FROM {$_M['table']['product']} WHERE {$where} ORDER BY no_order ASC, id ASC LIMIT {$limit}";
        $list = DB::get_all($query);

        $result = array();
        foreach ($list as $val) {
            $title = trim($val['title']);
            if ($title === '') {
                continue;
            }
            $result[] = array(
                'id' => (int)$val['id'],
                'name' => $title,
            );
        }

        $this->ajaxReturn($result);
    }

    /**
     * 挂号费格式化
     * 空值或非数字统一按 0 保存，避免 MySQL 严格模式下写入空字符串报错
     *
     * @param mixed $fee 表单提交的挂号费
     * @return float
     */
    private function format_fee($fee = '')
    {
        if (!is_scalar($fee)) {
            return 0;
        }
        $fee = trim($fee);
        if ($fee === '' || !is_numeric($fee)) {
            return 0;
        }
        return round(floatval($fee), 2);
    }

    /**
     * 排序与重点推荐格式化
     * - no_order：排序号，数字越小越靠前（允许负数）；留空或非法值按默认值 4 保存
     * - tuijian：重点推荐，1=是 0=否，列表中优先级最高
     *
     * 注意：表单字段用 doctor_no_order / doctor_tuijian 命名。
     * 系统的内容编辑表单 action 上自带 no_order=旧值 查询参数，而框架的 load_form()
     * 是先读 POST 再读 GET（GET 会覆盖 POST），直接用 no_order 命名会被旧值覆盖，
     * 因此这里用带前缀的字段名，再映射回数据库字段。
     *
     * @param array $form 表单数据（$_M['form']）
     * @return array array('no_order' => int, 'tuijian' => int)
     */
    private function format_sort($form = array())
    {
        $no_order = isset($form['doctor_no_order']) ? $form['doctor_no_order'] : '';
        $tuijian = isset($form['doctor_tuijian']) ? $form['doctor_tuijian'] : '';

        if (!is_scalar($no_order) || trim((string)$no_order) === '' || !is_numeric($no_order)) {
            //默认排序号
            $no_order = self::DEFAULT_NO_ORDER;
        } else {
            $no_order = intval($no_order);
        }
        $tuijian = (!is_scalar($tuijian) || !intval($tuijian)) ? 0 : 1;

        return array('no_order' => $no_order, 'tuijian' => $tuijian);
    }

    /**
     * 新增内容
     */
    public function doadd()
    {
        global $_M;
        $redata = array();
        $list = $this->add();
        $list['yiguan'] = isset($list['yiguan']) ? $list['yiguan'] : '';
        $list['class1'] = $_M['form']['class1'];
        $list['class2'] = $_M['form']['class2'];
        $list['class3'] = $_M['form']['class3'];
        //擅长：长文本默认值
        $list['specialty'] = isset($list['specialty']) ? $list['specialty'] : '';
        $access_option = $this->access_option($list['access']);
        $column_list = $this->_columnjson();
        $redata['list'] = $list;
        $redata['access_option'] = $access_option;
        $redata['yiguan_option'] = $this->yiguan_option(isset($list['yiguan']) ? $list['yiguan'] : '');
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
        $_M['form']['fee'] = $this->format_fee($_M['form']['fee']);
        $_M['form']['yiguan'] = $this->format_yiguan(isset($_M['form']['yiguan']) ? $_M['form']['yiguan'] : '');
        //排序号与重点推荐
        $doctor_sort = $this->format_sort($_M['form']);
        $_M['form']['no_order'] = $doctor_sort['no_order'];
        $_M['form']['tuijian'] = $doctor_sort['tuijian'];
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
        $redata['yiguan_option'] = $this->yiguan_option(isset($list['yiguan']) ? $list['yiguan'] : '');
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
        $list['fee'] = $this->format_fee($list['fee']);
        $list['yiguan'] = $this->format_yiguan(isset($list['yiguan']) ? $list['yiguan'] : '');
        //排序号与重点推荐
        $doctor_sort = $this->format_sort($list);
        $list['no_order'] = $doctor_sort['no_order'];
        $list['tuijian'] = $doctor_sort['tuijian'];
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
