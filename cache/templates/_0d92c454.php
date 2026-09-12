<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$data = array_merge($data, $data['handle']);
unset($data['handle']);
$met_news_api = "https://www.metinfo.cn/metv5news.php?action=json&listnum=6";
$metinfo_website = "https://www.metinfo.cn/";
?>
<input type="hidden" name="admin_folder_safe" value="<?php echo $data['admin_folder_safe'];?>" data-toggle="modal" data-target=".admin-folder-safe-modal">
<div class="row text-center site-summarize-list">
	        <?php
            $sub = is_array($data['summarize']) ? count($data['summarize']) : 0;
            $cycleindex = 50;

            if(!is_array($data['summarize']) && $data['summarize']){
                $data['summarize'] = explode('|',$data['summarize']);
            }

            foreach ($data['summarize'] as $index => $val) {
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
	<?php
	$url='#/manage/?view_type=module&module='.$v['_index'];
	$v['_index']=='job' && $url.='&head_tab_active=1';
	?>
	<div class="item px-3" style="width: 20%;max-width: 20%;">
		<a href="<?php echo $url;?>" class="d-flex justify-content-center align-items-center py-4 text-content">
			<div class="d-flex align-items-center flex-column">
				<div class="img d-flex justify-content-center align-items-center bg-white rounded-circle">
					<img src="../app/system/index/admin/templates/images/<?php echo $v['_index'];?>.svg" width="30" height="30">
				</div>
				<span class="my-1 text-dark"><?php echo $v['total'];?></span>
				<div class="my-0 font-size-18"><?php echo $v['name'];?></div>
			</div>
		</a>
	</div>
	<?php }?>
</div>
  <?php if($data['home_app_ok']){ ?>
<div class="mt-4 pt-3">
	<div class="d-flex justify-content-between align-items-center">
		<h3 class="font-size-18 font-weight-bold mb-0 float-left"><?php echo $word['recom'];?></h3>
		<a href="<?php echo $c['market_url'];?>" target="_blank" class="text-content"><?php echo $word['columnmore'];?> <i class="fa fa-angle-right"></i></a>
	</div>
	<ul class="home-app-list row list-unstyled mb-0 mt-2">
		<?php $loader_class='w-100'; ?>
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<div class="text-center py-5 <?php echo $loader_class;?>"><?php echo $word['fliptext2'];?></div>
<?php unset($loader_class); ?>
	</ul>
</div>
<?php } ?>
  <?php if($data['home_app_ok']){ ?>
<div class="mt-4">
	<div class="d-flex justify-content-between align-items-center">
		<h3 class="font-size-18 font-weight-bold mb-0 float-left">MetInfo <?php echo $word['upfiletips37'];?></h3>
		<a href="<?php echo $metinfo_website;?>" target="_blank" class="text-content"><?php echo $word['columnmore'];?> <i class="fa fa-angle-right"></i></a>
	</div>
	<div class="home-news-list mt-3" data-url="<?php echo $met_news_api;?>">
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<div class="text-center py-5 <?php echo $loader_class;?>"><?php echo $word['fliptext2'];?></div>
<?php unset($loader_class); ?>
	</div>
</div>
<?php } ?>