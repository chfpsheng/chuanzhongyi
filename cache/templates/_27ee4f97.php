<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<?php
$html_class=$body_class='h-100';
$html_class.=' met-admin';
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
  <?php if(!$_M['form']['noside']){ ?>
<div class="h-100 cover d-flex">
	<div class="metadmin-sidebar h-100 transition500 bg-grey-100 pt-1">
		<div class="metadmin-logo d-flex justify-content-between align-items-center py-2 px-4" style="height: 62px;">
			<a href="#/home" title="<?php echo $word['metinfo'];?>" class="d-block">
				<img src="<?php echo $c['met_agents_logo_index'];?>" alt="<?php echo $word['metinfo'];?>" class="img-fluid" style="max-height: 50px;">
			</a>
			<button type="button" class="btn btn-default border-none p-0 ml-2 text-center position-relative btn-adminsidebar-control" style="top: 2px;"><i class="fa-dedent h4 mb-0 position-relative"></i></button>
		</div>
		<!-- <hr class="my-0"> -->
		<ul class="list-unstyled mb-0 metadmin-sidebar-nav">
			<li class="transition500 first px-3 mb-2">
				<div class="d-flex justify-content-center align-items-center px-3 rounded-20" style="background: #EDEDED;">
					<a href="#/home" class="text-content"><?php echo $word['backstage'];?></a>
					  <?php if($data['admin_pop']){ ?>
						<a href="<?php echo $url['site_admin'];?>?lang=<?php echo $_M['lang'];?>&n=ui_set" target="_blank" class="text-content ml-3"><?php echo $word['visualization'];?></a>
					<?php } ?>
					<a href="<?php echo $url['site'];?>index.php?lang=<?php echo $_M['lang'];?>" target="_blank" class="text-content ml-3"><?php echo $word['preview'];?></a>
				</div>
			</li>
			<li class="transition500 position-relative">
				<a href="javascript:;" class="d-flex justify-content-between align-items-center px-4">
					<div><i class="fa-home mr-3"></i></div>
				</a>
				<ul class="sub list-unstyled text-nowrap py-2 shadow rounded-lg">
					<li class="transition500">
						<a href="#/home" title="<?php echo $msub['name'];?>" class="d-flex align-items-center px-4"><span><?php echo $word['backstage'];?></span></a>
						<a href="<?php echo $url['site_admin'];?>?lang=<?php echo $_M['lang'];?>&n=ui_set" class="d-flex align-items-center px-4"><span><?php echo $word['visualization'];?></span></a>
						<a href="<?php echo $url['site'];?>index.php?lang=<?php echo $_M['lang'];?>" target="_blank" class="d-flex align-items-center px-4"><span><?php echo $word['preview'];?></span></a>
					</li>
				</ul>
			</li>
			<!-- <hr class="my-0"> -->
		</ul>
	</div>
<?php } ?>
	<div class="metadmin-rightcontent h-100 met-scrollbar position-relative media-body bg-grey-100" style="overflow-x: hidden;">
		  <?php if(!$_M['form']['noside']){ ?>
		<?php
        $lang_name = $_M['langlist']['web'][$_M['lang']]['name'];
		?>
		<div class="pt-2 mr-4 metadmin-head-wrapper">
			<div class="bg-grey-100 w-100 position-absolute" style="left: 0;top: 0;height: 50%;"></div>
			<header class="metadmin-head navbar bg-white px-0 rounded-20 position-relative">
				<div class="container-fluid px-4">
					<div class="metadmin-head-right d-flex align-items-center">
						<div class="dropdown" style="margin-right: 100px;">
							<a href="javascript:;" class="btn btn-outline-dark rounded-5 py-1 dropdown-toggle" data-toggle="dropdown">
								<span class="d-none d-md-inline-block"><?php echo $lang_name;?></span>
							</a>
							<ul class="dropdown-menu metadmin-head-langlist">
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
								<li class="px-3 py-1"><a href="#/language" class="btn btn-outline-666"><i class="fa fa-plus"></i> <?php echo $word['added'];?> <?php echo $word['langweb'];?></a></li>
							</ul>
						</div>
						  <?php if($c['met_agents_metmsg']){ ?>
						<a href="javascript:;" class="text-content mr-4 d-flex align-items-center" data-toggle="modal" data-target=".syspackage-modal" data-modal-url="ui_set/package" data-modal-title="授权信息" data-modal-type="centered" data-modal-footerok="0">
							<img src="<?php echo $url['public_images'];?>admin_top_nav/authorization.svg" height="15">
							<span class="d-none d-md-inline-block ml-1">版本信息</span>
						</a>
						<?php } ?>
						<div class="dropdown">
							<a href="javascript:;" class="text-content d-flex align-items-center dropdown-toggle" type="button" data-toggle="dropdown">
								<img src="<?php echo $url['public_images'];?>admin_top_nav/check_updates.svg" height="15">
								<span class="d-none d-md-inline-block ml-1"><?php echo $word['update_log'];?></span>
							</a>
							<ul class="dropdown-menu">
								  <?php if($c['met_agents_metmsg']){ ?>
								<a href="<?php echo $c['help_url'];?>" target="_blank" class='dropdown-item px-3'><?php echo $word['help_manual'];?></a>
								<a href="<?php echo $c['edu_url'];?>" target="_blank" class='dropdown-item px-3'><?php echo $word['extension_school'];?></a>
								<a href="<?php echo $c['kf_url'];?>" target="_blank" class='dropdown-item px-3'><?php echo $word['online_work_order'];?></a>
								<?php } ?>
								<a href="javascript:;" class='dropdown-item px-3' data-toggle="modal" data-target=".syslicense-modal" data-modal-url="ui_set/license/?n=system&c=license&a=doLicenseList" data-modal-title="许可协议">许可协议</a>
							</ul>
						</div>
					</div>
					<div class="dropdown">
						<button type="button" class="btn btn-default bg-grey border-none rounded-pill py-1 dropdown-toggle" data-toggle="dropdown">
							<i class="metinfo-admin-icon metinfo-admin-icon-administrator"></i>
							<span><?php echo $_M['user']['admin_name'];?></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-right">
							<a href="#/admin/admin_sys/?n=admin&c=index&a=doInfo" class="dropdown-item px-3"><?php echo $word['modify_information'];?></a>
							<a href="<?php echo $url['adminurl'];?>n=login&c=login&a=dologinout" class="dropdown-item px-3"><?php echo $word['indexloginout'];?></a>
						</ul>
					</div>
				</div>
			</header>
		</div>
		<?php } ?>
		<div class="metadmin-main pr-4 mt-4 mb-3">
		</div>
		<div class="metadmin-loader"><div class="text-center d-flex align-items-center h-100"><div class="loader loader-round-circle"></div></div></div>
		<footer class="metadmin-foot px-4 my-3 text-grey text-center position-sticky" style="top: 100%;"><?php echo $data['copyright'];?></footer>
		<button type="button" class="btn btn-primary px-2 met-scroll-top position-fixed" hidden><span class="px-1"><i class="icon wb-chevron-up" aria-hidden="true"></i></span></button>
	</div>
  <?php if(!$_M['form']['noside']){ ?>
</div>
<button type="button" data-toggle="modal" class="btn-admin-common-modal" hidden></button>
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