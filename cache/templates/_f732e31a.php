<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$checkbox_time=time();
?>
<h3 class='example-title clearfix'><span class="my-1 d-inline-block" role="button" data-toggle="collapse" data-target=".<?php echo $data['n'];?>-details-other"><?php echo $word['unitytxt_15'];?><i class="icon fa-angle-right ml-2"></i></span></h3>
<div class="collapse <?php echo $data['n'];?>-details-other">
	  <?php if($data['n']=='news'){ ?>
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['modpublish'];?></label>
		</dt>
		<dd>
			<div class='form-group clearfix'>
				<input type="text" name="publisher" value="<?php echo $data['list']['publisher'];?>" class="form-control">
			</div>
		</dd>
	</dl>
	<?php } ?>
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['js79'];?></label>
		</dt>
		<dd>
			<div class='form-group clearfix'>
				<input type="text" name="hits" value="<?php echo $data['list']['hits'];?>" class="form-control">
			</div>
		</dd>
	</dl>
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['linkto'];?></label>
		</dt>
		<dd>
			<div class="float-left mr-2">
				<input type="text" name="links" value="<?php echo $data['list']['links'];?>" class="form-control"/>
			</div>
			<span class="text-help"><?php echo $word['tips4_v6'];?></span>
		</dd>
	</dl>
	  <?php if($data['list']['module']<>1){ ?>
	<dl>
        <dt>
            <label class='form-control-label'><?php echo $word['setfootOther'];?></label>
        </dt>
        <dd>
            <div class='form-group clearfix'>
                <input type="text" name="other_info" value="<?php echo $data['list']['other_info'];?>" class="form-control">
                <span class="text-help ml-2"><?php echo $word['banner_needtempsupport_v6'];?></span>
            </div>
        </dd>
    </dl>
    <dl>
        <dt>
            <label class='form-control-label'><?php echo $word['custom_info'];?></label>
        </dt>
        <dd>
            <textarea name="custom_info" rows="3" class='form-control'><?php echo $data['list']['custom_info'];?></textarea>
            <span class="text-help ml-2"><?php echo $word['banner_needtempsupport_v6'];?></span>
        </dd>
    </dl>
    <?php } ?>
	<?php
	$webaccess=array(
		'value'=>$data['list']['access'],
		'access'=>$data['access_option']
	);
	?>
	<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$webaccess['title'] = $webaccess['title'] ? $webaccess['title'] : $word['webaccess'];
$webaccess['name'] = $webaccess['name'] ? $webaccess['name'] : 'access';
$webaccess['value'] = isset($webaccess['value']) ? $webaccess['value'] : $data['list']['access'];
$webaccess['access'] = $webaccess['access'] ? $webaccess['access'] : $data['access'];
?>
<dl>
	<dt>
		<label class='form-control-label'><?php echo $webaccess['title'];?><?php echo $webaccess['marks'];?></label>
	</dt>
	<dd class="form-group">
		<select class="form-control w-a" name='<?php echo $webaccess['name'];?>' data-checked="<?php echo $webaccess['value'];?>">
			        <?php
            $sub = is_array($webaccess['access']) ? count($webaccess['access']) : 0;
            $cycleindex = 50;

            if(!is_array($webaccess['access']) && $webaccess['access']){
                $webaccess['access'] = explode('|',$webaccess['access']);
            }

            foreach ($webaccess['access'] as $index => $val) {
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
			<option value="<?php echo $v['val'];?>"   <?php if($v['checked']){ ?>selected<?php } ?>><?php echo $v['name'];?></option>
			<?php }?>
		</select>
	</dd>
</dl>
<?php unset($webaccess); ?>
	  <?php if($data['n']=='download'){ ?>
	<?php
	$webaccess=array(
		'title'=>$word['dowloadauthority'],
		'name'=>'downloadaccess',
		'value'=>$data['list']['downloadaccess'],
		'access'=>$data['access_option']
	);
	?>
	<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$webaccess['title'] = $webaccess['title'] ? $webaccess['title'] : $word['webaccess'];
$webaccess['name'] = $webaccess['name'] ? $webaccess['name'] : 'access';
$webaccess['value'] = isset($webaccess['value']) ? $webaccess['value'] : $data['list']['access'];
$webaccess['access'] = $webaccess['access'] ? $webaccess['access'] : $data['access'];
?>
<dl>
	<dt>
		<label class='form-control-label'><?php echo $webaccess['title'];?><?php echo $webaccess['marks'];?></label>
	</dt>
	<dd class="form-group">
		<select class="form-control w-a" name='<?php echo $webaccess['name'];?>' data-checked="<?php echo $webaccess['value'];?>">
			        <?php
            $sub = is_array($webaccess['access']) ? count($webaccess['access']) : 0;
            $cycleindex = 50;

            if(!is_array($webaccess['access']) && $webaccess['access']){
                $webaccess['access'] = explode('|',$webaccess['access']);
            }

            foreach ($webaccess['access'] as $index => $val) {
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
			<option value="<?php echo $v['val'];?>"   <?php if($v['checked']){ ?>selected<?php } ?>><?php echo $v['name'];?></option>
			<?php }?>
		</select>
	</dd>
</dl>
<?php unset($webaccess); ?>
	<?php } ?>
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
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['updatetime'];?></label>
		</dt>
		<dd>
			<div class='form-group clearfix'>
				<div class="custom-control custom-radio">
					<input type="radio" id="updatetype0-<?php echo $checkbox_time;?>" name='updatetype' value='1' data-checked='<?php echo $data['list']['updatetype'];?>' required class="custom-control-input" data-target/>
					<label class="custom-control-label" for="updatetype0-<?php echo $checkbox_time;?>">当前时间</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="updatetype1-<?php echo $checkbox_time;?>" name='updatetype' value='2' class="custom-control-input" data-target="input[name='updatetime']"/>
					<label class="custom-control-label mr-2" for="updatetype1-<?php echo $checkbox_time;?>">固定时间</label>
					<input type="text" name="updatetime" value="<?php echo $data['list']['updatetime'];?>" placeholder="点击选择时间" class="form-control w-a float-none d-inline-block hide" data-plugin='datetimepicker' data-day-type="2">
				</div>
			</div>
		</dd>
	</dl>
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['addtime'];?></label>
		</dt>
		<dd>
			<div class='form-group clearfix'>
				<?php
				if($c['met_webhtm']){
					$disabled = 'disabled';
				}
				?>
				<div class="custom-control custom-radio">
					<input type="radio" id="addtype0-<?php echo $checkbox_time;?>" name='addtype' value='1' data-checked='<?php echo $data['list']['addtype'];?>' required class="custom-control-input" data-target/>
					<label class="custom-control-label" for="addtype0-<?php echo $checkbox_time;?>"><?php echo $word['releasenow'];?></label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" id="addtype1-<?php echo $checkbox_time;?>" name='addtype' value='2' class="custom-control-input" <?php echo $disabled;?> data-target="input[name='addtime']"/>
					<label class="custom-control-label mr-2" for="addtype1-<?php echo $checkbox_time;?>"><?php echo $word['timedrelease'];?></label>
					<input type="text" name="addtime" value="<?php echo $data['list']['addtime'];?>" placeholder="点击选择时间" class="form-control w-a float-none d-inline-block hide" <?php echo $disabled;?> data-plugin='datetimepicker' data-day-type="2">
				</div>
				  <?php if($c['met_webhtm']){ ?>
				<span class="text-help"><?php echo $word['tips5_v6'];?></span>
				<?php } ?>
			</div>
		</dd>
	</dl>
</div>