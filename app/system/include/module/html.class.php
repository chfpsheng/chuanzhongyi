<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_class('web');

class html extends web
{
    public function __construct()
    {
        global $_M;
        parent::__construct();
        $this->html_handle = load::mod_class('html/html_handle', 'new');
    }

    /**
     * 启动定时任务(定时跟新静态页)
     */
    public function doSetval()
    {
        global $_M;
        $sleep = 3600;
        $url = $_M['url']['web_site'] . "app/system/entrance.php?n=html&c=html&a=doSetval&lang={$_M['lang']}";
        //开启静态且自动更新
        if ($_M['config']['met_html_auto'] && $_M['config']['met_webhtm']) {
            self::updatePage();
            sleep($sleep);
            $stream_opts = array(
                "ssl" => array(
                    "verify_peer"=>false,
                    "verify_peer_name"=>false
                )
            );
            file_get_contents($url.'&time='.time(),false, stream_context_create($stream_opts));
        }
        return;
    }

    /**
     * 定时更新
     */
    public function updatePage()
    {
        global $_M;
        $index = $this->html_handle->homePage();    //首页静态文件
        $static_file = PATH_WEB . $index['filename'];
        if (is_file($static_file)) {
            $filemtime = filemtime($static_file);
        }else{
            $filemtime = strtotime("-1 hour");
        }

        switch ($_M['config']['met_html_auto']) {
            case 1://daily
                $offset = 3600 * 24;
                break;
            case 2://weekly
                $offset = 3600 * 24 * 7;
                break;
            case 3://monthly
                $offset = 3600 * 24 * 7 * 30;
                break;
            default:
                return;
                break;
        }
        $expires_in = $filemtime + $offset;

        if ($expires_in > time()){//有效期内
            return;
        };

        $hour = intval(date('H'));
        if (!($hour <= 4)) {//每天4点前更新静态文件
            return;
        }

        $pageinfo = array();
        $pageinfo[] = $this->html_handle->homePage();
        $pageinfo = $this->html_handle->getPageInfo($pageinfo, '', '', '', '', 1, '');
        $pages = $this->html_handle->getQueryList($pageinfo);
        foreach ($pages as $key => $rwo) {
            if (!strstr($rwo['url'], '../')) {
                continue;
            }
            $page['url'] = $_M['url']['web_site'] . str_replace(array('../',"..%2F"),'',$rwo['url']);
            $page['filename'] = str_replace('../','',$rwo['filename']);
            $pages[$key] = $page;
        }

        //静态页列表写入数据库队列
        $this->html_handle->createTable();
        $batch_id = md5(uniqid(mt_rand(), true));
        $this->html_handle->insertQueue($pages, $batch_id, $_M['lang']);

        $loop_url = $_M['url']['web_site'] . "app/system/entrance.php?n=html&c=html&a=doLoop&lang={$_M['lang']}&metinfonow={$_M['config']['met_member_force']}&batch_id={$batch_id}";

        self::request($loop_url);
        return;
    }

    /**
     * @param $url
     * @param array $param
     */
    protected function request($url ,$param = array())
    {
        global $_M;
        $urlinfo = parse_url($url);
        $scheme = $urlinfo['scheme'];
        $host = $urlinfo['host'];
        $path = $urlinfo['path'];
        $query = $urlinfo['query'];
        //$query = isset($param)? http_build_query($param) : '';

        $port = $scheme == 'https' ? 443 : 80;
        $errno = 0;
        $errstr = '';
        $timeout = 10;

        if (!function_exists('fsockopen')) {
            return;
        }
        $fp = fsockopen($host, $port, $errno, $errstr, $timeout);
        $out = "POST ".$path." HTTP/1.1\r\n";
        $out .= "host:".$host."\r\n";
        $out .= "content-length:".strlen($query)."\r\n";
        $out .= "content-type:application/x-www-form-urlencoded\r\n";
        $out .= "connection:close\r\n\r\n";
        $out .= $query;

        fputs($fp, $out);
        fclose($fp);
        return;
    }

    /**
     * 循环生成静态页（数据库队列版）
     */
    public function doLoop()
    {
        global $_M;
        $met_member_force = isset($_M['form']['metinfonow']) ? $_M['form']['metinfonow'] : null;
        $batch_id = isset($_M['form']['batch_id']) ? $_M['form']['batch_id'] : '';

        if (!$met_member_force || $met_member_force !== $_M['config']['met_member_force']) {
            jsoncallback("404");
            return;
        }

        if (!$batch_id) {
            jsoncallback("Finished");
            return;
        }

        $this->html_handle->createTable();

        $table = $this->html_handle->getQueueTable();
        $time = time();
        $batch_id_esc = $this->html_handle->validateBatchId($batch_id);
        if ($batch_id_esc) {
            $row = DB::get_one("SELECT COUNT(*) as num FROM `{$table}`
                WHERE batch_id='{$batch_id_esc}' AND status=" . html_handle::STATUS_PROCESSING . "
                AND updated_at > " . ($time - 120));
            if ($row && intval($row['num']) > 0) {
                jsoncallback("Finished");
                return;
            }
        }

        $sleep = 1;
        $loop_url = $_M['url']['web_site'] . "app/system/entrance.php?n=html&c=html&a=doLoop&metinfonow={$_M['config']['met_member_force']}&lang={$_M['lang']}&batch_id={$batch_id}";

        //开启静态且自动更新
        if ($_M['config']['met_webhtm']) {
            if (self::createPage($batch_id) === true) {
                sleep($sleep);
                //loop
                $stream_opts = array(
                    "ssl" => array(
                        "verify_peer" => false,
                        "verify_peer_name" => false
                    )
                );
                file_get_contents($loop_url . '&time=' . time(), false, stream_context_create($stream_opts));
            }
            //finished
            jsoncallback("Finished");
            return;
        }
        return;
    }

    /**
     * 从数据库队列捞出一批页面并生成（数据库队列版）
     * @param string $batch_id 批次号
     * @return bool true=还有后续，false=队列已空
     */
    public function createPage($batch_id = '')
    {
        global $_M;
        if (!$batch_id) return false;

        // 每批数量，可通过配置 met_html_batch 调整，默认20
        $limit = isset($_M['config']['met_html_batch']) ? intval($_M['config']['met_html_batch']) : 20;
        if ($limit < 1) $limit = 20;

        // 捞出一批待生成记录，并标记为生成中（含超时回收）
        $request_list = $this->html_handle->pickQueue($batch_id, $limit);
        if (!$request_list) return false; // 队列空了

        $urls = array();
        foreach ($request_list as $r) {
            $urls[] = $r['url'];
        }

        // 页面生成请求
        // curl_multi 并发可通过配置 met_html_multi=1 开启（原代码硬编码 &&0 禁用）
        if (function_exists('curl_multi_init') && isset($_M['config']['met_html_multi']) && $_M['config']['met_html_multi']) {
            $res_list = self::curlRequestMulti($urls);
        } else {
            $res_list = self::curlRequest($urls);
        }

        // 回写每条记录的状态到数据库
        foreach ($res_list as $key => $res) {
            $result = json_decode($res, true);
            if ($result && $result['suc'] == 1) {
                //success
                $this->html_handle->updateQueueStatus($request_list[$key]['id'], html_handle::STATUS_SUCCESS);
            } else {
                //error && curlError
                $error_msg = is_string($res) ? trim(substr($res, 0, 500)) : '';
                if (!$error_msg) {
                    $error_msg = '生成失败，返回内容为空 url:' . $request_list[$key]['url'];
                }
                $this->html_handle->updateQueueStatus($request_list[$key]['id'], html_handle::STATUS_FAILED, $error_msg);
            }
        }

        return true;
    }

    /**
     * 单线程 curl 请求（增强版：连接超时、IPv4强制、重试、UA、跟随重定向）
     * @param array $urls
     * @return array
     */
    protected function curlRequest($urls = array())
    {
        $redata = array();
        foreach ($urls as $key => $url) {
            $redata[$key] = $this->curlRequestOne($url, 2);
        }
        return $redata;
    }

    /**
     * 单个 URL 的 curl 请求（含重试）
     * @param string $url
     * @param int $retry 重试次数
     * @return string
     */
    private function curlRequestOne($url, $retry = 2)
    {
        global $_M;
        $result = false;
        $error_msg = '';

        for ($i = 0; $i <= $retry; $i++) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POSTFIELDS, array());
            curl_setopt($ch, CURLOPT_TIMEOUT, 60);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
            curl_setopt($ch, CURLOPT_MAXREDIRS, 3);
            curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MetInfo StaticGenerator/8.1; +https://www.metinfo.cn)');
            if (defined('CURL_IPRESOLVE_V4')) {
                curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
            }
            // 禁用 Nagle 算法，加快小请求连接
            if (defined('CURLOPT_TCP_NODELAY')) {
                curl_setopt($ch, CURLOPT_TCP_NODELAY, 1);
            }

            $result = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

            if (curl_error($ch)) {
                $errno = curl_errno($ch);
                $error_msg = "curl_error:" . curl_error($ch) . " curl_errno:" . $errno . " url:" . $url;
                curl_close($ch);
                // 连接类错误（7/28/52/56）才重试，其他错误直接返回
                if (!in_array($errno, array(7, 28, 52, 56))) {
                    return $error_msg;
                }
                if ($i < $retry) {
                    usleep(500000); // 重试前等待 0.5 秒
                    continue;
                }
                return $error_msg;
            }
            curl_close($ch);

            // 成功但返回空，重试一次；记录HTTP状态码和URL，避免失败原因空白
            if ($result === '' || $result === false) {
                $error_msg = "curl返回空内容 http_code:" . intval($http_code) . " url:" . $url;
                if ($i < $retry) {
                    usleep(300000);
                    continue;
                }
            }
            break;
        }

        return ($result !== false && $result !== '') ? $result : $error_msg;
    }

    /**
     * multi request（增强版：连接超时、IPv4强制、UA、跟随重定向）
     * @param array $urls
     * @return array|bool
     */
    protected function curlRequestMulti($urls = array())
    {
        global $_M;
        if (!$urls) {
            return false;
        }

        $mh = curl_multi_init();
        $conn = array();
        foreach ($urls as $i => $url) {
            $conn[$i] = curl_init($url);
            curl_setopt($conn[$i], CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($conn[$i], CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($conn[$i], CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($conn[$i], CURLOPT_HEADER, 0);
            curl_setopt($conn[$i], CURLOPT_TIMEOUT, 60);
            curl_setopt($conn[$i], CURLOPT_CONNECTTIMEOUT, 10);
            curl_setopt($conn[$i], CURLOPT_FOLLOWLOCATION, 1);
            curl_setopt($conn[$i], CURLOPT_MAXREDIRS, 3);
            curl_setopt($conn[$i], CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MetInfo StaticGenerator/8.1; +https://www.metinfo.cn)');
            if (defined('CURL_IPRESOLVE_V4')) {
                curl_setopt($conn[$i], CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
            }
            if (defined('CURLOPT_TCP_NODELAY')) {
                curl_setopt($conn[$i], CURLOPT_TCP_NODELAY, 1);
            }
            curl_multi_add_handle($mh, $conn[$i]);
        }

        $active = null;
        do {
            $mrc = curl_multi_exec($mh, $active);
        } while ($mrc === CURLM_CALL_MULTI_PERFORM);

        while ($active && $mrc == CURLM_OK) {
            if (curl_multi_select($mh, 5) != -1) {
                do {
                    $mrc = curl_multi_exec($mh, $active);
                } while ($mrc == CURLM_CALL_MULTI_PERFORM);
            }
        }

        //获取当前传输的有关信息(该步骤不可省略，否则无法获取curl报错信息)
        while (curl_multi_info_read($mh)) {
        }

        $res = array();
        foreach ($conn as $i=>$ch) {
            if (curl_errno($ch)) {
                //获取curl报错信息（包含URL便于排查）
                $error_msg = "curl_error:" . curl_error($ch) . " curl_errno:" . curl_errno($ch) . " url:" . curl_getinfo($ch, CURLINFO_EFFECTIVE_URL);
                $res[$i] = $error_msg;
            }else{
                //获取某个curl句柄的返回值
                $res[$i] = curl_multi_getcontent($ch);
            }
            //移除批处理句柄中的某个句柄资源
            curl_multi_remove_handle($mh, $ch);
            curl_close($ch);
        }
        curl_multi_close($mh);
        return $res;
    }

    // 在file_get_contents请求失败时使用curl
    public function curlLoop($url = '')
	{
			$ch = curl_init();
            curl_setopt($ch, CURLOPT_POST, 0);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_URL, $url);
            //curl_setopt($ch, CURLOPT_POSTFIELDS, array());
            curl_setopt($ch, CURLOPT_TIMEOUT, 60);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
            $result = curl_exec($ch);
			
			return $result;
	}
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
