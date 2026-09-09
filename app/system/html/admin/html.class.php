<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_class('admin');

class html extends admin
{
    public function __construct()
    {
        global $_M;
        parent::__construct();
        $this->html_handle = load::mod_class('html/html_handle', 'new');
        $this->config = array(
            'met_webhtm',
            'met_htmway',
            'met_htmlurl',
            'met_htmtype',
            'met_htmpagename',
            'met_listhtmltype',
            'met_htmlistname',
            'met_html_auto',
        );
    }

    /**
     * 获取静态页面设置
     */
    public function doGetSetup()
    {
        global $_M;
        $redata = array();
        foreach ($this->config as $name) {
            $redata[$name] = isset($_M['config'][$name]) ? $_M['config'][$name] : '';
        }
        $this->success($redata);
    }

    /**
     * 保存静态页面设置
     */
    public function doSaveSetup()
    {
        global $_M;
        //开启静态后关闭伪静态 && 删除重写文件
        if ($_M['form']['met_webhtm']) {
            $query = "UPDATE {$_M['table']['config']} SET `value` = 0 WHERE `name`='met_pseudo'";
            DB::query($query);

            $seo_open = load::mod_class('seo/seo_open','new');
            $seo_open->delRewrite();  //删除重新文件
            if ($_M['form']['met_webhtm'] == 3) {
                $seo_open->buildRewrite();  //混合模式创建重写文件
            }
        }

        //保存系统配置
        configsave($this->config);
        buffer::clearConfig();

        $redata = array();
        $redata['callback_url'] = '';
        if ($_M['form']['met_html_auto'] && $_M['form']['met_webhtm']) {//html自动更新
            $redata['callback_url'] = $url = $_M['url']['web_site'] . "app/system/entrance.php?n=html&c=html&a=doSetval&lang={$_M['lang']}";
        }

        //写日志
        logs::addAdminLog('physicalstatic', 'submit', 'jsok', 'doSaveSetup');
        $this->success($redata, $_M['word']['jsok']);
    }

    /**
     * 删除静态文件
     */
    public function doDelHtml(){
        global $_M;
        $pageinfo = array();
        $pageinfo[] = $this->html_handle->homePage();
        $pageinfo = $this->html_handle->getPageInfo($pageinfo, '', '', '', '', 1, '');
        $pages = $this->html_handle->getQueryList($pageinfo);

        $ext = array('html', 'htm');
        foreach ($pages as $page) {
            $fpath = PATH_WEB . $page['filename'];
            $info = pathinfo($fpath);
            if (is_file($fpath) && isset($info['extension']) && in_array($info['extension'], $ext)) {
                delfile($fpath);
            }
        }

        buffer::clearConfig();
        logs::addAdminLog('physicalstatic', 'delete', 'jsok', 'doDelHtml');
        $this->success('', $_M['word']['jsok']);
        return;
    }

    /**
     * 静态页面生成页面
     */
    public function doGetHtml()
    {
        global $_M;
        buffer::clearConfig();
        $redata = array();

        $list = array();
        $list['name'] = $_M['word']['htmAll'];
        $list['content']['name'] = $_M['word']['htmCreateAll'];
        $list['content']['url'] = "{$_M['url']['own_form']}&a=doCreatePage&all=1";
        $redata[] = $list;

        $list = array();
        $list['name'] = $_M['word']['seotips6'];
        $list['content']['name'] = $_M['word']['htmTip3'];
        $list['content']['url'] = "{$_M['url']['own_form']}&a=doCreatePage&index=1";
        $redata[] = $list;

        $module = load::mod_class('column/column_op', 'new')->get_sorting_by_module(false, $_M['mark']);
        foreach ($module as $mod => $valm) {
            if (in_array($mod, array(1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13))) {
                foreach ($valm['class1'] as $keyc1 => $valc1) {
                    $list = array();
                    $list['name'] = $valc1['name'];
                    $list['content']['name'] = $_M['word']['htmTip1'];
                    $list['content']['url'] = "{$_M['url']['own_form']}&a=doCreatePage&type=content&module={$valc1['module']}&class1={$valc1['id']}";

                    //模块内容列表页
                    if (in_array($valc1['module'], array(2, 3, 4, 5, 6, 7)) && in_array($_M['config']['met_webhtm'], array(2, 3))) {
                        $list['column']['name'] = $_M['word']['htmTip2'];
                        $list['column']['url'] = "{$_M['url']['own_form']}&a=doCreatePage&type=column&module={$valc1['module']}&class1={$valc1['id']}";
                    }
                    $redata[] = $list;
                }

                //二级栏目
                foreach ($valm['class2'] as $keyc2 => $valc2) {
                    if (!in_array($valc2['module'], array(7, 9, 11, 12, 13))) {
                        continue;
                    }

                    $list = array();
                    if ($valc2['module'] == 7) {
                        $list['name'] = $valc2['name'];
                        $list['column']['name'] = $_M['word']['htmTip2'];
                        $list['column']['url'] = "{$_M['url']['own_form']}&a=doCreatePage&type=column&module={$valc2['module']}&class1={$valc2['id']}";
                    }else{
                        $list['name'] = $valc2['name'];
                        $list['content']['name'] = $_M['word']['htmTip1'];
                        $list['content']['url'] = "{$_M['url']['own_form']}&a=doCreatePage&type=content&module={$valc2['module']}&class1={$valc2['id']}";
                    }
                    $redata[] = $list;
                }
            }
        }
        $this->success($redata);
    }

    /**
     * 异步生成静态页（数据库队列版）
     */
    public function doCreatePage()
    {
        global $_M;
        $all = isset($_M['form']['all']) ? $_M['form']['all'] : '';
        $index = isset($_M['form']['index']) ? $_M['form']['index'] : '';
        $list_page = isset($_M['form']['list_page']) ? $_M['form']['list_page'] : '';
        $module = isset($_M['form']['module']) ? $_M['form']['module'] : '';
        $type = isset($_M['form']['type']) ? $_M['form']['type'] : '';
        $class1 = isset($_M['form']['class1']) ? $_M['form']['class1'] : '';
        $content = isset($_M['form']['content']) ? $_M['form']['content'] : '';

        $pageinfo = array();
        if ($all == 1 || $index == 1) {
            $pageinfo[] = $this->html_handle->homePage();
        }

        $pageinfo = $this->html_handle->getPageInfo($pageinfo, $type, $module, $list_page, $class1, $all, $content);
        $pages = $this->html_handle->getQueryList($pageinfo);
        $total = is_array($pages) ? count($pages) : 0;

        // 没有需要生成的页面，直接返回
        if ($total == 0) {
            $redata = array();
            $redata['total'] = 0;
            $redata['batch_id'] = '';
            $redata['status'] = 1;
            $this->success($redata, '没有需要生成的页面');
            return;
        }

        logs::addAdminLog('physicalstatic', 'js54', 'jsok', 'doLoop');

        // 建表（不存在则创建）
        $this->html_handle->createTable();

        // 生成批次号，写入数据库队列
        $batch_id = md5(uniqid(mt_rand(), true));
        $this->html_handle->insertQueue($pages, $batch_id, $_M['lang']);

        $redata = array();
        $redata['total'] = $total;
        $redata['batch_id'] = $batch_id;
        $redata['callback_url'] = $_M['url']['web_site'] . "app/system/entrance.php?n=html&c=html&a=doLoop&lang={$_M['lang']}&metinfonow={$_M['config']['met_member_force']}&batch_id={$batch_id}";
        $redata['check_url'] = "{$_M['url']['site_admin']}index.php?lang={$_M['lang']}&n=html&c=html&a=doCheckPage&batch_id={$batch_id}";
        $redata['retry_url'] = "{$_M['url']['site_admin']}index.php?lang={$_M['lang']}&n=html&c=html&a=doRetry&batch_id={$batch_id}";
        $this->success($redata);
    }

    /**
     * 重新生成失败页面（数据库队列版）
     */
    public function doRetry()
    {
        global $_M;
        $batch_id = isset($_M['form']['batch_id']) ? $_M['form']['batch_id'] : '';

        $this->html_handle->createTable();

        if (!$batch_id) {
            $this->success('', 'Finished');
            return;
        }

        // 重置失败记录为待生成（重试次数<10）
        $this->html_handle->resetFailedQueue($batch_id);

        $total = $this->html_handle->getBatchTotal($batch_id);

        $redata = array();
        $redata['total'] = $total;
        $redata['batch_id'] = $batch_id;
        $redata['callback_url'] = $_M['url']['web_site'] . "app/system/entrance.php?n=html&c=html&a=doLoop&lang={$_M['lang']}&metinfonow={$_M['config']['met_member_force']}&batch_id={$batch_id}";
        $redata['check_url'] = "{$_M['url']['site_admin']}index.php?lang={$_M['lang']}&n=html&c=html&a=doCheckPage&batch_id={$batch_id}";
        $redata['retry_url'] = "{$_M['url']['site_admin']}index.php?lang={$_M['lang']}&n=html&c=html&a=doRetry&batch_id={$batch_id}";
        $this->success($redata);
    }

    /**
     * 检查静态页生成进度（数据库队列版，实时完整状态）
     * 返回：总数、待生成、生成中、成功、失败、进度百分比、当前正在生成的页面
     */
    public function doCheckPage()
    {
        global $_M;
        $batch_id = isset($_M['form']['batch_id']) ? $_M['form']['batch_id'] : '';

        $this->html_handle->createTable();

        $finished = !$batch_id || $this->html_handle->isBatchFinished($batch_id);
        if ($finished) {
            //生成完毕
            $status = 1;
        } else {
            //循环
            $status = 2;
        }

        // 各状态数量统计（一次聚合查询，避免多次全量查询）
        $stats = $this->html_handle->getQueueStats($batch_id);
        $total = array_sum($stats);
        $done = $stats[2] + $stats[3]; // 已处理 = 成功 + 失败
        $progress = $total > 0 ? round($done / $total * 100, 1) : 0;

        // 当前正在生成的页面（最多5条，前端展示"正在生成：xxx"）
        $current = $this->html_handle->getQueueByStatus($batch_id, 1, 5);
        if (!$current) $current = array();

        // 失败记录最多返回50条详情，便于排查
        $err = $this->html_handle->getQueueByStatus($batch_id, 3, 50);
        if (!$err) $err = array();

        $redata['total'] = $total;           // 总数
        $redata['pending'] = $stats[0];      // 待生成
        $redata['processing'] = $stats[1];   // 生成中
        $redata['suc_num'] = $stats[2];      // 成功
        $redata['err_num'] = $stats[3];      // 失败
        $redata['progress'] = $progress;      // 进度百分比（如 67.5）
        $redata['current'] = $current;        // 当前正在生成的页面列表
        $redata['err'] = $err;                // 失败详情（最多50条）
        $redata['suc'] = array();             // 兼容字段，成功不返回详情
        $redata['status'] = $status;          // 1=已完成 2=进行中

        // 批次完成后，清理该批次的成功记录（失败记录保留7天用于排查，由 cleanOldBatches 定期清理）
        if ($finished && $batch_id) {
            $this->html_handle->cleanBatchSuccess($batch_id);
        }

        return jsoncallback($redata);
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
