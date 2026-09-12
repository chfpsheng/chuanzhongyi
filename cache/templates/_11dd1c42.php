<?php
// MetInfo Enterprise Content Management System
// Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$head_tab_active = isset($data['head_tab_active']) ? $data['head_tab_active'] : 0;
    $head_tab = array(
        array('title' => $word['safety_efficiency'], 'url' => 'safe/safe/?nocommon=1', 'reload' => 1),
        array('title' => $word['email_Settings'], 'url' => 'safe/email'),
        array('title' => $word['database_switch'], 'url' => 'safe/database'),
        array('title' => $word['operation_log'], 'url' => 'safe/logs/?nocommon=1'),
    );
$head_tab_ajax = 1;
?>
<div class="met-safe">
    <?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$head_tab_active=isset($data['head_tab_active'])?$data['head_tab_active']:(isset($head_tab_active)?$head_tab_active:0);
$content_time=str_replace('.','',microtime(true));
?>
  <?php if($head_tab){ ?>
<nav class="nav nav-underline met-headtab position-sticky oxa flex-nowrap text-nowrap met-scrollbar scrollbar-grey   <?php if($head_tab_ajax && !$no_bg){ ?>metadmin-content-min py-2 px-4<?php }else{ ?>mb-3<?php } ?> bg-white"   <?php if($head_tab_ajax){ ?>data-ajaxchange='1'<?php } ?>   <?php if($head_tab_reload){ ?>data-reload="1"<?php } ?>>
	        <?php
            $sub = is_array($head_tab) ? count($head_tab) : 0;
            $cycleindex = 50;

            if(!is_array($head_tab) && $head_tab){
                $head_tab = explode('|',$head_tab);
            }

            foreach ($head_tab as $index => $val) {
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
	  <a
		class="nav-link   <?php if($head_tab_active==$v['_index']){ ?>active<?php } ?>"
	  	  <?php if($head_tab_ajax && !$v['target']){ ?>
		data-url="<?php echo $v['url'];?>" data-toggle="pill" href="#met-headtab-content-<?php echo $content_time;?>-<?php echo $v['_index'];?>"
		<?php }else{ ?>
		href="<?php echo $v['url'];?>"
		<?php } ?>
		  <?php if($v['reload']){ ?>data-reload="1"<?php } ?>
		  <?php if($v['noreload']){ ?>data-noreload="1"<?php } ?>
		  <?php if($v['noloader']){ ?>data-noloader="1"<?php } ?>
		  <?php if($v['target']){ ?>target="_blank"<?php } ?>
		><?php echo $v['title'];?></a>
  	<?php }?>
</nav>
  <?php if($head_tab_ajax){ ?>
<?php $head_tab_url=$head_tab[$head_tab_active]['url']; ?>
<div class="tab-content">
	        <?php
            $sub = is_array($head_tab) ? count($head_tab) : 0;
            $cycleindex = 50;

            if(!is_array($head_tab) && $head_tab){
                $head_tab = explode('|',$head_tab);
            }

            foreach ($head_tab as $index => $val) {
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
	  <?php if(!$v['target']){ ?>
	<div class="tab-pane fade   <?php if(!$no_bg){ ?>bg-white p-4<?php } ?>   <?php if($v['_index']==$head_tab_active){ ?>show active<?php } ?>" id="met-headtab-content-<?php echo $content_time;?>-<?php echo $v['_index'];?>">
	</div>
	<?php } ?>
	<?php }?>
</div>
<?php } ?>
<?php
unset($head_tab_ajax);
unset($head_tab_active);
unset($head_tab);
?>
<?php } ?>
</div>