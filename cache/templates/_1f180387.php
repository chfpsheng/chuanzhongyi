<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<h3 class='example-title'>
	<span class='d-inline-block' style="width:155px;"><?php echo $word['parameter'];?></span>
	<button type="button" class="btn btn-outline-primary btn-paraset" data-toggle="modal" data-target=".content-para-manage-modal" data-modal-title="<?php echo $word['parmanage'];?>" data-modal-url="parameter/list/?c=parameter_admin&a=doparaset&module=<?php echo $data['n'];?>&class1=<?php echo $data['list']['class1'];?>&&class2=<?php echo $data['list']['class2'];?>&class3=<?php echo $data['list']['class3'];?>&id=<?php echo $data['list']['id'];?>" data-modal-size="xl" data-modal-fullheight="1" data-modal-oktext="" data-modal-notext="<?php echo $word['close'];?>"><?php echo $word['parmanage'];?></button>
	<button type="button" class="btn btn-outline-primary btn-content-para-refresh ml-2">
		<i class="fa-refresh mr-1"></i>
		<?php echo $word['refresh'];?>
	</button>
	<span class="text-help font-weight-normal font-size-14"><?php echo $word['relation_tips'];?></span>
</h3>
<div class="content-details-paralist" data-url="<?php echo $url['own_name'];?>c=<?php echo $data['n'];?>_admin&a=dopara&id=<?php echo $data['list']['id'];?>&hid=<?php echo $data['hid'];?>&class1=<?php echo $data['list']['class1'];?>&class2=<?php echo $data['list']['class2'];?>&class3=<?php echo $data['list']['class3'];?>"></div>
<h3 class='example-title'>
    <span class='d-inline-block' style="width:155px;"><?php echo $word['relation_data'];?></span>
    <button type="button" class="btn btn-outline-666 btn-relation" data-toggle="modal" data-target=".content-relation-manage-modal" data-modal-title="<?php echo $word['selected'];?><?php echo $word['content'];?>" data-modal-url="relation/list/?content_id=<?php echo $data['list']['id'];?>&module=<?php echo $data['n'];?>" data-modal-size="xl" data-modal-fullheight="1" data-modal-oktext="" data-modal-notext="<?php echo $word['close'];?>"><?php echo $word['relation_data_add'];?></button>
    <span class="text-help font-weight-normal font-size-14"><?php echo $word['relation_tips'];?></span>
</h3>
<div class="content-details-relationlist met-scrollbar scrollbar-grey" data-info="<?php echo $data['n'];?>|<?php echo $data['list']['id'];?>" data-url="<?php echo $url['adminurl'];?>n=relation&c=relation_admin&a=doGetRelations&content_id=<?php echo $data['list']['id'];?>&hid=<?php echo $data['hid'];?>&module=<?php echo $data['n'];?>">
    <div class="metadmin-loader py-5"><div class="text-center d-flex align-items-center"><div class="loader loader-round-circle"></div></div></div>
</div>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$editor['title']=$editor['title']?$editor['title']:$word['contentdetail'];
$editor['name']=$editor['name']?$editor['name']:'content';
$editor['marks']=isset($editor['marks'])?$editor['marks']:1;
$editor['value']=$editor['value']?$editor['value']:($data['list']?$data['list']['content']:'');
if($data['list']){
	$data['classnow']=intval($data['list']['class3'])?$data['list']['class3']:(intval($data['list']['class2'])?$data['list']['class2']:$data['list']['class1']);
}
$editor['value']=htmlspecialchars($editor['value']);
?>
  <?php if(!$editor['no_title']){ ?>
<h3 class='example-title'><?php echo $editor['title'];?>  <?php if($editor['marks']){ ?><?php echo $word['marks'];?><?php } ?>  <?php if($data['n']=='about'){ ?><a href="<?php echo $url['site_admin'];?>#/column" target="_blank" class="text-help ml-2"><?php echo $word['admin_colunmmanage_v6'];?></a><?php } ?></h3>
<?php } ?>
<dl>
	  <?php if($editor['dt']){ ?>
	<dt>
		<label class='form-control-label'><?php echo $editor['dt'];?>  <?php if($editor['marks']){ ?><?php echo $word['marks'];?><?php } ?></label>
	</dt>
	<?php } ?>
	<dd class='clearfix'>
		  <?php if($data['n']=='product'){ ?>
		<?php
		$checkbox_time=time();
		for ($i = 1; $i < 5; $i++) {
			$product_content[]=array(
				'value'=>$data['list']['content'.$i]
			);
		}
		?>
		<div class="nav nav-underline product-details-navtab position-relative" data-url="<?php echo $url['own_name'];?>c=product_admin&a=doGetColumnSeting">
			<a class="nav-link active" data-toggle="tab" href="#product-content-<?php echo $checkbox_time;?>"></a>
			        <?php
            $sub = is_array($product_content) ? count($product_content) : 0;
            $cycleindex = 50;

            if(!is_array($product_content) && $product_content){
                $product_content = explode('|',$product_content);
            }

            foreach ($product_content as $index => $val) {
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
			<?php $v['sort']=$v['_index']+1; ?>
			<a class="nav-link" data-toggle="tab" href="#product-content<?php echo $v['sort'];?>-<?php echo $checkbox_time;?>"></a>
			<?php }?>
			<button type="button" class="btn btn-outline-primary ml-2 position-absolute" style="right:0;top: 0;" data-toggle="modal" data-target=".product-details-tabset-modal" data-modal-url="ui_set/page_config/?n=column&c=index&a=doGetClassExtInfo&module=3&id=0&from=admin&classnow=<?php echo $data['classnow'];?>" data-modal-title="<?php echo $word['settings_tab'];?>" data-modal-style="z-index:1702;" data-modal-type="centered"><?php echo $word['settings_tab'];?></button>
		</div>
		<div class="tab-content mt-2 product-details-content hide">
			<div class="tab-pane fade show active" id="product-content-<?php echo $checkbox_time;?>">
				<textarea name="<?php echo $editor['name'];?>" data-plugin='editor' data-editor-y='  <?php if($editor['height']){ ?><?php echo $editor['height'];?><?php }else{ ?>500<?php } ?>' hidden></textarea>
				<script>`<?php echo $editor['value'];?>`;</script>
			</div>
			        <?php
            $sub = is_array($product_content) ? count($product_content) : 0;
            $cycleindex = 50;

            if(!is_array($product_content) && $product_content){
                $product_content = explode('|',$product_content);
            }

            foreach ($product_content as $index => $val) {
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
			$v['sort']=$v['_index']+1;
			$v['value']=htmlspecialchars($v['value']);
			?>
			<div class="tab-pane fade" id="product-content<?php echo $v['sort'];?>-<?php echo $checkbox_time;?>">
				<textarea name="content<?php echo $v['sort'];?>" data-plugin='editor' data-editor-y='  <?php if($editor['height']){ ?><?php echo $editor['height'];?><?php }else{ ?>500<?php } ?>' hidden></textarea>
				<script>`<?php echo $v['value'];?>`;</script>
			</div>
			<?php }?>
		</div>
		<?php }else{ ?>
		<textarea name="<?php echo $editor['name'];?>" data-plugin='editor' data-editor-x="<?php echo $editor['width'];?>" data-editor-y='  <?php if($editor['height']){ ?><?php echo $editor['height'];?><?php }else{ ?>500<?php } ?>' hidden></textarea>
		<script>`<?php echo $editor['value'];?>`;</script>
		  <?php if($editor['tips']){ ?>
		<span class="text-help ml-2"><?php echo $editor['tips'];?></span>
		<?php } ?>
		<?php } ?>
	</dd>
</dl>
<?php unset($editor); ?>
<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<h3 class='example-title clearfix'>
	<span class="my-1 d-inline-block" role="button" data-toggle="collapse" data-target=".<?php echo $data['n'];?>-details-seo">SEO <?php echo $word['seting'];?><i class="icon fa-angle-right ml-2"></i></span>
	<!-- <button type="button"
		class="btn btn-outline-primary btn-sm float-right mt-1 seo-ai-generate-btn"
		data-seo-selector=".<?php echo $data['n'];?>-details-seo">
		<i class="icon fa-magic mr-1"></i>AI 生成
	</button> -->
</h3>
<div class="collapse <?php echo $data['n'];?>-details-seo">
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['managertyp5'];?><?php echo $word['columnmtitle'];?></label>
		</dt>
		<dd>
			<div class='form-group clearfix'>
				<input type="text" name="ctitle" value="<?php echo $data['list']['ctitle'];?>" class="form-control mr-2">
				<span class="text-help"><?php echo $word['tips6_v6'];?></span>
			</div>
		</dd>
	</dl>
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['keywords'];?></label>
		</dt>
		<dd>
			<div class='form-group clearfix'>
				<input type="text" name="keywords" value="<?php echo $data['list']['keywords'];?>" class="form-control mr-2">
				<span class="text-help"><?php echo $word['setseoTip1'];?></span>
			</div>
		</dd>
	</dl>
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['desctext'];?></label>
		</dt>
		<dd class="clearfix">
			<textarea name="description" rows="4" class='form-control'><?php echo $data['list']['description'];?></textarea>
			<span class="text-help ml-2"><?php echo $word['tips1_v6'];?></span>
		</dd>
	</dl>
	  <?php if($data['list']['module']<>1){ ?>
	<dl>
		<dt>
			<label class='form-control-label'><abbr title="<?php echo $word['tips2_v6'];?>"><?php echo $word['tag'];?></abbr></label>
		</dt>
		<dd>
			<div class="float-left mr-2">
				<input type="text" name="tag" value="<?php echo $data['list']['tag'];?>" class="form-control mr-2"/>
			</div>
			<span class="text-help"><?php echo $word['tips3_v6'];?></span>
		</dd>
	</dl>
	<?php } ?>
	<dl>
		<dt>
			<label class='form-control-label'><?php echo $word['columnhtmlname'];?></label>
		</dt>
		<dd>
			<div class='form-group clearfix'>
				<input type="text" name="filename" value="<?php echo $data['list']['filename'];?>" class="form-control mr-2"
				data-fv-remote="true"
				data-fv-remote-url="<?php echo $url['own_name'];?>c=<?php echo $data['c'];?>&a=docheck_filename&id=<?php echo $data['list']['id'];?>"
				>
				<span class="text-help"><?php echo $word['js74'];?></span>
			</div>
		</dd>
	</dl>
</div>
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