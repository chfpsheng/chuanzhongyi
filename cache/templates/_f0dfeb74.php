<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
if($data['handle']){
	$data=array_merge($data,$data['handle']);
	unset($data['handle']);
}
$table_order='parameter-list-'.$data['module'].'-'.$data['class1'].'-'.$data['class2'].'-'.$data['class3'];
$colspan=$data['module']=='message'?5:6;
?>
<div class="alert alert-primary"><?php echo $word['admin_content_list1'];?></div>
<form method="POST" action="<?php echo $url['own_name'];?>c=parameter_admin&a=doparasave&module=<?php echo $data['module_value'];?>&class1=<?php echo $data['class1'];?>&class2=<?php echo $data['class2'];?>&class3=<?php echo $data['class3'];?>" data-submit-ajax='1'>
	<table class="table table-hover dataTable w-100 parameter-list" id="<?php echo $table_order;?>" data-ajaxurl="<?php echo $url['own_name'];?>c=parameter_admin&a=dojson_para_list&module=<?php echo $data['module_value'];?>&class1=<?php echo $data['class1'];?>&class2=<?php echo $data['class2'];?>&class3=<?php echo $data['class3'];?>" data-table-pageLength="1000" data-plugin="checkAll" data-datatable_order="#<?php echo $table_order;?>">
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
				<th><?php echo $word['paraname'];?></th>
                <?php if (in_array($data['module_value'],array(6,7,8))) {
                    $colspan++;
                ?>
                <th><?php echo $word['message_tips2_v6'];?><span role="button" class="ml-1" data-plugin="webuiPopover" data-trigger="hover" data-animation="pop" data-width="300" data-padding="0" data-content="<?php echo $word['message_tips3_v6'];?>"><i class="icon fa-question-circle-o text-primary"></i></span></th>
                <?php } ?>
				<th data-table-columnclass="text-center" width="80"><?php echo $word['parametertype'];?></th>
                  <?php if($data['module']<>'message'){ ?>
                    <th data-table-columnclass="text-center"><?php echo $word['category'];?></th>
                <?php } ?>
				<th data-table-columnclass="text-center" width="90"><?php echo $word['webaccess'];?></th>
				<?php
				if(in_array($data['module_value'],array(6,7,8))){
					$colspan++;
				?>
				<th data-table-columnclass="text-center" width="60"><?php echo $word['user_must_v6'];?></th>
				<?php } ?>
				<th width="110"><?php echo $word['operate'];?></th>
			</tr>
		</thead>
		<tbody data-plugin="dragsort" data-dragsort_order=".parameter-list">
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
		$table_newid=1;
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
					<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<button type="button" class="btn btn-outline-666" table-addlist="<?php echo $table_addlist;?>"   <?php if($table_newid){ ?>data-table-newid='1'<?php } ?>><?php echo $word['add'];?></button>
					<textarea table-addlist-data hidden>
						<tr>
							<td class="text-center">
								<div class="custom-control custom-checkbox">
									<input class="checkall-item custom-control-input" type="checkbox" name="id">
									<label class="custom-control-label"></label>
								</div>
								<input type="hidden" name="no_order"></td>
							<td>
								<div class="form-group">
									<input type="text" name="name" required class="form-control">
								</div>
							</td>
							  <?php if($data['module_value']>=6 && $data['module_value']<=8){ ?>
							<td>
								<input type="text" name="description" class="form-control">
							</td>
							<?php } ?>
							<td class="text-center">
								<select name="type" class="form-control w-a d-inline-block">
									        <?php
            $sub = is_array($data['type_options']) ? count($data['type_options']) : 0;
            $cycleindex = 50;

            if(!is_array($data['type_options']) && $data['type_options']){
                $data['type_options'] = explode('|',$data['type_options']);
            }

            foreach ($data['type_options'] as $index => $val) {
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
									<option value="<?php echo $v['val'];?>"><?php echo $v['name'];?></option>
									<?php }?>
								</select>
							</td>
							  <?php if($data['module']<>'message'){ ?>
							<td class="text-center">
								<select name="class" data-checked="<?php echo $data['class1'];?>-<?php echo $data['class2'];?>-<?php echo $data['class3'];?>" class="form-control w-a d-inline-block">
									        <?php
            $sub = is_array($data['class_options']) ? count($data['class_options']) : 0;
            $cycleindex = 150;

            if(!is_array($data['class_options']) && $data['class_options']){
                $data['class_options'] = explode('|',$data['class_options']);
            }

            foreach ($data['class_options'] as $index => $val) {
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
									<option value="<?php echo $v['val'];?>"><?php echo $v['name'];?></option>
									<?php }?>
								</select>
							</td>
							<?php } ?>
							<td class="text-center">
								<select name="access" class="form-control w-a d-inline-block">
									        <?php
            $sub = is_array($data['access_options']) ? count($data['access_options']) : 0;
            $cycleindex = 50;

            if(!is_array($data['access_options']) && $data['access_options']){
                $data['access_options'] = explode('|',$data['access_options']);
            }

            foreach ($data['access_options'] as $index => $val) {
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
									<option value="<?php echo $v['val'];?>"><?php echo $v['name'];?></option>
									<?php }?>
								</select>
							</td>
							  <?php if(in_array($data['module_value'], array(6,7,8))){ ?>
							<td class="text-center">
								<select name="wr_ok" class="form-control w-a d-inline-block">
									<option value="1"><?php echo $word['yes'];?></option>
									<option value="0"><?php echo $word['no'];?></option>
								</select>
							</td>
							<?php } ?>
							<td>
								<button type="button" class="btn px-1 btn-light-primary btn-parameter-setoptions" data-toggle="modal" data-target=".parameter-options-modal" data-modal-title="<?php echo $word['listTitle'];?>" hidden><?php echo $word['listTitle'];?></button>
								<input name="options" type="hidden"/>
							</td>
						</tr>
					</textarea>
					  <?php if($data['module_value']==3){ ?>
					<span class='text-help font-weight-normal ml-2'><?php echo $word['product_para_tips'];?></span>
					<?php } ?>
				</th>
			</tr>
		</tfoot>
	</table>
</form>