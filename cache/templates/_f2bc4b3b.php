<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
        <?php
            $sub = is_array($data['columnlist']) ? count($data['columnlist']) : 0;
            $cycleindex = 500;

            if(!is_array($data['columnlist']) && $data['columnlist']){
                $data['columnlist'] = explode('|',$data['columnlist']);
            }

            foreach ($data['columnlist'] as $index => $val) {
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
  <?php if($v['p']['value']<>''){ ?>
  <?php if($v['c']){ ?>
<div class="dropdown dropright dropdown-submenu">
	<a href="javascript:;" class="dropdown-item px-3 dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown"><?php echo $v['p']['name'];?></a>
	<div class="dropdown-menu">
		        <?php
            $sub = is_array($v['c']) ? count($v['c']) : 0;
            $cycleindex = 500;

            if(!is_array($v['c']) && $v['c']){
                $v['c'] = explode('|',$v['c']);
            }

            foreach ($v['c'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $w = $val;
            ?>
		  <?php if($w['n']['value']<>''){ ?>
		  <?php if($w['a']){ ?>
		<div class="dropdown dropdown-submenu">
			<a href="javascript:;" class="dropdown-item px-3 dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown"><?php echo $w['n']['name'];?></a>
			<div class="dropdown-menu">
				        <?php
            $sub = is_array($w['a']) ? count($w['a']) : 0;
            $cycleindex = 500;

            if(!is_array($w['a']) && $w['a']){
                $w['a'] = explode('|',$w['a']);
            }

            foreach ($w['a'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $x = $val;
            ?>
				  <?php if($x['s']['value']<>''){ ?>
				<a href="javascript:;" class="dropdown-item px-3" table-delete data-submit_type="<?php echo $submit_type;?>" data-val="<?php echo $v['p']['value'];?>-<?php echo $w['n']['value'];?>-<?php echo $x['s']['value'];?>"><?php echo $x['s']['name'];?></a>
				<?php } ?>
				<?php }?>
			</div>
		</div>
		<?php }else{ ?>
		<a href="javascript:;" class="dropdown-item px-3" table-delete data-submit_type="<?php echo $submit_type;?>" data-val="<?php echo $v['p']['value'];?>-<?php echo $w['n']['value'];?>"><?php echo $w['n']['name'];?></a>
		<?php } ?>
		<?php } ?>
		<?php }?>
	</div>
</div>
<?php }else{ ?>
<a href="javascript:;" class="dropdown-item px-3" table-delete data-submit_type="<?php echo $submit_type;?>" data-val="<?php echo $v['p']['value'];?>"><?php echo $v['p']['name'];?></a>
<?php } ?>
<?php } ?>
<?php }?>