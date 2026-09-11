<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$lang_name=$_M['user']['langok'][$_M['lang']]['name'];
?>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$del_title=$del_title?$del_title:$word['delete_information'];
?>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$submit_text=$submit_text?$submit_text:$word['Submit'];
?>
<tfoot>
	<tr class="text-wrap">
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<th data-table-columnclass="text-center" width="20">
	<div class="custom-control custom-checkbox">
		<input class="checkall-all custom-control-input" type="checkbox">
		<label class="custom-control-label"></label>
	</div>
</th>
		<th colspan="<?php echo $colspan;?>" data-no_column_defs>
			  <?php if(!$foot_save_no){ ?><button type="submit" class='btn btn-primary px-4'   <?php if($foot_submit_type){ ?>data-submit_type="<?php echo $foot_submit_type;?>"<?php } ?>   <?php if($foot_submit_url){ ?>data-url="<?php echo $foot_submit_url;?>"<?php } ?>><?php echo $submit_text;?></button><?php } ?>

<button type="button" class="btn btn-light px-4   <?php if($del_type){ ?>btn-content-list-del<?php } ?>"
table-delete data-plugin="alertify" data-type='confirm' data-confirm-title='<?php echo $del_title;?>'
  <?php if($del_url){ ?>data-url="<?php echo $del_url;?>"<?php } ?>
data-head_title="确认删除" data-head_icon="fa-trash-o"
><?php echo $word['delete'];?></button>
					<div class="dropup navbar p-0 d-inline-block">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><?php echo $word['modistauts'];?></button>
						<div class="dropdown-menu contentlist-change-status">
							  <?php if($data['module']<>'job'){ ?>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="comok"><?php echo $word['recom'];?></a>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="comno"><?php echo $word['unrecom'];?></a>
							<div class="dropdown-divider"></div>
							<?php } ?>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="topok"><?php echo $word['top'];?></a>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="topno"><?php echo $word['untop'];?></a>
							<div class="dropdown-divider"></div>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="displayok"><?php echo $word['displaytype'];?></a>
							<a href="javascript:;" class="dropdown-item" table-delete data-submit_type="displayno"><?php echo $word['displaytype2'];?></a>
						</div>
					</div>
					  <?php if($data['module']<>'job'){ ?>
					<div class="dropup d-inline-block">
						<button type="button" class="btn btn-default dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown" data-submenu><?php echo $word['columnmove1'];?></button>
						<div class="dropdown-menu contentlist-move">
							<div class="dropdown-header font-weight-normal"><?php echo $word['admin_movetocolumn_v6'];?></div>
							<div class="dropdown-divider"></div>
							<?php $submit_type='move'; ?>
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
						</div>
					</div>
					<div class="dropup d-inline-block">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-submenu><?php echo $word['Copy'];?></button>
						<div class="dropdown-menu contentlist-copy-langlist">
							<div class="dropdown-header font-weight-normal"><?php echo $word['copyotherlang6'];?></div>
							<div class="dropdown-divider"></div>
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
							<a href="javascript:;" class="dropdown-item px-3" data-val="<?php echo $v['mark'];?>"><?php echo $v['name'];?></a>
							<?php }?>
						</div>
					</div>
					<div class="dropup d-inline-block hide contentlist-copy-list">
						<button type="button" class="btn btn-default dropdown-toggle" onClick="dropdownMenuPosition(this)" data-toggle="dropdown" data-submenu><?php echo $word['admin_copytocolumn_v6'];?></button>
						<div class="dropdown-menu contentlist-copy">
						</div>
					</div>
					<input type="hidden" name="tolang" value="<?php echo $_M['lang'];?>">
					<input type="hidden" name="module" value="<?php echo $data['module'];?>">
					<?php } ?>
				</th>
			</tr>
		</tfoot>
	</table>
</form>