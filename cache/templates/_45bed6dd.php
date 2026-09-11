<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$checkbox_time=time();
if($data['list']['displaytype']==-1){
	$data['list']['displaytype']=1;
}
?>
<dl>
	<dt>
		<label class='form-control-label'><?php echo $word['state'];?></label>
	</dt>
	<dd>
		<div class='form-group clearfix'>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" id="displaytype1-<?php echo $checkbox_time;?>" name='displaytype' value='1' data-checked='<?php echo $data['list']['displaytype'];?>' class="custom-control-input"/>
				<label class="custom-control-label" for="displaytype1-<?php echo $checkbox_time;?>"><?php echo $word['displaytype'];?></label>
			</div>
			  <?php if($data['n']<>'job'){ ?>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" id="com_ok1-<?php echo $checkbox_time;?>" name='com_ok' value='1' data-checked='<?php echo $data['list']['com_ok'];?>' class="custom-control-input"/>
				<label class="custom-control-label" for="com_ok1-<?php echo $checkbox_time;?>"><?php echo $word['recom'];?></label>
			</div>
			<?php } ?>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input type="checkbox" id="top_ok1-<?php echo $checkbox_time;?>" name='top_ok' value='1' data-checked='<?php echo $data['list']['top_ok'];?>' class="custom-control-input"/>
				<label class="custom-control-label" for="top_ok1-<?php echo $checkbox_time;?>"><?php echo $word['top'];?></label>
			</div>
		</div>
	</dd>
</dl>