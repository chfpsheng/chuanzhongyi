<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$html_class=$body_class='h-100';
$html_class.=' met-login';
$body_class.=' d-flex flex-column pb-3 pt-4 px-3';
$met_title=$word['logintitle'].'-'.$word['metinfo'];
$login_logo_filemtime=filemtime(str_replace($url['site'], PATH_WEB, $data['met_agents_logo_login']));
$metinfo_css_filemtime = filemtime(PATH_PUBLIC_ADMIN.'css/metinfo.css');
$favicon_filemtime = filemtime(PATH_WEB."favicon.ico");
$synchronous=$_M['langlist']['admin'][$_M['langset']]['synchronous'];
// dump($data);
?>
<!DOCTYPE HTML>
<html class="<?php echo $html_class;?>">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="robots" content="noindex,nofollow">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0,minimal-ui">
<meta name="format-detection" content="telephone=no">
<title><?php echo $met_title;?></title>
<meta name="generator" content="MetInfo V<?php echo $c['metcms_v'];?>" data-variable="<?php echo $url['site'];?>|<?php echo $_M['lang'];?>|<?php echo $synchronous;?>|<?php echo $c['met_skin_user'];?>||||">
<link href="<?php echo $url['site'];?>favicon.ico?<?php echo $favicon_filemtime;?>" rel="shortcut icon" type="image/x-icon">
<link href="<?php echo $url['public_third'];?>bootstrap/bootstrap-v4.3.1.min.css" rel='stylesheet' type='text/css'>
<link href="<?php echo $url['public_admin'];?>css/metinfo.css?<?php echo $metinfo_css_filemtime;?>" rel='stylesheet' type='text/css'>
<style>
      <?php if($data['qrcode']){ ?>
    .btn-change-login-method{right: -15px;top: -30px;}
    <?php } ?>
    body{background: url('<?php echo $url['own_tem'];?>images/login-bg.jpg') center/cover no-repeat;}
    .met-ie-tips a{color: #fff;}
    .login-card-wrapper{width: 800px;}
    .login-card{box-shadow: 0px 4px 14px 0px rgba(0,0,0,0.05);border-color: #fff !important;}
    .login-card .form-control:focus{border-color: #000;}
    .login-card input.form-control,
    .login-card textarea.form-control{
        padding-top: 12px;padding-bottom: 12px;
    }
    .login-card .btn{border-radius: 5px;}
    .login-card .btn-primary{background: linear-gradient( 90deg, #009DD8 0%, #00CFCF 100%) !important;padding-top: 10px;padding-bottom: 10px;}
</style>
</head>
<body class="<?php echo $body_class;?>">
<div class="media-body d-flex flex-column justify-content-center align-items-center mb-5">
    <div class="mw-100 login-card-wrapper position-relative">
        <div class="text-center mb-0 bg-danger alert hide mb-3 met-ie-tips">
            <button type="button" class="close" data-dismiss="alert">
                <span aria-hidden="true">×</span>
            </button>
            你正在使用一个 <strong>过时</strong> 的浏览器。请 <a href='https://browsehappy.com/' target=_blank>升级您的浏览器</a>，以提高您的体验。
        </div>
        <div class="login-card rounded-20 bg-white border cover d-flex">
            <div class="d-flex align-items-center justify-content-center" style="width: 300px;background: linear-gradient( 155deg, #CDEAFF 1%, #EFFFFF 100%);">
                <a href="<?php echo $data['met_agents_linkurl'];?>" title="<?php echo $word['metinfo'];?>" target="_blank">
                    <img src="<?php echo $data['met_agents_logo_login'];?>?<?php echo $login_logo_filemtime;?>" alt="<?php echo $word['metinfo'];?>" style="max-width: 200px;max-height: 200px;">
                </a>
            </div>
            <div class="py-4 py-md-5 px-3 px-sm-4 px-md-5 media-body">
                <div class="px-3">
                    <h1 class="h4 mb-4 pb-3 text-center font-weight-bold"><?php echo $word['loginadmin'];?></h1>
                      <?php if($data['qrcode']){ ?>
                        <view class="row d-flex justify-content-end mb-4 btn-change-login-method">
                            <a href="javascript:;" data-method="weixin" class="item d-flex align-items-center">
                            微信扫码登录<i class="fa-qrcode h4 my-0 ml-2"></i>
                            </a>
                            <a href="javascript:;" data-method="username" class="item d-flex align-items-center hide" role="button">
                            账号密码登录<i class="fa-desktop h4 my-0 ml-2"></i>
                            </a>
                        </view>
                    <?php } ?>
                    <form action="<?php echo $url['own_form'];?>a=dologin" class="met-login-form login-method" data-method="username" data-submit-ajax="1">
                        <input type="hidden" name="referrer" value="<?php echo $data['referrer'];?>">
                          <?php if($c['met_admin_type_ok']){ ?>
                            <div class="">
                                <div class="col-form-label pt-0 h6 my-0"><?php echo $word['loginlanguage'];?></div>
                                <div class="form-group mb-4">
                                    <select name="langset" data-checked="<?php echo $data['langset'];?>" class="form-control border-none bg-grey-100 rounded-10 h-auto" onchange="javascript:location.href=M.url.admin+'?langset='+this.value">
                                                <?php
            $sub = is_array($data['met_langadmin']) ? count($data['met_langadmin']) : 0;
            $cycleindex = 50;

            if(!is_array($data['met_langadmin']) && $data['met_langadmin']){
                $data['met_langadmin'] = explode('|',$data['met_langadmin']);
            }

            foreach ($data['met_langadmin'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $v = $val;
            ?>
                                            <option value="<?php echo $v['mark'];?>"><?php echo $v['name'];?></option>
                                        <?php }?>
                                    </select>
                                </div>
                            </div>
                        <?php } ?>
                        <div class="">
                            <div class="col-form-label pt-0 h6 my-0"><?php echo $word['loginusename'];?></div>
                            <div class="form-group mb-4">
                                <input type="text" name="login_name" data-safety required class="form-control border-none bg-grey-100 rounded-10 h-auto">
                            </div>
                        </div>
                        <div class="">
                            <div class="col-form-label pt-0 h6 my-0"><?php echo $word['loginpassword'];?></div>
                            <div class="form-group mb-4">
                                <input type="password" name="login_pass" data-safety required class="form-control border-none bg-grey-100 rounded-10 h-auto">
                            </div>
                        </div>
                        <!--图形验证码-->
                        <div class="form-group captcha   <?php if(!$data['captcha']){ ?>hide<?php } ?>">
                            <div class="col-form-label pt-0 h6 my-0"><?php echo $word['logincode'];?></div>
                            <div class="d-flex">
                                <input name='code' type='text' class='form-control border-none bg-grey-100 rounded-10 h-auto media-body mr-2' placeholder='<?php echo $word['logincode'];?>' required>
                                <div>
                                    <img   <?php if($data['captcha']){ ?>src<?php }else{ ?>data-src<?php } ?>='<?php echo $url['entrance'];?>?m=include&c=ajax_pin&a=dogetpin&random=<?php echo $data['random'];?>' title="<?php echo $word['memberTip1'];?>" align='absmiddle' role='button' width="150" class="h-100 rounded-10   <?php if($data['captcha']){ ?>met-getcode<?php } ?>">
                                    <input type="hidden" name="random" value="<?php echo $data['random'];?>">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary px-4 btn-block btn-lg h6 mt-5 border-none"><?php echo $word['loginconfirm'];?></button>
                        <div class="mt-4 text-center">
                            <a href="<?php echo $url['get_pass'];?>" class="text-content"><?php echo $word['loginforget'];?></a>
                        </div>
                    </form>
                      <?php if($data['qrcode']){ ?>
                    <div class="qrcode-wrapper hide text-center login-method" data-method="weixin" data-login_code="<?php echo $data['login_code'];?>">
                        <view>
                            <p class="h4 mt-0 mb-3">微信扫码登录</p>
                            <img src="<?php echo $data['qrcode'];?>" width="200" class="border">
                            <div class="mt-2 text-grey">打开微信，扫一扫登录</div>
                        </view>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="metadmin-foot text-grey text-center"><?php echo $data['copyright'];?></footer>
<?php
$basic_js_time = filemtime(PATH_PUBLIC_THIRD.'admin/basic.js');
$metinfo_js_time = filemtime(PATH_PUBLIC_ADMIN.'js/metinfo.js');
$lang_json_admin_js_time = filemtime(PATH_WEB.'cache/lang_json_admin_'.$_M['lang'].'.js');
?>
</body>
<script>window.MET=<?php echo $data['met_para'];?>;</script>
<script src="<?php echo $url['public_third'];?>admin/basic.js?<?php echo $basic_js_time;?>"></script>
<script src="<?php echo $url['public_admin'];?>js/metinfo.js?<?php echo $metinfo_js_time;?>"></script>
<script src="<?php echo $url['site'];?>cache/lang_json_admin_<?php echo $_M['langset'];?>.js?<?php echo $lang_json_admin_js_time;?>"></script>
  <?php if($data['qrcode']){ ?>
<?php $login_js_time = filemtime(PATH_SYS.'login/admin/templates/js/login.js'); ?>
<script src="<?php echo $url['own_tem'];?>js/login.js?<?php echo $login_js_time;?>"></script>
<?php } ?>
<script>(function(){M.is_ie&&$('.met-ie-tips').removeClass('hide');})();</script>
<!--插件代码-->
<?php echo $_M['html_plugin']['foot_script_admin'];?>
</html>