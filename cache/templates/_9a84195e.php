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