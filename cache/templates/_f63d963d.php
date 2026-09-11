<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$html_class=$body_class='h-100';
$html_class.=' met-pageset';
$body_class.=' d-flex flex-column';
$pageset_css_filemtime = filemtime(PATH_OWN_FILE.'templates/css/pageset.css');
$pageset_js_filemtime = filemtime(PATH_OWN_FILE.'templates/js/pageset.js');
$met_title=$word['veditor'].'-'.$c['met_webname'];
$headnav_ml=$_M['langset']=='cn'?'':'en-headnav-padiing';
// $c['met_uiset_guide']=1;
?>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$metinfo_css_filemtime = filemtime(PATH_PUBLIC_ADMIN.'css/metinfo.css');
$met_title.=($met_title?'-':'').$word['metinfo'];
$synchronous=$_M['langlist']['admin'][$_M['langset']]['synchronous'];
$favicon_filemtime = filemtime(PATH_WEB."favicon.ico");
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
</head>
<!--['if lte IE 9']>
<div class="text-center mb-0 bg-danger alert">
    <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    <?php echo $word['browserupdatetips'];?>
</div>
<!['endif']-->
<body class="<?php echo $body_class;?>">
<link rel="stylesheet" href="<?php echo $url['public_fonts'];?>metinfo-specail-icon/metinfo-specail-icon.css">
<link rel="stylesheet" href="<?php echo $url['own_tem'];?>css/pageset.css?<?php echo $pageset_css_filemtime;?>">
<!-- 顶部导航 -->
<header class='pageset-head bg-dark' style="height: 50px;">
	<div class="container-fluid h-100 position-relative">
		  <?php if($c['met_agents_pageset_logo']==1 || !isset($c['met_agents_pageset_logo'])){ ?>
		<div class='float-left d-none d-lg-flex align-items-center h-100'>
			<a href="<?php echo $c['met_agents_linkurl'];?>" title="<?php echo $word['metinfo'];?>" target='_blank' class='text-white pageset-logo'><i class="icon metinfo-specail-icon metinfo-specail-icon-logobd font-size-18"></i> <span><?php echo $word['loginmetinfo'];?></span></a>
		</div>
		<?php } ?>
		  <?php if(is_mobile()){ ?>
		<button class="btn btn-outline-light py-1 btn-sm btn-block mt-2 btn-pageset-mobile-menu"><?php echo $word['top_menu'];?></button>
		<?php } ?>
		  <?php if(is_mobile()){ ?><div class="pageset-mobile-menu position-absolute bg-dark py-2"><?php } ?>
		<div class="container h-100 pageset-head-nav">
			<div class="row h-100 navbar p-0">
				<div>
	            	<a href class="btn btn-outline-light py-1 border-none pageset-view" title="<?php echo $word['uisetTips4'];?>" target='_blank'><?php echo $word['preview'];?></a>
                    <a href='javascript:;' class="btn btn-outline-light py-1 border-none <?php echo $headnav_ml;?> pageset-other-config" data-config-url='<?php echo $url['own_form'];?>a=doget_page_config' data-form_action="doset_page_config" title="<?php echo $word['uisetTips5'];?>"><?php echo $word['uisetTips6'];?></a>
				</div>
				<div class="float-right">
					<div class="btn-group <?php echo $headnav_ml;?>">
						<button class="btn btn-outline-light py-1 border-none dropdown-toggle" type="button" data-toggle="dropdown"><?php echo $word['indexbbs'];?></button>
						<ul class="dropdown-menu dropdown-menu-right mt-2">
							  <?php if($c['met_agents_metmsg']){ ?>
							<a href="<?php echo $c['help_url'];?>" class='dropdown-item px-3' target='_blank'><?php echo $word['help_manual'];?></a>
							<a href="<?php echo $c['edu_url'];?>" class='dropdown-item px-3' target='_blank'><?php echo $word['extension_school'];?></a>
							<a href="<?php echo $c['kf_url'];?>" class='dropdown-item px-3' target='_blank'><?php echo $word['online_work_order'];?></a>
							<?php } ?>
							<a href="javascript:;" class='dropdown-item px-3' data-toggle="modal" data-target=".syslicense-modal" data-modal-url="ui_set/license/?n=system&c=license&a=doLicenseList" data-modal-title="许可协议">许可协议</a>
							  <?php if($c['met_agents_metmsg']){ ?>
							<a href="javascript:;" class='dropdown-item px-3' data-toggle="modal" data-target=".uiset-guide-modal" data-modal-title="操作引导">操作引导</a>
							<?php } ?>
                        </ul>
					</div>
					</if>
					<a href='<?php echo $url['site_admin'];?>' class="btn btn-outline-light py-1 border-none <?php echo $headnav_ml;?>" target='_blank'><?php echo $word['oldBackstage'];?></a>
					<?php $lang_name = $_M['langlist']['web'][$_M['lang']]['name']; ?>
					<div class="btn-group <?php echo $headnav_ml;?>">
		                <button class="btn btn-outline-light py-1 border-none dropdown-toggle" type="button" data-toggle="dropdown"><?php echo $lang_name;?></button>
		                <ul class="dropdown-menu dropdown-menu-right mt-2 metadmin-head-langlist">
		                	        <?php
            $sub = is_array($_M['user']['langok']) ? count($_M['user']['langok']) : 0;
            $cycleindex = 50;

            if(!is_array($_M['user']['langok']) && $_M['user']['langok']){
                $_M['user']['langok'] = explode('|',$_M['user']['langok']);
            }

            foreach ($_M['user']['langok'] as $index => $val) {
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
		                        <a href="javascript:;" data-val='<?php echo $v['mark'];?>' class='dropdown-item px-3'><?php echo $v['name'];?></a>
		                    <?php }?>
	                        <li class="px-3 py-1"><a href="javascript:;" class="btn btn-outline-666" data-toggle="modal" data-target=".pageset-nav-modal" data-url="language"><i class="fa fa-plus"></i> <?php echo $word['added'];?><?php echo $word['langweb'];?></a></li>
		                </ul>
		            </div>
					  <?php if($c['met_agents_metmsg']){ ?>
					<a href='javascript:;' class="btn btn-outline-light py-1 border-none position-relative <?php echo $headnav_ml;?>" data-toggle="modal" data-target=".pageset-nav-modal" data-url='system/news' title="<?php echo $word['sysMessage'];?>">
						<i class="fa fa-bell-o"></i>
						<span class="sys-news-count position-absolute"></span>
					</a>
					<?php } ?>
					<div class="btn-group <?php echo $headnav_ml;?>">
						<button type="button" class="btn btn-outline-light py-1 border-none dropdown-toggle pageset-head-user" data-toggle="dropdown"><span class='text-truncate d-inline-block position-relative' style="max-width: 100px;top: 3px;"><?php echo $data['admin_member']['admin_id'];?></span></button>
						<ul class="dropdown-menu dropdown-menu-right mt-2">
							<a href='javascript:;' class='dropdown-item px-3' data-toggle="modal" data-target=".pageset-nav-modal" data-url="admin/admin_sys/?n=admin&c=index&a=doInfo" title="<?php echo $word['indexadminname'];?>"><?php echo $word['modify_information'];?></a>
							<a href="<?php echo $url['site_admin'];?>?n=login&c=login&a=dologinout" class='dropdown-item px-3'><?php echo $word['indexloginout'];?></a>
						</ul>
					</div>
				</div>
			</div>
			  <?php if($c['met_agents_metmsg']){ ?>
			<div class='position-absolute d-flex align-items-center h-100' style="right:15px;top:0;">
				<a href="javascript:;" data-toggle="modal" data-target=".pageset-nav-modal" data-url="ui_set/package" title="授权信息"><i class="fa-flag-o mr-1"></i><span>版本信息</span></a>
			</div>
			<?php } ?>
		</div>
		  <?php if(is_mobile()){ ?></div><?php } ?>
	</div>
</header>
<!-- 后台文件夹安全提示 -->
  <?php if(!$data['admin_folder_safe']){ ?>
<div class="text-center mb-0 bg-grey alert pageset-tips">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    <p><?php echo $word['help2'];?>：<span class='text-danger'><?php echo $word['tips8_v6'];?>！</span></p>
    <div>
        <button type='button' class="btn btn-default no-prompt" data-url="<?php echo $url['site_admin'];?>?n=index&c=index&a=doNoPrompt" data-dismiss="alert"><?php echo $word['nohint'];?></button>
        <button type='button' data-url="safe" class="btn btn-primary ml-5 btn-adminfolder-change" title="<?php echo $word['safety_efficiency'];?>" data-toggle="modal" data-target=".pageset-nav-modal" data-dismiss="alert"><?php echo $word['tochange'];?></button>
    </div>
</div>
<?php } ?>
<!-- 可视化窗口 -->
<iframe src="<?php echo $data['pageset_iframe_src'];?>" class='page-iframe flex-fill' frameborder="0" width="100%"></iframe>
<button type="button" data-toggle="modal" class="btn-pageset-common-modal" hidden></button>
<button type="button" class="btn-pageset-common-page" hidden></button>
<!-- 可视化窗口中部分情况右键菜单 -->
<menu class="met-menu position-fixed m-0 pl-0 border bg-light shadow rounded">
    <li class="menu-item d-block">
        <button type="button" class="btn btn-light text-left menu-btn obj-remove">
        	<small class="d-block">
	            <i class="icon wb-eye-close mr-1"></i>
	            <span class="menu-text"><?php echo $word['uisetTips8'];?></span>
            </small>
        </button>
    </li>
</menu>
<!-- 引导图 -->
  <?php if(!is_mobile()){ ?>
<div class="modal fade met-scrollbar met-modal uiset-guide-modal p-0 mb-0 border-none rounded-0 bg-white h-100 cover" data-keyboard="false" data-backdrop="false" data-visible="<?php echo $c['met_uiset_guide'];?>" data-url="<?php echo $url['own_form'];?>a=dono_uisetguide">
	<div class="modal-dialog modal-xl w-100 my-0">
		<div class="modal-content border-none">
			<div class="modal-body p-0">
				<div class="uiset-guide-content position-relative">
					<img data-src="<?php echo $url['own_tem'];?>images/guide-bg.jpg" class="img-fluid">
					<div class="uiset-guide-process position-absolute w-100 h-100">
						<div class="item position-absolute" style="left: 50%;top: 50%;transform: translate(-50%,-50%);">
							<div class="uiset-guide-box bg-white p-4">
								<button type="button" class="close" aria-label="Close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
								<div class="p-3">
									<div class="text-center">
										<img data-src="<?php echo $url['own_tem'];?>images/guide-first.png" style="margin:-130px 0 20px;">
									</div>
									<div class="uiset-guide-body h6 mb-0">
										<p>你好 <span class="text-primary"><?php echo $data['admin_member']['admin_id'];?></span>：</p>
										<p>我们邀请你参与新手提示，五步上手米拓企业建站系统</p>
									</div>
									<div class="uiset-guide-footer text-center" style="margin:20px 0 -67px;">
										<button class="btn btn-primary px-5 py-3 btn-next">进入新手提示</button>
									</div>
								</div>
							</div>
						</div>
						<div class="item hide">
							<img data-src="<?php echo $url['own_tem'];?>images/guide-logo.png" class="position-absolute" style="left:65px;top:65px;">
							<img data-src="<?php echo $url['own_tem'];?>images/guide-arrow2.png" class="position-absolute" style="left:130px;top:100px;">
							<div class="uiset-guide-box bg-white p-4 position-absolute" style="left:300px;top:250px;">
								<button type="button" class="close" aria-label="Close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
								<div class="uiset-guide-header">
									<h5 class="d-inline-block mb-0">新手提示</h5>
								</div>
								<hr class="my-2">
								<div class="uiset-guide-body text-secondary text-nowrap">
									鼠标移至图片上，点击“编辑”图标可替换原有图片哦！
								</div>
								<div class="uiset-guide-footer text-right mt-4">
									<button class="btn btn-outline-primary btn-look-demo mr-1" data-toggle="modal" data-target=".uiset-guide-demo-modal">查看演示</button>
									<button class="btn btn-primary btn-prev mr-1">上一步</button>
									<button class="btn btn-primary btn-next">下一步(1/5)</button>
								</div>
							</div>
						</div>
						<div class="item hide">
							<img data-src="<?php echo $url['own_tem'];?>images/guide-home.png" class="position-absolute" style="left:350px;top:50px;">
							<img data-src="<?php echo $url['own_tem'];?>images/guide-arrow2.png" class="position-absolute" style="left:355px;top:115px;">
							<div class="uiset-guide-box bg-white p-4 position-absolute" style="left:520px;top:280px;">
								<button type="button" class="close" aria-label="Close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
								<div class="uiset-guide-header">
									<h5 class="d-inline-block mb-0">新手提示</h5>
								</div>
								<hr class="my-2">
								<div class="uiset-guide-body text-secondary text-nowrap">
								鼠标移至文字上，点击“编辑”图标可修改文字哦！
								</div>
								<div class="uiset-guide-footer text-right mt-4">
									<button class="btn btn-outline-primary btn-look-demo mr-1" data-toggle="modal" data-target=".uiset-guide-demo-modal">查看演示</button>
									<button class="btn btn-primary btn-prev mr-1">上一步</button>
									<button class="btn btn-primary btn-next">下一步(2/5)</button>
								</div>
							</div>
						</div>
						<div class="item hide">
							<img data-src="<?php echo $url['own_tem'];?>images/guide-arrow3.png" class="position-absolute" style="left:612px;top:0;">
							<img data-src="<?php echo $url['own_tem'];?>images/guide-arrow1.png" class="position-absolute" style="left:717px;top:20px;transform: rotate(272deg);">
							<div class="uiset-guide-box bg-white p-4 position-absolute" style="left:732px;top:130px;">
								<button type="button" class="close" aria-label="Close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
								<div class="uiset-guide-header">
									<h5 class="d-inline-block mb-0">新手提示</h5>
								</div>
								<hr class="my-2">
								<div class="uiset-guide-body text-secondary text-nowrap">
								鼠标移至顶部导航栏，点击“风格->风格设置”，可设置网站的颜色哦！
								</div>
								<div class="uiset-guide-footer text-right mt-4">
									<button class="btn btn-outline-primary btn-look-demo mr-1" data-toggle="modal" data-target=".uiset-guide-demo-modal">查看演示</button>
									<button class="btn btn-primary btn-prev mr-1">上一步</button>
									<button class="btn btn-primary btn-next">下一步(3/5)</button>
								</div>
							</div>
						</div>
						<div class="item hide">
							<button class="btn btn-primary position-absolute p-1 font-size-12" style="left:48%;top:130px;">设置</button>
							<img data-src="<?php echo $url['own_tem'];?>images/guide-arrow1.png" class="position-absolute" style="left:45%;top:140px;">
							<div class="uiset-guide-box bg-white p-4 position-absolute" style="left:550px;top:265px;">
								<button type="button" class="close" aria-label="Close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
								<div class="uiset-guide-header">
									<h5 class="d-inline-block mb-0">新手提示</h5>
								</div>
								<hr class="my-2">
								<div class="uiset-guide-body text-secondary text-nowrap">
								鼠标移至需要修改的区块，点击“设置”按钮，可调用该网站栏目的数据哦！
								</div>
								<div class="uiset-guide-footer text-right mt-4">
									<button class="btn btn-outline-primary btn-look-demo mr-1" data-toggle="modal" data-target=".uiset-guide-demo-modal">查看演示</button>
									<button class="btn btn-primary btn-prev mr-1">上一步</button>
									<button class="btn btn-primary btn-next">下一步(4/5)</button>
								</div>
							</div>
						</div>
						<div class="item hide">
							<button class="btn btn-warning position-absolute p-1 font-size-12" style="left:48%;top:130px;">内容</button>
							<img data-src="<?php echo $url['own_tem'];?>images/guide-arrow1.png" class="position-absolute" style="left:45%;top:140px;">
							<div class="uiset-guide-box bg-white p-4 position-absolute" style="left:550px;top:265px;">
								<button type="button" class="close" aria-label="Close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
								<div class="uiset-guide-header">
									<h5 class="d-inline-block mb-0">新手提示</h5>
								</div>
								<hr class="my-2">
								<div class="uiset-guide-body text-secondary text-nowrap">
								鼠标移至需要修改的区块，点击“内容”按钮，可发布一篇文章哦！
								</div>
								<div class="uiset-guide-footer text-right mt-4">
									<button class="btn btn-outline-primary btn-look-demo mr-1" data-toggle="modal" data-target=".uiset-guide-demo-modal">查看演示</button>
									<button class="btn btn-primary btn-prev mr-1">上一步</button>
									<button class="btn btn-primary" data-dismiss="modal">完成(5/5)</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php } ?>
<!-- 手机端提示 -->
  <?php if(is_mobile() && !$_COOKIE['pageset_mobile_tips_hide']){ ?>
<div class="pageset-mobile-tips-wrapper" hidden><span class="pageset-mobile-tips"><?php echo $word['visualization1'];?></span></div>
<?php } ?>
<!-- 系统许可协议 -->
  <?php if(!$data['license']){ ?>
<div class="modal fade show met-scrollbar met-modal alert p-0 met-agreement-modal" data-keyboard="false" data-backdrop="false" style="display: block;">
	<div class="modal-dialog modal-dialog-centered modal-xl my-0 mx-auto h-100">
		<div class="modal-content h-100">
			<div class="modal-header justify-content-center">
				<h5 class="modal-title"><?php echo $word['read_protocol'];?></h5>
			</div>
			<div class="modal-body p-0" style="height:calc(100% - 115px);">
				<iframe src="<?php echo $data['license_url'];?>" frameborder="0" width="100%" height="100%" style="vertical-align: top;"></iframe>
			</div>
			<div class="modal-footer justify-content-center">
				<a href="<?php echo $url['site_admin'];?>?n=login&c=login&a=dologinout" class="btn btn-default mr-5"><?php echo $word['disagree'];?></a>
				<button type="button" class="btn btn-primary" data-dismiss="alert"><?php echo $word['agree'];?></button>
			</div>
		</div>
	</div>
</div>
<?php } ?>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$basic_js_time = filemtime(PATH_PUBLIC_THIRD.'admin/basic.js');
$metinfo_js_time = filemtime(PATH_PUBLIC_ADMIN.'js/metinfo.js');
$lang_json_admin_js_time = filemtime(PATH_WEB.'cache/lang_json_admin_'.$_M['lang'].'.js');
?>
</body>
<script>window.MET=<?php echo $data['met_para'];?>;</script>
<script src="<?php echo $url['site'];?>cache/lang_json_admin_<?php echo $_M['langset'];?>.js?<?php echo $lang_json_admin_js_time;?>"></script>
<script src="<?php echo $url['public_third'];?>admin/basic.js?<?php echo $basic_js_time;?>"></script>
<script src="<?php echo $url['public_admin'];?>js/metinfo.js?<?php echo $metinfo_js_time;?>"></script>
</html>
<script src="<?php echo $url['own_tem'];?>js/pageset.js?<?php echo $pageset_js_filemtime;?>"></script>