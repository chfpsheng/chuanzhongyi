<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
if($data['handle']){
	$data=array_merge($data,$data['handle']);
	unset($data['handle']);
}
$checkbox_time=time();
switch ($data['module']) {
	case 2:
		$data['module_name']='news';
		break;
	case 3:
		$data['module_name']='product';
		break;
	case 4:
		$data['module_name']='download';
		break;
	case 5:
		$data['module_name']='img';
		$data['module_img']='imgs';
		break;
	case 6:
		$data['module_name']='job';
		break;
	case 7:
		$data['module_name']='message';
		break;
}
$data['module_page']=$c['met_'.$data['module_name'].'_page'];
if(!$data['tab_name']){
	$data['tab_name']=$data['tab_name_default'];
}
$data['tab_name']=explode('|', $data['tab_name']);
$data['tab_name_default']=explode('|', $data['tab_name_default']);
$data['thumb_list']=explode('|', $data['thumb_list']);
$data['thumb_list_default']=explode('|', $data['thumb_list_default']);
$data['thumb_detail']=explode('|', $data['thumb_detail']);
$data['thumb_detail_default']=explode('|', $data['thumb_detail_default']);
if(!$data['module_img']){
	$data['module_img']=$data['module_name'].'img';
}
$data['module_img_x']=$c['met_'.$data['module_img'].'_x'];
$data['module_img_y']=$c['met_'.$data['module_img'].'_y'];
$data['module_imgdetail_x']=$c['met_'.$data['module_name'].'detail_x'];
$data['module_imgdetail_y']=$c['met_'.$data['module_name'].'detail_y'];
?>
<form action="<?php echo $url['own_name'];?>c=index&a=doset_page_config&classnow=<?php echo $data['classnow'];?>&id=<?php echo $data['id'];?>" data-submit-ajax="1">
	<div class="metadmin-fmbx">
		  <?php if($data['id']){ ?>
		  <?php if($data['module']==3 || $data['module']==5){ ?>
		<dl>
			<dd>
				<span class="text-help"><?php echo $word['thumb_seting_tips'];?></span>
			</dd>
		</dl>
		<?php } ?>
		<?php }else{ ?>
		  <?php if($data['from']){ ?><div hidden><?php } ?>
		  <?php if($data['module']==2 || $data['module']==3 || $data['module']==5){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['thumb_size_list'];?></label>
			</dt>
			<dd class="form-group">
				<input type="number" min="0" max="1500" name="thumb_list_x" value="<?php echo $data['thumb_list']['0'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['thumb_list_default']['0'];?>" class="form-control w-a text-center">
				<span class="float-left text-help text-muted mx-2">x</span>
				<input type="number" min="0" max="1000" name="thumb_list_y" value="<?php echo $data['thumb_list']['1'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['thumb_list_default']['1'];?>" class="form-control w-a text-center">
				<span class="text-help ml-2"><?php echo $word['setimgWidth'];?>x<?php echo $word['setimgHeight'];?>(<?php echo $word['setimgPixel'];?>)</span>
			</dd>
		</dl>
		  <?php if($data['module']==3 || $data['module']==5){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['thumb_size_showpage'];?></label>
			</dt>
			<dd class="form-group">
				<input type="number" min="0" max="1500" name="thumb_detail_x" value="<?php echo $data['thumb_detail']['0'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['thumb_detail_default']['0'];?>" class="form-control w-a text-center">
				<span class="float-left text-help text-muted mx-2">x</span>
				<input type="number" min="0" max="1000" name="thumb_detail_y" value="<?php echo $data['thumb_detail']['1'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['thumb_detail_default']['1'];?>" class="form-control w-a text-center">
				<span class="text-help ml-2"><?php echo $word['setimgWidth'];?>x<?php echo $word['setimgHeight'];?>(<?php echo $word['setimgPixel'];?>)</span>
			</dd>
		</dl>
		<?php } ?>
		<?php } ?>
		  <?php if(($data['module']>=2 && $data['module']<=7) || $data['module']==11){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['unitytxt_42'];?></label>
			</dt>
			<dd class="form-group">
				<input type="number" min="1" max="9999" name="list_length" value="<?php echo $data['list_length'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['list_length_default'];?>" class="form-control w-a text-center">
			</dd>
		</dl>
		<?php } ?>
		  <?php if($data['module']==3 || $data['module']==5){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['setskinListPage'];?></label>
			</dt>
			<dd class="form-group">
				<div class="custom-control custom-radio">
					<input type="radio" id="met_<?php echo $data['module_name'];?>_page0-<?php echo $checkbox_time;?>" name='met_<?php echo $data['module_name'];?>_page' value='0' data-checked='<?php echo $data['module_page'];?>' required class="custom-control-input"/>
					<label class="custom-control-label" for="met_<?php echo $data['module_name'];?>_page0-<?php echo $checkbox_time;?>"><?php echo $word['setskinproduct1'];?></label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="met_<?php echo $data['module_name'];?>_page1-<?php echo $checkbox_time;?>" name='met_<?php echo $data['module_name'];?>_page' value='1' class="custom-control-input"/>
					<label class="custom-control-label" for="met_<?php echo $data['module_name'];?>_page1-<?php echo $checkbox_time;?>"><?php echo $word['setskinproduct2'];?></label>
				</div>
				<span class="text-help ml-2"><?php echo $word['sys_navigation2'];?></span>
			</dd>
		</dl>
		<?php } ?>
		  <?php if($data['from']){ ?></div><?php } ?>
		  <?php if($data['module']==3){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['display_number'];?></label>
			</dt>
			<dd class="form-group">
				<select name="tab_num" data-checked="<?php echo $data['tab_num'];?>" class="form-control w-a">
					<option value="0"><?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['tab_num_default'];?></option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				<span class="text-help ml-2"><?php echo $word['corresponding_products'];?></span>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['tab_title1'];?></label>
			</dt>
			<dd class="form-group">
				<input type="text" name="tab_name_0" value="<?php echo $data['tab_name']['0'];?>" required class="form-control">
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['tab_title2'];?></label>
			</dt>
			<dd class="form-group">
				<input type="text" name="tab_name_1" value="<?php echo $data['tab_name']['1'];?>" required class="form-control">
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['tab_title3'];?></label>
			</dt>
			<dd class="form-group">
				<input type="text" name="tab_name_2" value="<?php echo $data['tab_name']['2'];?>" required class="form-control">
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['tab_title4'];?></label>
			</dt>
			<dd class="form-group">
				<input type="text" name="tab_name_3" value="<?php echo $data['tab_name']['3'];?>" required class="form-control">
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['tab_title5'];?></label>
			</dt>
			<dd class="form-group">
				<input type="text" name="tab_name_4" value="<?php echo $data['tab_name']['4'];?>" required class="form-control">
			</dd>
		</dl>
		<?php } ?>
		<?php } ?>
		  <?php if((($data['module']==2 || $data['module']==4) && $data['id'])||(($data['module']<2 || $data['module']>7) && $data['module']<>11)){ ?>
		<dl><dd class="text-danger"><?php echo $word['uisetTips3'];?></dd></dl>
		<?php } ?>
	</div>
</form>