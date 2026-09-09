<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

class html_handle
{
    // 队列状态常量
    const STATUS_PENDING = 0;     // 待生成
    const STATUS_PROCESSING = 1;  // 生成中
    const STATUS_SUCCESS = 2;     // 成功
    const STATUS_FAILED = 3;      // 失败

    public function __construct()
    {
        global $_M;

    }

    /**
     * 校验 batch_id 格式：必须是32位十六进制（md5）
     * 不合法返回空字符串，从源头阻断 SQL 注入
     */
    public function validateBatchId($batch_id)
    {
        if (preg_match('/^[a-f0-9]{32}$/', $batch_id)) {
            return $batch_id;
        }
        return '';
    }
    /**
     * @param array $pageinfo
     * @return array
     */
    public function getQueryList(array $pageinfo)
    {
        global $_M;
        $pages = array();
        foreach ($pageinfo as $key => $val) {
            $mod = $_M['class']['handle']->mod_to_file($val['module']);
            switch ($val['type']) {
                case 'column':
                    //文件目录
                    $path = pathinfo($val['filename']);
                    $html_dir = str_replace($_M['url']['web_site'], PATH_WEB, $path['dirname']);
                    if (!file_exists($html_dir)) {
                        mkdir($html_dir, 0755, true);
                    }

                    $mod_label = load::sys_class('label', 'new')->get($mod);
                    if (!method_exists($mod_label->handle, 'replace_list_page_url')) {
                        break;
                    }

                    $page = 1;
                    while ($page <= $val['count']) {
                        $p = array();
                        $static_url = $mod_label->handle->replace_list_page_url($val['filename'], $page, $val['id'], 3);
                        $filename = urlencode(str_replace($_M['url']['web_site'], '',$static_url));

                        $dynamic_url = $mod_label->handle->replace_list_page_url($val['url'], $page, $val['id'], 1);
                        if(!strstr($dynamic_url,'.php')){
                            // 如果动态链接中没有php后缀，可能是栏目，比如product，在默认文档是index.html优先的配置中，需要加上index.php才能正常生成静态页面，不然请求的是product/index.html无法触发生成
                            $dynamic_url = $dynamic_url.'index.php';
                        }
                        $query = "html_filename={$filename}&metinfonow={$_M['config']['met_member_force']}";
                        
                        if (strstr($dynamic_url, '?')) {
                            $dynamic_url .= "&{$query}";
                        }else{
                            $dynamic_url .= "?{$query}";
                        }
                        $p['url'] = $dynamic_url;
                        $p['filename'] = urldecode($filename);
                        $page++;
                        $pages[] = $p;

                        if ($_M['config']['met_webhtm'] == 3) {//混合模式仅生成第一页
                            break;
                        }
                    }
                    break;
                case 'content':
                    $p = array();
                    $filename = urlencode(str_replace($_M['url']['web_site'], '', $val['filename']));
                    $dynamic_url = $val['url'];
                    if(!strstr($dynamic_url,'.php')){
                        // 如果动态链接中没有php后缀，可能是栏目，比如product，在默认文档是index.html优先的配置中，需要加上index.php才能正常生成静态页面，不然请求的是product/index.html无法触发生成
                        $dynamic_url = $dynamic_url.'index.php';
                    }
                    $query = "html_filename={$filename}&metinfonow={$_M['config']['met_member_force']}";
                    if (strstr($dynamic_url, '?')) {
                        $dynamic_url .= "&{$query}";
                    }else{
                        $dynamic_url .= "?{$query}";
                    }

                    $p['url'] = $dynamic_url;
                    $p['filename'] = urldecode($filename);
                    $pages[] = $p;
                    break;
                case 'tags':
                    //文件目录
                    $path = pathinfo($val['filename']);
                    $html_dir = str_replace($_M['url']['web_site'], PATH_WEB, $path['dirname']);
                    if (!file_exists($html_dir)) {
                        mkdir($html_dir, 0755, true);
                    }

                    $p = array();
                    $filename = urlencode(str_replace($_M['url']['web_site'], '', $val['filename']));
                    $dynamic_url = $val['url'] . "&metinfonow={$_M['config']['met_member_force']}" . "&html_filename={$filename}";

                    $p['url'] = str_replace('.php&', '.php?', $dynamic_url);
                    $p['filename'] = urldecode($filename);
                    $pages[] = $p;
                    break;
            }
        }
        return $pages;
    }

    /**
     * 高效追加页面到数组（避免循环内 array_merge 导致 O(n²) 性能灾难）
     * @param array $pageinfo 引用传递的目标数组
     * @param mixed $newPages 待追加的页面数组（可能为 null）
     */
    private function appendPages(array &$pageinfo, $newPages)
    {
        if (!empty($newPages) && is_array($newPages)) {
            foreach ($newPages as $p) {
                $pageinfo[] = $p;
            }
        }
    }

    /**
     * @param $pageinfo
     * @param string $type
     * @param string $module
     * @param string $list_page
     * @param string $class1
     * @param string $all
     * @param string $content
     * @return array
     */
    public function getPageInfo($pageinfo ,$type ,$module ,$list_page ,$class1 ,$all ,$content)
    {
        global $_M;
        //列表页链接
        $module_list = load::mod_class('column/column_op', 'new')->get_sorting_by_module(false, $_M['mark']);
        foreach ($module_list as $mod => $valm) {
            //生成列表页
            if (($all == 1 || $mod == $module) && in_array($mod, array(1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13))) {
                if (($_M['config']['met_webhtm'] == 2 || $_M['config']['met_webhtm'] == 3 || $_M['config']['met_webhtm'] === '0')
                    && ($type == 'column' || $all == 1 || $list_page == 1)
                    && in_array($mod, array(2, 3, 4, 5, 6, 7, 8))
                ) {
                    //循环栏目获取栏目分页链接
                    $arr_id = array();
                    foreach ($valm['class1'] as $keyc1 => $valc1) {
                        if ($all == 1 || $valc1['id'] == $class1) {
                            $pageinfo[] = $this->getPage($valc1['id'], $valc1['module']);
                            foreach ($valm['class2'] as $keyc2 => $valc2) {
                                if ($valc2['bigclass'] == $valc1['id'] && !in_array($valc2['id'], $arr_id)) {
                                    $arr_id[] = $valc2['id'];
                                    $pageinfo[] = $this->getPage($valc2['id'], $valc2['module']);
                                }
                                foreach ($valm['class3'] as $keyc3 => $valc3) {
                                    if ($valc3['bigclass'] == $valc2['id'] && !in_array($valc3['id'], $arr_id)) {
                                        $arr_id[] = $valc3['id'];
                                        $pageinfo[] = $this->getPage($valc3['id'], $valc3['module']);
                                    }
                                }
                            }
                        }
                    }

                    foreach ($valm['class2'] as $keyc2 => $valc2) {
                        if ($valc2['module'] != 7) continue;
                        $pageinfo[] = $this->getPage($valc2['id'], $valc2['module']);
                    }
                }
            }

            //内容页面
            if ($type == 'content' || $all == 1) {
                //一级栏目
                foreach ($valm['class1'] as $keyc1 => $valc1) {
                    if ($class1 && $class1 != $valc1['id']) {
                        continue;
                    }
                    if (in_array($mod, array(2, 3, 4, 5, 6))) {
                        ##self::delClassHtml($valc1);
                        $this->appendPages($pageinfo, $this->getContentList($valc1['id'], $valc1['module']));
                    } else {
                        if ($class1 == $valc1['id'] || $all == 1) {
                            $this->appendPages($pageinfo, $this->indexPage($valc1));
                            if ($mod == 1) {
                                foreach ($valm['class2'] as $keyc2 => $valc2) {
                                    if ($valc2['bigclass'] == $valc1['id']) {
                                        $this->appendPages($pageinfo, $this->indexPage($valc2));

                                        foreach ($valm['class3'] as $keyc3 => $valc3) {
                                            if ($valc3['bigclass'] == $valc2['id']) {
                                                $this->appendPages($pageinfo, $this->indexPage($valc3));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                //二级栏目内容页面
                foreach ($valm['class2'] as $keyc2 => $valc2) {
                    if (!in_array($valc2['module'], array(1, 9, 11, 12, 13))) continue;

                    if ($valc2['bigclass'] == $class1 || $valc2['id'] == $class1) {
                        $this->appendPages($pageinfo, $this->indexPage($valc2));
                    }
                    if ($valc2['module'] == $module && in_array($valc2['module'], array(9, 11, 12, 13))) {
                        $this->appendPages($pageinfo, $this->indexPage($valc2));
                    }
                }
            }
        }

        //内容管理添加或编辑内容时——(自动更新)
        if ($content) {
            if (in_array($module, array(2, 3, 4, 5, 6))) {
                $res = $this->getContentOne($content, $module);     //重新生单条内容详情
                //$res = $this->getContentList($class1, $module);  //重新生内所有容详情
                $this->appendPages($pageinfo, $res);
            }
        }

        return $pageinfo;
    }

    /**
     * 首页url
     * @return mixed
     */
    public function homePage()
    {
        global $_M;
        $page['url'] = $_M['url']['web_site'] . 'index.php?lang=' . $_M['lang'];
        $page['count'] = 0;
        $page['filename'] = 'index';
        if ($_M['config']['met_index_type'] != $_M['lang']) {
            $page['filename'] .= '_' . $_M['lang'];
        }
        $page['filename'] .= '.' . $_M['config']['met_htmtype'];
        $page['module'] = 0;
        $page['type'] = 'content';
        return $page;
    }

    /**
     * 获取列表列表页url
     * @param string $content
     * @return array|null
     */
    protected function indexPage($content = '')
    {
        if ($content['module'] == 0 || $content['isshow'] == 0) {
            return NULL;
        } else {
            $column_handle = load::mod_class('column/column_handle', 'new');
            $page['url'] = $column_handle->url_full($content, 1);
            $page['count'] = 0;
            $page['filename'] = $column_handle->url_full($content, 3);
            $page['module'] = $content['module'];
            $page['type'] = 'content';
            $re[] = $page;
            return $re;
        }
    }

    /**
     * 列表页URL
     * @param string $id
     * @param string $module
     * @return mixed
     */
    protected function getPage($id = '', $module = '')
    {
        global $_M;
        $mod = $_M['class']['handle']->mod_to_file($module);
        $mod_label = load::sys_class('label', 'new')->get($mod);

        $list = $mod_label->get_page_info_by_class($id, 1);
        $page['id'] = $id;
        $page['url'] = $list['url'];
        $page['count'] = $list['count'];
        $h = $mod_label->get_page_info_by_class($id, 3);
        $page['filename'] = $h['url'];
        $page['module'] = $module;
        $page['type'] = 'column';
        return $page;
    }

    /**
     * 内容URL列表
     * @param string $cid
     * @param string $module
     * @return array
     */
    protected function getContentList($cid = '', $module = '')
    {
        global $_M;
        $mod = $_M['class']['handle']->mod_to_file($module);
        $mod_label = load::sys_class('label', 'new')->get($mod);

        $list = $mod_label->get_module_list($cid);
        foreach ($list as $key => $val) {
            if ($val['links']) {
                continue;
            }
            $page = array();
            $page['url'] = $mod_label->handle->get_content_url($val, 1);
            $page['filename'] = $mod_label->handle->get_content_url($val, 3);
            $page['module'] = $module;
            $page['count'] = 0;
            $page['type'] = 'content';
            $redata[] = $page;
        }
        return $redata;
    }

    protected function getContentOne($aid = '', $module = '')
    {
        global $_M;
        $mod = $_M['class']['handle']->mod_to_file($module);
        $mod_label = load::sys_class('label', 'new')->get($mod);

        $one = $mod_label->get_one_content($aid);
        if ($one['links']) return null;

        $page = array();
        $page['url'] = $mod_label->handle->get_content_url($one, 1);
        $page['filename'] = $mod_label->handle->get_content_url($one, 3);
        $page['module'] = $module;
        $page['count'] = 0;
        $page['type'] = 'content';
        $redata[] = $page;
        return $redata;
    }

    /**
     * 获取静态页生成队列表名（带前缀）
     */
    public function getQueueTable()
    {
        global $_M;
        return $_M['config']['tablepre'] . 'html_queue';
    }

    /**
     * 单独建表方法：判断表是否存在，不存在则创建
     */
    public function createTable()
    {
        global $_M;
        $table = $this->getQueueTable();

        // 判断表是否存在
        $exists = DB::get_one("SHOW TABLES LIKE '{$table}'");
        if ($exists) {
            return true;
        }

        $sql = "CREATE TABLE `{$table}` (
            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
            `batch_id` varchar(32) NOT NULL DEFAULT '' COMMENT '批次号',
            `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言',
            `url` text NOT NULL COMMENT '动态页面URL',
            `filename` varchar(500) NOT NULL DEFAULT '' COMMENT '静态文件相对路径',
            `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0待生成 1生成中 2成功 3失败',
            `retry_count` tinyint(1) NOT NULL DEFAULT '0' COMMENT '重试次数',
            `error_msg` text COMMENT '失败原因',
            `created_at` int(10) unsigned NOT NULL DEFAULT '0',
            `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
            PRIMARY KEY (`id`),
            KEY `idx_batch_status` (`batch_id`,`status`),
            KEY `idx_lang_status` (`lang`,`status`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

        DB::query($sql);
        return true;
    }

    /**
     * 批量插入生成队列
     * 每500条分一批 INSERT，避免单条 SQL 超过 max_allowed_packet
     * 事务包裹，中途失败自动回滚，保证批次数据完整性
     */
    public function insertQueue(array $pages, $batch_id, $lang)
    {
        if (!$pages) return 0;
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return 0;

        // lang 白名单校验：只允许字母、数字、下划线，长度不超过10
        $lang = preg_match('/^[a-zA-Z0-9_]{1,10}$/', $lang) ? $lang : 'cn';

        $table = $this->getQueueTable();
        $time = time();
        $values = array();
        foreach ($pages as $p) {
            $url = daddslashes($p['url']);
            $filename = daddslashes($p['filename']);
            $values[] = "('{$batch_id}', '{$lang}', '{$url}', '{$filename}', " . self::STATUS_PENDING . ", 0, {$time}, {$time})";
        }

        // 事务包裹所有分批插入，保证批次数据完整性
        try {
            DB::query("START TRANSACTION");
            // 分批插入，每批500条
            $chunks = array_chunk($values, 500);
            foreach ($chunks as $chunk) {
                $sql = "INSERT INTO `{$table}` (batch_id, lang, url, filename, status, retry_count, created_at, updated_at) VALUES " . implode(',', $chunk);
                DB::query($sql);
            }
            DB::query("COMMIT");
        } catch (\Exception $e) {
            DB::query("ROLLBACK");
            return 0;
        }

        // 5% 概率清理超过7天的历史数据，避免每次插入都执行 DELETE 导致锁竞争
        if (mt_rand(1, 100) <= 5) {
            $this->cleanOldBatches(7);
        }

        return count($pages);
    }

    /**
     * 清理超过指定天数的历史批次数据（防止表无限增长产生垃圾数据）
     * @param int $days 保留天数，默认7天
     * @return int 删除的记录数
     */
    public function cleanOldBatches($days = 7)
    {
        $table = $this->getQueueTable();
        $days = intval($days);
        if ($days < 1) $days = 7;
        $expire_time = time() - ($days * 86400);
        $sql = "DELETE FROM `{$table}` WHERE `created_at` < {$expire_time}";
        DB::query($sql);
        return DB::affected_rows();
    }

    /**
     * 清理已完成批次的成功记录（失败记录保留用于排查，会被 cleanOldBatches 定期清理）
     * 在 doCheckPage 检测到批次完成时调用
     * @param string $batch_id
     * @return int 删除的记录数
     */
    public function cleanBatchSuccess($batch_id)
    {
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return 0;
        $table = $this->getQueueTable();
        $sql = "DELETE FROM `{$table}` WHERE `batch_id` = '{$batch_id}' AND `status` = " . self::STATUS_SUCCESS;
        DB::query($sql);
        return DB::affected_rows();
    }

    /**
     * 捞出一批待生成记录，并标记为生成中（事务+行锁）
     * 超时回收时间与批次大小联动：$limit * 60秒 + 120秒缓冲
     * 避免批次处理时间超过回收阈值导致正在处理的记录被误杀
     */
    public function pickQueue($batch_id, $limit = 20)
    {
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return array();

        $table = $this->getQueueTable();
        $time = time();
        $limit = intval($limit);
        if ($limit < 1) $limit = 20;

        // 超时回收：阈值 = 每批数量 * 单条最大超时(60s) + 120s 缓冲
        $timeout = $limit * 60 + 120;
        DB::query("UPDATE `{$table}` SET status=" . self::STATUS_PENDING . ", updated_at={$time}
            WHERE batch_id='{$batch_id}' AND status=" . self::STATUS_PROCESSING . " AND updated_at < " . ($time - $timeout));

        // 事务：捞出待生成的，同时标记为生成中
        $rows = array();
        try {
            DB::query("START TRANSACTION");
            $rows = DB::get_all("SELECT * FROM `{$table}`
                WHERE batch_id='{$batch_id}' AND status=" . self::STATUS_PENDING . "
                ORDER BY id ASC LIMIT {$limit} FOR UPDATE");

            if ($rows) {
                $ids = array();
                foreach ($rows as $r) {
                    $ids[] = intval($r['id']);
                }
                DB::query("UPDATE `{$table}` SET status=" . self::STATUS_PROCESSING . ", updated_at={$time}
                    WHERE id IN (" . implode(',', $ids) . ")");
            }
            DB::query("COMMIT");
        } catch (\Exception $e) {
            // 确保回滚，@抑制事务已自动回滚时的报错
            @DB::query("ROLLBACK");
            $rows = array();
        }

        return $rows;
    }

    /**
     * 更新单条队列记录状态
     * 仅更新当前状态为 PROCESSING 的记录，避免超时回收后并发覆盖
     */
    public function updateQueueStatus($id, $status, $error_msg = '')
    {
        $table = $this->getQueueTable();
        $time = time();
        $id = intval($id);
        $status = intval($status);
        $retry_inc = '';
        $error_set = '';
        if ($status == self::STATUS_FAILED) {
            $retry_inc = ', retry_count = retry_count + 1';
            $error_set = ", error_msg='" . daddslashes($error_msg) . "'";
        }
        // 仅更新 PROCESSING 状态的记录，防止超时回收后被其他进程捞出时的状态覆盖
        DB::query("UPDATE `{$table}` SET status={$status}, updated_at={$time}{$retry_inc}{$error_set}
            WHERE id={$id} AND status=" . self::STATUS_PROCESSING);
    }

    /**
     * 获取批次各状态数量
     */
    public function getQueueStats($batch_id)
    {
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return array(0 => 0, 1 => 0, 2 => 0, 3 => 0);

        $table = $this->getQueueTable();
        $rows = DB::get_all("SELECT status, COUNT(*) as num FROM `{$table}`
            WHERE batch_id='{$batch_id}' GROUP BY status");
        $stats = array(0 => 0, 1 => 0, 2 => 0, 3 => 0);
        foreach ($rows as $r) {
            $stats[intval($r['status'])] = intval($r['num']);
        }
        return $stats;
    }

    /**
     * 按状态获取记录列表
     * @param int $limit 最多返回多少条，0=不限制（避免万条全量返回拖垮性能）
     */
    public function getQueueByStatus($batch_id, $status, $limit = 0)
    {
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return array();

        $table = $this->getQueueTable();
        $status = intval($status);
        $limit = intval($limit);
        $limit_sql = $limit > 0 ? " LIMIT {$limit}" : '';
        return DB::get_all("SELECT * FROM `{$table}`
            WHERE batch_id='{$batch_id}' AND status={$status} ORDER BY id ASC{$limit_sql}");
    }

    /**
     * 批次是否完成（没有待生成和生成中的记录）
     */
    public function isBatchFinished($batch_id)
    {
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return true;

        $table = $this->getQueueTable();
        $row = DB::get_one("SELECT COUNT(*) as num FROM `{$table}`
            WHERE batch_id='{$batch_id}' AND status IN (" . self::STATUS_PENDING . "," . self::STATUS_PROCESSING . ")");
        return intval($row['num']) == 0;
    }

    /**
     * 重置失败记录为待生成（重试次数<10，避免永久失败的页面无限重试）
     * 重置时清零 retry_count，每次点击重试都重新计数
     */
    public function resetFailedQueue($batch_id)
    {
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return;

        $table = $this->getQueueTable();
        $time = time();
        DB::query("UPDATE `{$table}` SET status=" . self::STATUS_PENDING . ", retry_count=0, error_msg='', updated_at={$time}
            WHERE batch_id='{$batch_id}' AND status=" . self::STATUS_FAILED . " AND retry_count < 10");
    }

    /**
     * 获取批次总记录数
     */
    public function getBatchTotal($batch_id)
    {
        $batch_id = $this->validateBatchId($batch_id);
        if (!$batch_id) return 0;

        $table = $this->getQueueTable();
        $row = DB::get_one("SELECT COUNT(*) as num FROM `{$table}` WHERE batch_id='{$batch_id}'");
        return $row ? intval($row['num']) : 0;
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
