<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

/**
 * 微信推送相应
 * Class reply
 */
class weixinreply
{
    public $error;
    public $openid;
    public function __construct()
    {
        global $_M;
        $this->error = array();
        $weixinapi = load::mod_class('weixin/weixinapi','new');
    }

    /**
     * 微信推送日志
     *
     * @param array $data 微信推送报文解析后的数组
     * @return void
     */
    public function replyLog($data)
    {
        global $_M;

        $table = $_M['table']['weixin_reply_log'];
        $fromUserName = isset($data['FromUserName']) ? (string)$data['FromUserName'] : '';
        $createTime   = isset($data['CreateTime']) ? intval($data['CreateTime']) : 0;
        $content      = json_encode($data, JSON_UNESCAPED_UNICODE);
        if (!is_string($content)) {
            $content = '';
        }

        if (isset(DB::$link) && DB::$link instanceof mysqli) {
            $query = "INSERT INTO {$table} SET FromUserName = ?, Content = ?, CreateTime = ?";
            $stmt  = false;
            try {
                $stmt = DB::$link->prepare($query);
            } catch (Exception $e) {
                $stmt = false;
            }
            if ($stmt) {
                $stmt->bind_param('ssi', $fromUserName, $content, $createTime);
                $stmt->execute();
                $stmt->close();

                return;
            }
        }

        $safeFromUserName = str_replace(array('\\', "'"), array('\\\\', "''"), $fromUserName);
        $safeContent      = str_replace(array('\\', "'"), array('\\\\', "''"), $content);
        $query = "INSERT INTO {$table} SET FromUserName = '{$safeFromUserName}', Content = '{$safeContent}', CreateTime = {$createTime}";
        DB::query($query);
    }

    /**
     * 获取回复的内容
     * @param  string $postStr 接收到的内容
     * @return string  回复内容
     */
    public function getContent($postStr)
    {
        global $_M;
        // libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        $data = daddslashes($data);

        $this->openid = $data['FromUserName'];
        $this->replyLog($data);
        switch ($data['MsgType']) {
            case 'event':
                switch ($data['Event']) {
                    case 'subscribe'://订阅
                        if ($data['EventKey']) {
                            $data['EventKey'] = strReplace('qrscene_', '', $data['EventKey']);
                            return $this->scna($data);
                        }else{
                            return $this->Reply($data, strtolower($data['Event']));
                        }
                        break;
                    case 'unsubscribe'://取消订阅
                        return $this->replyLog($data);
                        break;
                    case 'SCAN'://用户已关注时的事件推送
                        return $this->scna($data);
                        break;
                    case 'LOCATION'://上报地理位置事件
                        return $this->replyLog($data);
                        break;
                    case 'CLICK'://点击菜单拉取消息时的事件推送
                        return $this->Reply($data, 'click');
                        break;
                    case 'VIEW'://点击菜单跳转链接时的事件推送
                        return $this->replyLog($data);
                        break;
                    default:
                        return $this->Reply($data);
                        break;
                }
                break;
            case 'text':
                return $this->Reply($data, strtolower($data['MsgType']));
                break;
            case 'image':
                return $this->Reply($data, strtolower($data['MsgType']));
                break;
            default:
                return $this->Reply($data);
                break;
        }
    }


    /**
     * 扫码事件
     * @param array $data
     */
    public function scna($data = array())
    {
        $EventKey = explode('&', $data['EventKey']);
        $action = $EventKey[0];
        $code = $EventKey[1];
        switch ($action) {
            case 'login':
                $this->wxLogin($data, $code);
                break;
            case 'bind':
                $this->wxBind($data, $code);
                break;
            case 'adminbind':
                $this->wxAdminBind($data, $code);
                break;
             case 'adminlogin':
                $this->wxAdminLogin($data, $code);
                break;
            default:
                load::plugin('doweixinscna', 0, array('data' => $data['EventKey']));  //加载微信扫码回调逻辑
                break;
        }
        return;
    }

    /**
     * 微信登录
     * @param array $data
     */
    public function wxLogin($data = array(),$code = '')
    {
        global $_M;
        $weixinapi = load::mod_class('weixin/weixinapi','new');
        $wx_user = $weixinapi->getwxUser($data['FromUserName']);    //获取用户信息
        if (!$wx_user) {
            $this->error[] = '微信用户信息获取失败';
            return false;
        }

        $weixin_party = load::mod_class('user/web/class/weixin_party', 'new');
        $weixin_party->WXlogin($wx_user, $code);
        return;
    }
    /**
     *
     * @param array  $data 微信推送报文解析后的数组
     * @param string $code 扫码 EventKey 拆分出的登录码
     * @return void
     */
    public function wxAdminLogin($data = array(), $code = '')
    {
        global $_M;

        if (!is_string($code) || $code === '' || !preg_match('/^[A-Za-z0-9_]+$/', $code)) {
            return;
        }

        $login_code = cache::get("weixin/" . $code, 'txt');

        if (!is_string($login_code) || $login_code === '') {
            return;
        }

        $openid = isset($data['FromUserName']) ? (string)$data['FromUserName'] : '';
        $openid = preg_replace('/[\\{\\}\\$"]/', '', $openid);
        if ($openid === null) {
            $openid = '';
        }
        $openid = str_replace('\\', '', $openid);

        cache::put("weixin/" . $login_code, $openid, 'txt');
        return;
    }
    /**
     * 用户账号绑定微信
     * @param array $data
     */
    public function wxBind($data = array(),$code = '')
    {
        global $_M;
        $weixinapi = load::mod_class('weixin/weixinapi','new');
        $wx_user = $weixinapi->getwxUser($data['FromUserName']);    //获取用户信息
        if (!$wx_user) {
            $this->error[] = '微信用户信息获取失败';
            return false;
        }

        $weixin_party = load::mod_class('user/web/class/weixin_party', 'new');
        $weixin_party->confirmWxbind($code, $wx_user);
        return;
    }
    /**
     *
     * @param array  $data 微信推送报文解析后的数组
     * @param string $code 扫码 EventKey 拆分出的绑定码
     * @return void
     */
    public function wxAdminBind($data = array(),$code = '')
    {
        global $_M;
        $weixinapi = load::mod_class('weixin/weixinapi','new');

        if (!is_string($code) || $code === '' || !preg_match('/^[A-Za-z0-9_]+$/', $code)) {
            return;
        }

        $uid = cache::get("weixin/".$code,'txt');
        if ($uid) {
            // 绑定微信
            $openid = isset($data['FromUserName']) ? (string)$data['FromUserName'] : '';
            $uid = intval($uid);

            $table = $_M['table']['admin_table'];

            if (isset(DB::$link) && DB::$link instanceof mysqli) {
                $query = "UPDATE {$table} SET openid = ? WHERE id = ?";
                $stmt = false;
                try {
                    $stmt = DB::$link->prepare($query);
                } catch (Exception $e) {
                    $stmt = false;
                }
                if ($stmt) {
                    $stmt->bind_param('si', $openid, $uid);
                    $stmt->execute();
                    $stmt->close();
                    return;
                }
            }

            $safeOpenid = str_replace(array('\\', "'"), array('\\\\', "''"), $openid);
            $safeUid = intval($uid);
            $query = "UPDATE {$table} SET openid = '{$safeOpenid}' WHERE id = {$safeUid}";
            DB::query($query);
        }
        return;
    }
    /*******************************/
    /**
     * 事件回复
     * @param array $data
     * @param string $type
     */
    public function Reply($data = array(), $type = '')
    {
        $weixin_app = load::app_class('met_weixin/include/class/reply','new');

        $weixin_app->Reply($data, $type);
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
