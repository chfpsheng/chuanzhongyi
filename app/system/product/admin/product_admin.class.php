<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::mod_class('base/admin/base_admin');

class product_admin extends base_admin
{
    public $moduleclass;
    public $shop_open;
    public $shop;
    public $module;
    public $specification_admin;

    /**
     * 「中医馆」栏目 ID（产品表 class1 的值）。
     * 与 app/system/doctor/admin/doctor_admin.class.php 中的 $yiguan_column 保持一致。
     * 若栏目调整，请同步修改此处。
     */
    public $yiguan_column = 104;

    /**
     * product_admin constructor.
     */
    function __construct()
    {
        global $_M;
        parent::__construct();
        $this->module = 3;
        $this->database = load::mod_class('product/product_database', 'new');
        self::shopIni();
    }

    /**
     * 「所属地区」二级联动数据（四川省 21 个地级行政区 → 区/县/县级市）。
     * 仅供中医馆栏目（class1 = 104）使用，在添加/编辑页面渲染二级下拉框。
     *
     * 输出结构为系统内置 select-linkage（jquery.cityselect）所需的层级：
     *   '[{"p":"四川省","c":[{"n":"成都市","a":[{"s":"锦江区"}]}]}]'
     * 与 job 模块 position_edit.php、content_details/head.php 中的用法完全一致。
     *
     * @return array{ province: string, citylist_json: string }
     */
    public function sichuan_region_options()
    {
        $data_file = __DIR__ . '/../include/data/sichuan_region.php';
        $regions = array();
        if (is_file($data_file)) {
            $regions = include $data_file;
        }
        if (!is_array($regions) || !$regions) {
            return array();
        }

        $cities = array();
        foreach ($regions as $city_name => $districts) {
            $district_list = array();
            foreach ((array)$districts as $district_name) {
                $district_list[] = array('s' => $district_name);
            }
            $cities[] = array('n' => (string)$city_name, 'a' => $district_list);
        }

        $province = '四川省';
        $province_list = array(
            array('p' => $province, 'c' => $cities),
        );

        return array(
            'province'      => $province,
            'citylist_json' => json_encode($province_list, JSON_UNESCAPED_UNICODE),
        );
    }

    /**
     * 当前表单是否属于中医馆栏目（class1 = 104）。
     * 用于条件渲染「所属地区」字段。
     *
     * @param mixed $class1
     * @return bool
     */
    public function is_yiguan_column($class1 = 0)
    {
        return intval($class1) === intval($this->yiguan_column);
    }

    protected function shopIni()
    {
        global $_M;
        $this->shop_open = false;
        if (!$_M['config']['shopv2_open']) return false;
        $shop_applist = DB::get_one("SELECT * FROM {$_M['table']['applist']} WHERE `no`='10043'");
        if (!$shop_applist) return false;

        $shop_appfile = file_exists(PATH_ALL_APP . 'shop');
        if (!$shop_appfile) return false;

        $this->specification_admin = load::app_class('shop/admin/specification_admin', 'new');
        $this->shop = load::plugin('doproduct_plugin_class', '99');
        if($this->shop) $this->shop_open = true;
        return true;
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
     * 商城模式产品管理
     */
    function doindex()
    {
        global $_M;
        $column = $this->column(3, $this->module);
        $list['class1'] = $_M['form']['class1'] ? $_M['form']['class1'] : '';
        $list['class2'] = $_M['form']['class2'] ? $_M['form']['class2'] : '';
        $list['class3'] = $_M['form']['class3'] ? $_M['form']['class3'] : '';

        if ($this->shop_open) {
            $tmpname = $this->shop->get_tmpname('product_shop_index');
            require $tmpname;
        } else {
            //$error = $_M['word']['app_shopv2_open_shop'] ? $_M['word']['app_shopv2_open_shop'] : '请前往商城设置开启商城模块';
            $str = "请前往<a href='".$_M['url']['adminurl']."n=shop&c=set&a=doindex' target='_top'> [设置] </a>开启 [商品设置] 选项";
            exit($str);
        }
    }

    /**
     * 获取栏目信息
     */
    public function doGetColumnSeting()
    {
        global $_M;
        $class1 = is_numeric($_M['form']['class1']) ? $_M['form']['class1'] : '';
        $class2 = is_numeric($_M['form']['class2']) ? $_M['form']['class2'] : '';
        $class3 = is_numeric($_M['form']['class3']) ? $_M['form']['class3'] : '';

        $redata = self::_GetColumnSeting($class1, $class2, $class3);
        $this->ajaxReturn($redata);
    }

    /**
     * @param int $class1
     * @param int $class2
     * @param int $class3
     * @return mixed
     */
    public function _GetColumnSeting($class1 = 0, $class2 = 0, $class3 = 0)
    {
        global $_M;
        $classnow = $class3 ? $class3 : ($class2 ? $class2 : $class1);

        $class = load::mod_class('column/column_label', 'new')->get_column_id($classnow);
        $c123 = load::mod_class('column/column_label', 'new')->get_class123_no_reclass($classnow);

        $c_lev = $class['classtype'];

        //三级栏目
        if ($c_lev == 3) {
            //tab_num
            $tab_num = $c123['class3']['tab_num'] ? $c123['class3']['tab_num'] : ($c123['class2']['tab_num'] ? $c123['class2']['tab_num'] : ($c123['class1']['tab_num'] ? $c123['class1']['tab_num'] : 3));

            //tab_name
            if ($c123['class3']['tab_name'] && trim($c123['class3']['tab_name'], "|")) {
                $tab_name = explode("|", $c123['class3']['tab_name']);
            } else {
                if ($c123['class2']['tab_name'] && trim($c123['class2']['tab_name'], "|")) {
                    $tab_name = explode("|", $c123['class2']['tab_name']);
                } else {
                    if ($c123['class1']['tab_name'] && trim($c123['class1']['tab_name'], "|")) {
                        $tab_name = explode("|", $c123['class1']['tab_name']);
                    } else {
                        $tab_name = array(
                            $_M['config']['met_productTabname'],
                            $_M['config']['met_productTabname_1'],
                            $_M['config']['met_productTabname_2'],
                            $_M['config']['met_productTabname_3'],
                            $_M['config']['met_productTabname_4']
                        );
                    }
                }
            }
        }

        //二级栏目将
        if ($c_lev == 2) {
            //tab_num
            $tab_num = $c123['class2']['tab_num'] ? $c123['class2']['tab_num'] : ($c123['class1']['tab_num'] ? $c123['class1']['tab_num'] : 3);

            //tab_name
            if ($c123['class2']['tab_name'] && trim($c123['class2']['tab_name'], "|")) {
                $tab_name = explode("|", $c123['class2']['tab_name']);
            } else {
                if ($c123['class1']['tab_name'] && trim($c123['class1']['tab_name'], "|")) {
                    $tab_name = explode("|", $c123['class1']['tab_name']);
                } else {
                    $tab_name = array(
                        $_M['config']['met_productTabname'],
                        $_M['config']['met_productTabname_1'],
                        $_M['config']['met_productTabname_2'],
                        $_M['config']['met_productTabname_3'],
                        $_M['config']['met_productTabname_4']
                    );
                }
            }
        }

        //一级栏目
        if ($c_lev == 1) {
            //tab_num
            $tab_num = $c123['class1']['tab_num'] ? $c123['class1']['tab_num'] : 3;

            //tab_name
            if ($c123['class1']['tab_name'] && trim($c123['class1']['tab_name'], "|")) {
                $tab_name = explode("|", $c123['class1']['tab_name']);
            } else {
                $tab_name = array(
                    $_M['config']['met_productTabname'],
                    $_M['config']['met_productTabname_1'],
                    $_M['config']['met_productTabname_2'],
                    $_M['config']['met_productTabname_3'],
                    $_M['config']['met_productTabname_4']
                );
            }
        }

        $redata['tab_name'] = "{$tab_name[0]}|{$tab_name[1]}|{$tab_name[2]}|{$tab_name[3]}|{$tab_name[4]}";
        $redata['tab_num'] = $tab_num;

        return $redata;
    }

    /**
     * 产品增加
     * @return array
     */
    public function doadd()
    {
        global $_M;
        $redata = array();
        $list = $this->add();
        $list['class1'] = $_M['form']['class1'] ? $_M['form']['class1'] : 0;
        $list['class2'] = $_M['form']['class2'] ? $_M['form']['class2'] : 0;
        $list['class3'] = $_M['form']['class3'] ? $_M['form']['class3'] : 0;
        $list['lnvoice'] = 0;
        $list['auto_sent'] = 0;
        //中医馆结构化字段默认值
        $list['specialty'] = '';
        $list['visit_time'] = '';
        $list['insurance'] = 2;
        $list['booking'] = '';

        if ($this->shop_open) {
            $list = $this->shop->default_value($list);
            $list_s['paraku'] = $this->specification_admin->dogetspeclist();
            $list_s['speclist'] = jsonencode($list_s['paraku']);
            $list = array_merge($list, $list_s);
        }
        $column_list = $this->_columnjson();
        $access_option = $this->access_option($list['access']);

        // 中医馆栏目才需要「所属地区」二级下拉数据
        $redata['list'] = $list;
        $redata['access_option'] = $access_option;
        $redata['is_yiguan'] = $this->is_yiguan_column($list['class1']);
        $redata['sichuan_region'] = $this->sichuan_region_options();
        $redata = array_merge($redata, $column_list);

        if (is_mobile()) {
            $this->success($redata);
        } else {
            if ($_M['form']['app_type'] == 'shop') {
                require $this->shop->get_tmpname('product_shop');
            } else {
                return $redata;
            }
        }
    }

    function doaddsave()
    {
        global $_M;
        $redata = array();
        $_M['form']['addtime'] = $_M['form']['addtype'] == 2 ? $_M['form']['addtime'] : date("Y-m-d H:i:s");
        $pid = $this->insert_list($_M['form']);
        if ($pid) {
            //商城产品属性
            if ($this->shop_open) {
                $this->shop->save_product($pid, $_M['form']);
            }

            //plugin
            $plugin_para = array(
                'lang' => $_M['lang'],
                'module' => $this->module,
                'aid' => $pid,
            );
            load::plugin('doaddsave', 0, $plugin_para);

            $url = "{$_M['url']['own_form']}a=doindex{$_M['form']['turnurl']}";
            $html_res = $this->html_op->htmlGenerate($_M['form']['class1'], $pid, $url);

            //写日志
            logs::addAdminLog('administration', 'addinfo', 'jsok', 'doaddsave');
            if ($_M['form']['app_type']) {
                okinfo($_M['form']['turnurl'], $_M['word']['jsok']);
            } else {
                $redata['status'] = 1;
                $redata['msg'] = $_M['word']['jsok'];
                $redata['html_res'] = $html_res;
                $redata['back_url'] = $url;
                $this->ajaxReturn($redata);
            }
        } else {
            //写日志
            logs::addAdminLog('administration', 'addinfo', 'dataerror', 'doaddsave');
            if ($_M['form']['app_type']) {
                okinfo('-1', $_M['word']['dataerror']);
            } else {
                $redata['status'] = 0;
                $redata['msg'] = $_M['word']['dataerror'];
                $redata['error'] = $this->error;
                $this->ajaxReturn($redata);
            }
        }
    }

    /**
     * @param array $list
     * @return bool|mixed|number
     */
    public function insert_list($list = array())
    {
        global $_M;
        $list['classother'] = $list['classother'] ? $list['classother'] : '';//mod2
        return parent::insert_list($list);
    }

    /**
     * 中医馆（class1 = 104）批量导入接口：数据一律以草稿形式入库。
     *
     * 后台接口地址：?n=product&c=product_admin&a=doimportsave
     * 入参（二选一）：
     *   rows : JSON 数组字符串，元素键支持
     *          title/name(名称)、cover(门头照)、insurance(支持医保)、pool(支持统筹)、
     *          phone(电话)、address(地点)、intro(简介)、city(城市)、district(区县)
     *   csv  : CSV 文本，首行表头（名字,门头照,是否支持医保,是否支持统筹,电话,地址（代表门店）,医馆简介）
     *
     * 返回：{status:1, msg:..., data:{created:[], skipped:[], failed:[]}}
     *
     * 说明：
     *   1. displaytype 固定为 -1（草稿），需在后台人工确认后发布；
     *   2. 按「归一化标题」与现有中医馆内容去重，重名的跳过；
     *   3. 自定义字段按 paraint（183 地点 / 184 支持医保 / 185 支持统筹 / 186 电话 / 187 成立时间）写入。
     *
     * @return void
     */
    public function doimportsave()
    {
        global $_M;

        $rows = $this->yiguan_import_parse_input();
        if (!$rows) {
            $this->error('没有可导入的数据：请提交 rows(JSON) 或 csv 文本');
        }

        $created = array();
        $skipped = array();
        $failed = array();
        $exists = $this->yiguan_import_exist_map();
        $now = date('Y-m-d H:i:s');

        foreach ($rows as $i => $row) {
            if (!is_array($row)) {
                continue;
            }
            $rowno = $i + 1;
            $title = $this->yiguan_import_text(isset($row['title']) ? $row['title'] : '');
            if ($title === '') {
                $failed[] = array('row' => $rowno, 'title' => '', 'reason' => '缺少医馆名称');
                continue;
            }

            $key = $this->yiguan_import_title_key($title);
            if ($key !== '' && isset($exists[$key])) {
                $skipped[] = array('row' => $rowno, 'title' => $title, 'reason' => '同名医馆已存在(id=' . $exists[$key] . ')');
                continue;
            }

            $intro = $this->yiguan_import_text(isset($row['intro']) ? $row['intro'] : '');
            $address = $this->yiguan_import_text(isset($row['address']) ? $row['address'] : '');
            $phone = $this->yiguan_import_text(isset($row['phone']) ? $row['phone'] : '');
            $region = $this->yiguan_import_region(
                $address,
                $title,
                isset($row['city']) ? $row['city'] : '',
                isset($row['district']) ? $row['district'] : ''
            );

            $list = array(
                'title' => $title,
                'ctitle' => $title,
                'keywords' => $title,
                'description' => mb_substr(strip_tags(str_replace('；', '，', $intro)), 0, 190),
                'content' => $this->yiguan_import_intro_html($intro),
                'class1' => $this->yiguan_column,
                'class2' => 0,
                'class3' => 0,
                'region_city' => $region['city'],
                'region_district' => $region['district'],
                'imgurl' => '',
                'no_order' => 0,
                'access' => 0,
                'com_ok' => 0,
                'top_ok' => 0,
                'new_ok' => 0,
                'wap_ok' => 0,
                // -1 = 草稿（后台内容列表「草稿」筛选值）
                'displaytype' => -1,
                'addtime' => $now,
                'updatetime' => $now,
                'lang' => $_M['lang'],
                'issue' => $this->admin_member['admin_id'],
                // 系统属性（参数名格式 para-字段ID，由 parameter_op 自动写入 met_plist）
                'para-183' => $address,          // 地点
                'para-184' => $this->yiguan_import_yes_no(isset($row['insurance']) ? $row['insurance'] : '', 11, 12), // 支持医保
                'para-185' => $this->yiguan_import_yes_no(isset($row['pool']) ? $row['pool'] : '', 13, 14),          // 支持统筹
                'para-186' => $phone,            // 电话
                'para-187' => $this->yiguan_import_found_year($intro), // 成立时间
            );

            $pid = $this->insert_list($list);
            if ($pid) {
                if ($key !== '') {
                    $exists[$key] = $pid;
                }
                $created[] = array(
                    'row' => $rowno,
                    'id' => $pid,
                    'title' => $title,
                    'region' => trim($region['city'] . ' ' . $region['district']),
                    'cover_url' => isset($row['cover']) ? $this->yiguan_import_text($row['cover']) : '',
                );
            } else {
                $failed[] = array(
                    'row' => $rowno,
                    'title' => $title,
                    'reason' => implode(' / ', (array)$this->error),
                );
            }
        }

        $this->ajaxReturn(array(
            'status' => 1,
            'msg' => '导入完成：新增草稿 ' . count($created) . ' 条，跳过 ' . count($skipped) . ' 条，失败 ' . count($failed) . ' 条',
            'data' => array(
                'created' => $created,
                'skipped' => $skipped,
                'failed' => $failed,
            ),
        ));
    }

    /**
     * 解析导入入参：rows(JSON 数组) 优先，其次 csv 文本
     *
     * @return array
     */
    protected function yiguan_import_parse_input()
    {
        global $_M;
        $rows = array();

        $json = isset($_M['form']['rows']) ? $_M['form']['rows'] : '';
        if (is_array($json)) {
            $rows = $json;
        } elseif (is_string($json) && trim($json) !== '') {
            // 后台表单变量经过 daddslashes，先还原再解析
            $data = json_decode(stripslashes(trim($json)), true);
            if (is_array($data)) {
                $rows = $data;
            }
        }

        if (!$rows && !empty($_M['form']['csv'])) {
            $rows = $this->yiguan_import_parse_csv(stripslashes((string)$_M['form']['csv']));
        }

        return $rows;
    }

    /**
     * 解析 CSV 文本为导入数组（自动处理 BOM / GBK 编码）
     *
     * @param string $csv
     * @return array
     */
    protected function yiguan_import_parse_csv($csv)
    {
        $csv = str_replace(array("\r\n", "\r"), "\n", trim((string)$csv));
        if (substr($csv, 0, 3) === "\xEF\xBB\xBF") {
            $csv = substr($csv, 3);
        }
        if (!mb_check_encoding($csv, 'UTF-8')) {
            $csv = mb_convert_encoding($csv, 'UTF-8', 'GBK');
        }

        $handle = fopen('php://temp', 'r+');
        fwrite($handle, $csv);
        rewind($handle);

        $head = array();
        $rows = array();
        while (($line = fgetcsv($handle, 0, ',', '"', '')) !== false) {
            if ($line === array(null)) {
                continue; // 空行
            }
            $line = array_map(function ($val) {
                return is_string($val) ? trim($val) : '';
            }, $line);

            if (!$head) {
                foreach ($line as $col) {
                    $head[] = $this->yiguan_import_head_map($col);
                }
                continue;
            }

            $row = array();
            foreach ($line as $i => $val) {
                $name = isset($head[$i]) ? $head[$i] : '';
                if ($name !== '') {
                    $row[$name] = $val;
                }
            }
            if ($row) {
                $rows[] = $row;
            }
        }
        fclose($handle);

        return $rows;
    }

    /**
     * CSV 表头 → 内部字段名
     *
     * @param string $name
     * @return string
     */
    protected function yiguan_import_head_map($name)
    {
        $name = str_replace(array(' ', '　', '(', ')', '（', '）', ':', '：', '*'), '', (string)$name);
        $map = array(
            '名字' => 'title', '名称' => 'title', '医馆名称' => 'title', 'title' => 'title', 'name' => 'title',
            '门头照' => 'cover', 'cover' => 'cover',
            '是否支持医保' => 'insurance', '支持医保' => 'insurance', 'insurance' => 'insurance',
            '是否支持统筹' => 'pool', '支持统筹' => 'pool', 'pool' => 'pool',
            '电话' => 'phone', '联系电话' => 'phone', 'phone' => 'phone',
            '地址代表门店' => 'address', '地址' => 'address', '地点' => 'address', 'address' => 'address',
            '医馆简介' => 'intro', '简介' => 'intro', 'intro' => 'intro', 'description' => 'intro',
            '城市' => 'city', 'city' => 'city',
            '区县' => 'district', 'district' => 'district',
        );
        return isset($map[$name]) ? $map[$name] : '';
    }

    /**
     * 文本清理：数组转空、合并多余空白
     *
     * @param mixed $value
     * @return string
     */
    protected function yiguan_import_text($value)
    {
        if (is_array($value) || is_object($value)) {
            return '';
        }
        $value = str_replace(array("\r\n", "\r", "\n", "\t"), ' ', (string)$value);
        $value = preg_replace('/\s{2,}/u', ' ', $value);
        return trim($value);
    }

    /**
     * 标题去重键：去掉括号注释、空格与常见标点后比较
     *
     * @param string $title
     * @return string
     */
    protected function yiguan_import_title_key($title)
    {
        $title = $this->yiguan_import_text($title);
        $title = html_entity_decode($title, ENT_QUOTES, 'UTF-8');
        $title = preg_replace('/[\(（\[【][^\)）\]】]*[\)）\]】]/u', '', $title);
        $title = preg_replace('/[\s\x{3000}·・、，,。\.\-—_]+/u', '', $title);
        return mb_strtolower((string)$title);
    }

    /**
     * 现有中医馆内容（去重键 → id）
     *
     * @return array
     */
    protected function yiguan_import_exist_map()
    {
        global $_M;
        $map = array();
        $query = "SELECT id,title FROM {$_M['table']['product']} WHERE class1='{$this->yiguan_column}' AND lang='{$_M['lang']}' AND recycle=0";
        foreach ((array)DB::get_all($query) as $one) {
            $key = $this->yiguan_import_title_key($one['title']);
            if ($key !== '' && !isset($map[$key])) {
                $map[$key] = $one['id'];
            }
        }
        return $map;
    }

    /**
     * 简介文本 → 段落 HTML（按分号/句号分段）
     *
     * @param string $intro
     * @return string
     */
    protected function yiguan_import_intro_html($intro)
    {
        $intro = trim((string)$intro);
        if ($intro === '') {
            return '';
        }
        $html = '';
        foreach (preg_split('/[；;]+/u', $intro) as $part) {
            $part = $this->yiguan_import_text($part);
            if ($part === '') {
                continue;
            }
            $html .= '<p>' . htmlspecialchars($part, ENT_QUOTES, 'UTF-8') . '</p>';
        }
        return $html;
    }

    /**
     * 「是/否」类字段值转换
     *
     * 说明：源数据里的「未公开确认 / 建议致电 / 以门店为准 / 未核实 / 自费为主」等一律留空，
     * 交由人工在后台确认，避免写入错误结论。
     *
     * @param string $value  源值
     * @param int    $yes_id 选项「是」的ID
     * @param int    $no_id  选项「否」的ID
     * @return string
     */
    protected function yiguan_import_yes_no($value, $yes_id, $no_id)
    {
        $value = $this->yiguan_import_text($value);
        if ($value === '') {
            return '';
        }
        if (mb_strpos($value, '不支持') === 0 || mb_strpos($value, '否') === 0) {
            return (string)$no_id;
        }
        if (mb_strpos($value, '支持') === 0 || mb_strpos($value, '已开通') === 0 || mb_strpos($value, '是') === 0) {
            return (string)$yes_id;
        }
        return '';
    }

    /**
     * 从简介中提取成立年份（如「源于1924年」→「1924年」）
     *
     * @param string $intro
     * @return string
     */
    protected function yiguan_import_found_year($intro)
    {
        if (preg_match('/((?:18|19|20)\d{2})\s*年/u', (string)$intro, $out)) {
            return $out[1] . '年';
        }
        return '';
    }

    /**
     * 匹配「所属地区」：区县优先，其次城市；使用四川省行政区划数据
     *
     * @param string $address  地点/地址
     * @param string $title    医馆名称
     * @param string $city     显式传入的城市
     * @param string $district 显式传入的区县
     * @return array{city:string,district:string}
     */
    protected function yiguan_import_region($address = '', $title = '', $city = '', $district = '')
    {
        $regions = $this->yiguan_import_regions();
        $result = array('city' => '', 'district' => '');

        $city = $this->yiguan_import_text($city);
        $district = $this->yiguan_import_text($district);
        $text = $this->yiguan_import_text($city . ' ' . $district . ' ' . $address . ' ' . $title);

        if (!$text || !$regions) {
            return $result;
        }

        // 1) 显式区县
        if ($district !== '') {
            foreach ($regions as $city_name => $districts) {
                if (in_array($district, (array)$districts, true)) {
                    return array('city' => $city_name, 'district' => $district);
                }
            }
        }
        // 2) 文本里匹配区县
        foreach ($regions as $city_name => $districts) {
            foreach ((array)$districts as $district_name) {
                if ($district_name !== '' && mb_strpos($text, $district_name) !== false) {
                    return array('city' => $city_name, 'district' => $district_name);
                }
            }
        }
        // 3) 只匹配到城市（如「成都市」），区县留空
        if ($city !== '' && isset($regions[$city])) {
            return array('city' => $city, 'district' => '');
        }
        foreach ($regions as $city_name => $districts) {
            if (mb_strpos($text, $city_name) !== false) {
                return array('city' => $city_name, 'district' => '');
            }
        }
        // 4) 仅出现「成都」字样时默认成都市
        if (mb_strpos($text, '成都') !== false) {
            $result['city'] = '成都市';
        }
        return $result;
    }

    /**
     * 四川省行政区划数据（市 → 区/县）
     *
     * @return array
     */
    protected function yiguan_import_regions()
    {
        static $regions = null;
        if ($regions === null) {
            $file = PATH_SYS . 'product/include/data/sichuan_region.php';
            $regions = is_file($file) ? include $file : array();
            if (!is_array($regions)) {
                $regions = array();
            }
        }
        return $regions;
    }

    /**
     * 产品编辑
     */
    public function doeditor()
    {
        global $_M;
        $id = $_M['form']['id'] ? intval($_M['form']['id']) : null;
        $hid = $_M['form']['hid'] ? intval($_M['form']['hid']) : null;

        $data = $this->database->get_list_one_by_id($id);
        if (!$data) return is_mobile() ? $this->error() : array();

        if ($hid) {
            $data_his = load::mod_class('history/history_op', 'new')->getHistoryByid($hid);
            if (!$data_his) return is_mobile() ? $this->error() : array();
            unset($data_his['aid']);
            $data_his['id'] = $data['id'];
            $data = $data_his;
        }

        $list = $this->listAnalysis($data);

        $list['imgurl_all'] = $list['imgurl'];
        $displayimg = explode("|", $list['displayimg']);
        foreach ($displayimg as $val) {
            if ($val) {
                $img = explode("*", $val);
                $list['imgurl_all'] .= '|' . $img[1];
            }
        }
        $list['imgurl_all'] = trim($list['imgurl_all'], '|');
        if ($list['classother']) {
            $list['classother_str'] = str_replace("-|-", '|', $list['classother']);
            $list['classother_str'] = str_replace('|-', '|', $list['classother_str']);
            $list['classother_str'] = str_replace('-|', '', $list['classother_str']);
        }

        //商城商品数据
        if ($this->shop_open) {
            $list_s = $this->shop->default_value($list);
            $list_s['paraku'] = $this->specification_admin->dogetspeclist();
            $list_s['speclist'] = jsonencode($list_s['paraku']);
            $list = array_merge($list, $list_s);
        }
        $column_list = $this->_columnjson();

        $column_own = $_M['class']['column_label']->get_column_id($list['class_now']);
        $access_option = $this->access_option($column_own['access']);

        $redata = array();
        $redata['list'] = $list;
        $redata['access_option'] = $access_option;
        $redata['is_yiguan'] = $this->is_yiguan_column($list['class1']);
        $redata['sichuan_region'] = $this->sichuan_region_options();
        $redata = array_merge($redata, $column_list);

        if (is_mobile()) {
            $this->success($redata);
        } else {
            if ($_M['form']['app_type'] == 'shop') {
                $column_seting = self::_GetColumnSeting($list['class1'], $list['class2'], $list['class3']);
                $tab_name = explode("|", $column_seting['tab_name']);
                $_M['config']['met_productTabname'] = $tab_name[0];
                $_M['config']['met_productTabname_1'] = $tab_name[1];
                $_M['config']['met_productTabname_2'] = $tab_name[2];
                $_M['config']['met_productTabname_3'] = $tab_name[3];
                $_M['config']['met_productTabname_4'] = $tab_name[4];
                $_M['config']['met_productTabok'] = $column_seting['tab_num'];
                require $this->shop->get_tmpname('product_shop');
            } else {
                return $redata;
            }
        }
    }

    /**
     * 保存编辑
     */
    public function doeditorsave()
    {
        global $_M;
        $list = $_M['form'];
        $id = $list['id'];
        $redata = array();

        if (!is_numeric($id)) {
            //写日志
            logs::addAdminLog('administration', 'physicalupdate', 'dataerror', 'doeditorsave');
            $this->error($_M['word']['dataerror'], "No id");
        }

        if ($this->update_list($list, $id)) {
            if ($this->shop_open && $_M['form']['app_type'] == 'shop') {
                $this->shop->save_product($id, $list);
            }

            //plugin
            $plugin_para = array(
                'lang' => $_M['lang'],
                'module' => $this->module,
                'aid' => $id,
            );
            load::plugin('doeditorsave', 0, $plugin_para);

            //if($_M['config']['met_webhtm'] == 2 && $_M['config']['met_htmlurl'] == 0){
            $url = "{$_M['url']['own_form']}a=doindex&class1={$_M['form']['class1']}&class2={$_M['form']['class2']}&class3={$_M['form']['class3']}";
            $html_res = $this->html_op->htmlGenerate($_M['form']['class1'], $_M['form']['id'], $url);
            //写日志
            logs::addAdminLog('administration', 'editor', 'jsok', 'doaddsave');
            if ($_M['form']['app_type']) {
                okinfo($_M['form']['turnurl'], $_M['word']['jsok']);
            } else {
                $redata['status'] = 1;
                $redata['msg'] = $_M['word']['jsok'];
                $redata['html_res'] = $html_res;
                $redata['back_url'] = $url;
                $this->ajaxReturn($redata);
            }
        } else {
            //写日志
            logs::addAdminLog('administration', 'editor', 'dataerror', 'doeditorsave');

            if ($_M['form']['app_type']) {
                okinfo('-1', $_M['word']['dataerror']);
            } else {
                $this->error($_M['word']['dataerror']);
            }
        }
    }

    /**
     * 更新产品
     * @param array $list
     * @param string $id
     * @return bool
     */
    public function update_list($list = array(), $id = '')
    {
        $list['displayimg'] = $this->displayimg_check($list['displayimg']);
        return parent::update_list($list, $id);
    }

    /**
     * 内容列表
     */
    public function dojson_list()
    {
        global $_M;
        if ($this->shop_open && $_M['form']['app_type'] == 'shop') {
            $this->shop->plgin_json_list();
            return;
        }

        $class1 = is_numeric($_M['form']['class1']) ? $_M['form']['class1'] : '';
        $class2 = is_numeric($_M['form']['class2']) ? $_M['form']['class2'] : '';
        $class3 = is_numeric($_M['form']['class3']) ? $_M['form']['class3'] : '';
        $keyword = $_M['form']['keyword'];
        $search_type = $_M['form']['search_type'];
        foreach ($_M['form']['order'] as $key => $value) {
            $order[$value['name']] = $value['value'];
        }

        $list = self::getJsonList($class1, $class2, $class3, $keyword, $search_type, $order['hits'], $order['updatetime']);

        return $this->json_return($list);
    }

    public function json_return($data)
    {
        return $this->tabledata->rdata($data);
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
        $ps = '';

        $_class = '(';
        $_class .= $class1 ? " class1 = '{$class1}'" : " class1 IN ({$allow_class1}) ";
        $_class .= $class2 ? " AND class2 = '{$class2}'" : " AND  class2 IN ({$allow_class2}) ";
        $_class .= $class3 ? " AND class3 = '{$class3}'" : " AND  class3 IN ({$allow_class3}) ";
        $_class .= ")";

        if ($class3) {
            $_classother = "|-{$class1}-{$class2}-{$class3}-|";
        } elseif ($class2) {
            #$_classother = "|-{$class1}-{$class2}-0-|";
            $_classother = "|-{$class1}-{$class2}-";
        } elseif ($class1) {
            #$$_classother = "|-{$class1}-0-0-|";
            $_classother = "|-{$class1}-";
        }

        //栏目筛选
        if ($_classother) {
            $_where .= " AND ($_class OR (classother like '%{$_classother}%') ) ";
        } else {
            $_where .= " AND $_class ";
        }

        //筛选
        switch ($search_type) {
            case 0:
                break;
            case 1:
                $_where .= " AND {$ps}displaytype = '0'";
                break;
            case 2:
                $_where .= " AND {$ps}com_ok = '1'";
                break;
            case 3:
                $_where .= " AND {$ps}top_ok = '1'";
                break;
            case 4:
                $_where .= " AND {$ps}displaytype = '-1'";
                break;
        }

        //搜索
        $_where .= $keyword ? " AND title like '%{$keyword}%'" : '';

        //排序规则
        $met_class = $this->column(2, $this->module);
        $order = $this->list_order($met_class[$classnow]['list_order']);
        // 验证排序方向，防止SQL注入（白名单：仅允许 ASC / DESC）
        $allowed_order = array('ASC', 'DESC');
        if ($orderby_hits && in_array(strtoupper($orderby_hits), $allowed_order)) {
            $order = "{$ps}hits {$orderby_hits}";
        }
        if ($orderby_updatetime && in_array(strtoupper($orderby_updatetime), $allowed_order)) {
            $order = "{$ps}updatetime {$orderby_updatetime}";
        }
        $data = $this->pagelist($_where, $order);

        foreach ($data as $key => $val) {
            $row = array();
            $row['id'] = $val['id'];
            $row['no_order'] = $val['no_order'];
            $row['title'] = $val['title'];
            $row['url'] = $this->url($val, $this->module);
            $row['imgurl'] = $val['imgurl'];
            $row['com_ok'] = $val['com_ok'];
            $row['top_ok'] = $val['top_ok'];
            $row['displaytype'] = $val['displaytype'];
            $row['addtype'] = strtotime($val['addtime']) > time() ? 1 : 0;
            $row['price_html'] = $val['price_html'];
            $row['hits'] = $val['hits'];
            $row['updatetime'] = $val['updatetime'];
            #$row['state'] 	    = $state;
            $row['editor_url'] = "{$_M['url']['own_form']}a=doeditor&id={$val['id']}&class1={$class1}&class2={$class2}&class3={$class3}";
            $row['del_url'] = "{$_M['url']['own_form']}a=dolistsave&submit_type=del&allid={$val['id']}&class1={$class1}&class2={$class2}&class3={$class3}";
            $rarray[] = $row;
        }
        return $rarray;
    }

    /**
     * @param array $where
     * @param array $order
     * @return mixed
     */
    public function pageList($where = '', $order = '')
    {
        global $_M;
        $this->tabledata = load::sys_class('tabledata', 'new');

        $p = $_M['table']['product'];
        $s = $_M['table']['shopv2_product'];

        if ($this->shop_open) {//开启在线订购时
            $table = $p . ' LEFT JOIN ' . $s . " ON ({$p}.id = {$s}.pid)";
            $where = "{$p}.lang='{$_M['lang']}' AND ({$p}.recycle = '0' OR {$p}.recycle = '-1') {$where}";
        } else {
            $table = $p;
            $where = "lang='{$_M['lang']}' AND (recycle = '0' OR recycle = '-1') {$where}";
        }

        if ($this->admin_member['admin_issueok']) {
            $where = "({$where})  AND (issue = '{$this->admin_member['admin_id']}')";
        }

        $data = $this->tabledata->getdata($table, '*', $where, $order);
        return $data;
    }

    /**
     * 保存列表
     */
    public function dolistsave()
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
                        $this->html_op->htmlDel($id, $this->module);
                        $log_name = 'jslang1';
                        $res = $this->del_list($id, $_M['form']['recycle']);
                        if ($_M['form']['recycle'] == 0) {
                            if ($this->shop_open) {
                                $this->shop->del_product($id);
                            }
                            $log_name = 'jslang0';
                        }
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
                        $log_name = 'copyotherlang2';
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
                        $log_name = 'copy_tolang';
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
            //写日志
            logs::addAdminLog('administration', $log_name, 'jsok', 'dolistsave');
        } else {
            $redata['status'] = 0;
            $redata['msg'] = $this->error[0];
            $redata['error'] = $this->error;
            //写日志
            logs::addAdminLog('administration', $log_name, $this->error[0], 'dolistsave');

        }

        if ($_M['form']['app_type']) {
            okinfo('-1', $redata['msg']);
        } else {
            $this->ajaxReturn($redata);
        }
    }

    /**
     * 多语言内容复制
     */
    public function list_copy($id = '', $class1 = '', $class2 = '', $class3 = '')
    {
        global $_M;
        $copyid = parent::list_copy($id, $class1, $class2, $class3);
        if ($copyid) {
            //开启在线订购时
            if ($this->shop_open) {
                $this->shop->copy_product($id, $copyid);
            }
            return $copyid;
        }
        $this->error[] = 'error no id';
        return false;
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
