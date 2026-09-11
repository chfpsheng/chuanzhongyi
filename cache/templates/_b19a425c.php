<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$checkbox_time=time();
$table_addlist='#column-list';
?>
<div class="alert alert-primary"><?php echo $word['noorderinfo'];?></div>
<div class="metadmin-content-min p-4 bg-white">
	<div class="clearfix">
		<button type="button" class="btn btn-outline-666 px-4 btn-add-column" data-toggle="modal" data-target=".column-add-modal"><?php echo $word['add'];?></button>
		<button type="button" class="btn btn-light float-right btn-show-allsubcolumn2"><span><?php echo $word['open_allchildcolumn_v6'];?></span><i class="fa-angle-down"></i></button>
	</div>
	<form method="POST" action="<?php echo $url['own_name'];?>c=index&a=dolistsave" data-submit-ajax='1'>
		<table class="table table-hover dataTable w-100 mt-3" id="column-list" data-ajaxurl="<?php echo $url['own_name'];?>c=index&a=doGetColumnList" data-table-sdom='t' data-plugin="checkAll" data-datatable_order="#column-list">
			<thead>
				<tr>
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
					<th data-table-columnclass="text-center" width="30"><?php echo $word['sort'];?></th>
					<th data-table-columnclass="td-column-name">
						<div class="d-flex justify-content-between align-items-center">
							<?php echo $word['columnname'];?><a href="javascript:;" class="btn-show-allsubcolumn px-2 text-dark"><i class="fa-angle-down"></i></a>
						</div>
					</th>
					<th data-table-columnclass="text-center" width="170"><?php echo $word['columnnav'];?></th>
					<th data-table-columnclass="text-center" width="100"><?php echo $word['columnmodule'];?></th>
					<th data-table-columnclass="text-center" width="120"><?php echo $word['columndocument'];?></th>
					<th width="160"><?php echo $word['operate'];?></th>
				</tr>
			</thead>
			<tbody>
				<?php $colspan=7; ?>
				<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<tr>
	<td colspan="<?php echo $colspan;?>">
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<div class="text-center py-5 <?php echo $loader_class;?>"><?php echo $word['fliptext2'];?></div>
<?php unset($loader_class); ?>
	</td>
</tr>
			</tbody>
			<?php
			$colspan--;
			$del_title=$word['delete_information'].$word['jsx39'];
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
						<button type="button" class="btn btn-outline-666 px-4" data-toggle="modal" data-target=".column-add-modal"><?php echo $word['add'];?></button>
						<div class="float-right">
							<div class="custom-control custom-checkbox checkbox-inline mr-2">
								<input type="checkbox" id="is_contents-<?php echo $checkbox_time;?>" name='is_contents' value='1' class="custom-control-input"/>
								<label class="custom-control-label pl-1 font-weight-normal" for="is_contents-<?php echo $checkbox_time;?>"><?php echo $word['copyotherlang2'];?></label>
							</div>
							<select name="to_lang" class="form-control d-inline-block w-a">
								<option value=""><?php echo $word['copyotherlang1'];?></option>
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
								  <?php if($_M['lang']<>$v['mark']){ ?>
								<option value="<?php echo $v['mark'];?>"><?php echo $v['name'];?></option>
								<?php } ?>
								<?php }?>
							</select>
							<button type="submit" class="btn btn-outline-primary" data-submit_type="copy"><?php echo $word['Copy'];?></button>
						</div>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>