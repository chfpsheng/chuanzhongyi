<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$checkbox_time = time();
$data = $data['handle'];
$data['list']['thumb_list'] = explode('|', $data['list']['thumb_list']);
$data['list']['thumb_list_default'] = explode('|', $data['list']['thumb_list_default']);
$data['list']['thumb_detail'] = explode('|', $data['list']['thumb_detail']);
$data['list']['thumb_detail_default'] = explode('|', $data['list']['thumb_detail_default']);
?>
<form method="POST" action="<?php echo $url['own_name'];?>c=index&a=doEditorsave" class='column-details-form' data-validate_order=".column-details-form" data-submit-ajax='1' enctype="multipart/form-data">
	<input type="hidden" name='id' value="<?php echo $data['list']['id'];?>" />
	<input type="hidden" name="wap_ok" value="<?php echo $data['list']['wap_ok'];?>">
	<input type="hidden" name="no_order" value="<?php echo $data['list']['no_order'];?>">
	<div class="metadmin-fmbx">
        <!--权限设置-->
		<h3 class='example-title'><?php echo $word['upfiletips7'];?></h3>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnname'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="text" name="name" value="<?php echo $data['list']['name'];?>" required class="form-control">
				</div>
				<div class="border p-2 rounded-lg">
					<div class="clearfix">
						<span class="text-help text-content float-left mr-1"><?php echo $word['text_size'];?><?php echo $word['marks'];?></span>
						<input type="text" name="text_size" value="<?php echo $data['list']['text_size'];?>" data-plugin="select-fontsize" class="form-control d-inline-block mr-2" style="width:80px;">
						<span class="text-help text-content float-left mr-1"><?php echo $word['text_color'];?><?php echo $word['marks'];?></span>
						<input type="text" name="text_color" value="<?php echo $data['list']['text_color'];?>" data-plugin="minicolors" class="form-control w-a d-inline-block">
					</div>
					<div class="text-help border-top d-block"><?php echo $word['column_style_tips'];?></div>
				</div>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnnav'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<div class="custom-control custom-radio">
						<input type="radio" id="nav0-<?php echo $checkbox_time;?>" name='nav' value='0' data-checked='<?php echo $data['list']['nav'];?>' required class="custom-control-input"/>
						<label class="custom-control-label" for="nav0-<?php echo $checkbox_time;?>"><?php echo $word['columnnav1'];?></label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="nav1-<?php echo $checkbox_time;?>" name='nav' value='1' class="custom-control-input"/>
						<label class="custom-control-label" for="nav1-<?php echo $checkbox_time;?>"><?php echo $word['columnnav2'];?></label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="nav2-<?php echo $checkbox_time;?>" name='nav' value='2' class="custom-control-input"/>
						<label class="custom-control-label" for="nav2-<?php echo $checkbox_time;?>"><?php echo $word['columnnav3'];?></label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="nav3-<?php echo $checkbox_time;?>" name='nav' value='3' class="custom-control-input"/>
						<label class="custom-control-label" for="nav3-<?php echo $checkbox_time;?>"><?php echo $word['columnnav4'];?></label>
					</div>
				</div>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnnewwindow'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="new_windows1-<?php echo $checkbox_time;?>" name='new_windows' value='1' data-checked='<?php echo $data['list']['new_windows'];?>' required class="custom-control-input"/>
						<label class="custom-control-label" for="new_windows1-<?php echo $checkbox_time;?>"><?php echo $word['yes'];?></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="new_windows0-<?php echo $checkbox_time;?>" name='new_windows' value='0' class="custom-control-input"/>
						<label class="custom-control-label" for="new_windows0-<?php echo $checkbox_time;?>"><?php echo $word['no'];?></label>
					</div>
				</div>
			</dd>
		</dl>
		  <?php if($data['list']['module']>=2 && $data['list']['module']<=6){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columncontentorder'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					  <?php if($data['list']['module']<=6){ ?>
					<div class="custom-control custom-radio">
						<input type="radio" id="list_order1-<?php echo $checkbox_time;?>" name='list_order' value='1' required class="custom-control-input"/>
						<label class="custom-control-label" for="list_order1-<?php echo $checkbox_time;?>"><?php echo $word['updatetime'];?></label>
					</div>
					<?php } ?>
					<div class="custom-control custom-radio">
						<input type="radio" id="list_order2-<?php echo $checkbox_time;?>" name='list_order' value='2' data-checked='<?php echo $data['list']['list_order'];?>' class="custom-control-input"/>
						<label class="custom-control-label" for="list_order2-<?php echo $checkbox_time;?>"><?php echo $word['addtime'];?></label>
					</div>
					  <?php if($data['list']['module']<=6){ ?>
					<div class="custom-control custom-radio">
						<input type="radio" id="list_order3-<?php echo $checkbox_time;?>" name='list_order' value='3' class="custom-control-input"/>
						<label class="custom-control-label" for="list_order3-<?php echo $checkbox_time;?>"><?php echo $word['hits'];?></label>
					</div>
					<?php } ?>
					<div class="custom-control custom-radio">
						<input type="radio" id="list_order4-<?php echo $checkbox_time;?>" name='list_order' value='4' class="custom-control-input"/>
						<label class="custom-control-label" for="list_order4-<?php echo $checkbox_time;?>">ID <?php echo $word['columnReverseSort'];?></label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="list_order5-<?php echo $checkbox_time;?>" name='list_order' value='5' class="custom-control-input"/>
						<label class="custom-control-label" for="list_order5-<?php echo $checkbox_time;?>">ID <?php echo $word['columnaddOrder'];?></label>
					</div>
				</div>
			</dd>
		</dl>
		<?php } ?>
		  <?php if($data['list']['module']==1){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnshow'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="isshow1-<?php echo $checkbox_time;?>" name='isshow' value='1' data-checked='<?php echo $data['list']['isshow'];?>' required class="custom-control-input"/>
						<label class="custom-control-label" for="isshow1-<?php echo $checkbox_time;?>"><?php echo $word['columnmallow'];?></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="isshow0-<?php echo $checkbox_time;?>" name='isshow' value='0' class="custom-control-input"/>
						<label class="custom-control-label" for="isshow0-<?php echo $checkbox_time;?>"><?php echo $word['columnmnotallow'];?></label>
					</div>
				</div>
			</dd>
		</dl>
		<?php } ?>
		  <?php if($data['list']['if_in']==1){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnhref'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="text" name="out_url" value="<?php echo $data['list']['out_url'];?>" class="form-control">
					<span class="text-help"><?php echo $word['columntip7'];?></span>
				</div>
			</dd>
		</dl>
		<?php } ?>

        <!--权限设置-->
        <h3 class='example-title'><?php echo $word['unitytxt_33'];?></h3>
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
        <dl>
            <dt>
                <label class='form-control-label'><?php echo $word['displaytype'];?></label>
            </dt>
            <dd>
                <div class='form-group clearfix'>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="display0-<?php echo $checkbox_time;?>" name='display' value='0' data-checked='<?php echo $data['list']['display'];?>' required class="custom-control-input"/>
                        <label class="custom-control-label" for="display0-<?php echo $checkbox_time;?>"><?php echo $word['yes'];?></label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="display1-<?php echo $checkbox_time;?>" name='display' value='1' class="custom-control-input"/>
                        <label class="custom-control-label" for="display1-<?php echo $checkbox_time;?>"><?php echo $word['no'];?></label>
                    </div>
                </div>
            </dd>
        </dl>

        <!--seo-->
		<h3 class='example-title'><?php echo $word['columnSEO'];?></h3>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnctitle'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="text" name="ctitle" value="<?php echo $data['list']['ctitle'];?>" class="form-control">
					<span class="text-help"><?php echo $word['ctitleinfo'];?></span>
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
					<span class="text-help"><?php echo $word['keywordsinfo'];?></span>
				</div>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['description'];?></label>
			</dt>
			<dd>
				<textarea name="description" rows="3" class='form-control'><?php echo $data['list']['description'];?></textarea>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnhtmlname'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="text" name="filename" value="<?php echo $data['list']['filename'];?>" data-fv-remote="true" data-fv-remote-url="<?php echo $url['own_name'];?>c=<?php echo $data['c'];?>&a=doCheckFilename&id=<?php echo $data['list']['id'];?>" class="form-control mr-2">
					<span class="text-help d-block float-left"><?php echo $word['columntip14'];?></span>
				</div>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnnofollow'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<div class="custom-control custom-checkbox custom-control-inline">
						<input type="checkbox" id="nofollow1-<?php echo $checkbox_time;?>" name='nofollow' value='1' data-checked='<?php echo $data['list']['nofollow'];?>' class="custom-control-input"/>
						<label class="custom-control-label" for="nofollow1-<?php echo $checkbox_time;?>"><?php echo $word['columnmallow'];?></label>
					</div>
					<span class="text-help"><?php echo $word['columnnofollowinfo'];?></span>
				</div>
			</dd>
		</dl>

        <!--其它设置-->
		<h3 class='example-title'><?php echo $word['columnnamemarkinfo'];?></h3>
        <!--栏目自定义样式-->
        <dl>
            <dt>
                <label class='form-control-label'><?php echo $word['columnstyle'];?></label>
            </dt>
            <dd>
                <div class='form-group clearfix'>
                    <select class="form-control w-a" name='style_type' data-checked="<?php echo $data['list']['style_type'];?>">
                                <?php
            $sub = is_array($data['style_type_list']) ? count($data['style_type_list']) : 0;
            $cycleindex = 50;

            if(!is_array($data['style_type_list']) && $data['style_type_list']){
                $data['style_type_list'] = explode('|',$data['style_type_list']);
            }

            foreach ($data['style_type_list'] as $index => $val) {
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
                </div>
            </dd>
        </dl>

		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnmark'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="text" name="index_num" value="<?php echo $data['list']['index_num'];?>" class="form-control" data-fv-integer="true">
					<span class="text-help"><?php echo $word['columnexplain7'];?></span>
				</div>
			</dd>
		</dl>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['columnnamemark'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="text" name="namemark" value="<?php echo $data['list']['namemark'];?>" class="form-control">
				</div>
			</dd>
		</dl>
		<?php
		$upload=array(
			'title'=>$word['columnImg1'],
			'name'=>'indeximg',
			'value'=>$data['list']['indeximg']
		);
		?>
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<dl>
	  <?php if(!$upload['no_title']){ ?>
	<dt>
		<label class='form-control-label'>
			  <?php if($upload['required']){ ?><span class="text-danger">*</span><?php } ?>
			<?php echo $upload['title'];?>
		</label>
	</dt>
	<?php } ?>
	<dd>
		<div class='form-group clearfix'>
			<div class="d-inline-block file-input-wrapper   <?php if(!$upload['auto_w']){ ?>fixw<?php } ?> mr-2">
				<input type="file" name="<?php echo $upload['name'];?>" value="<?php echo $upload['value'];?>"
				data-plugin='fileinput'
				  <?php if($upload['url']){ ?>data-url="<?php echo $upload['url'];?>"<?php } ?>
				  <?php if($upload['required']){ ?>data-filerequired='1' data-notEmpty-message="<?php echo $word['js15'];?>"<?php } ?>
				  <?php if($upload['nopreview']){ ?>data-drop-zone-enabled="false"<?php } ?>
				  <?php if($upload['preview_class']){ ?>data-preview-class='<?php echo $upload['preview_class'];?>'<?php } ?>
				  <?php if($upload['noprogress']){ ?>data-noprogress='1'<?php } ?>
				  <?php if($upload['noimage']){ ?>data-noimage='1'<?php } ?>
				  <?php if($upload['prev_input']){ ?>data-prev-input='1'<?php } ?>
				  <?php if($upload['size']){ ?>data-size='1'<?php } ?>
				  <?php if($upload['multiple']){ ?>multiple<?php } ?>
				  <?php if($upload['count']){ ?>data-fileinput-maxfilecount='<?php echo $upload['count'];?>'<?php } ?>
				  <?php if($upload['delimiter']){ ?>data-delimiter='<?php echo $upload['delimiter'];?>'<?php } ?>
				  <?php if($upload['type']=='file'){ ?>
				accept="*"
				<?php }else if($upload['type']=='image' || !$upload['type']){ ?>
				accept="image/*"
				<?php }else{ ?>
				accept="<?php echo $upload['type'];?>"
				<?php } ?>
				  <?php if($upload['format']){ ?>data-format="<?php echo $upload['format'];?>"<?php } ?>
				  <?php if($upload['callback']){ ?>data-callback="<?php echo $upload['callback'];?>"<?php } ?>
				  <?php if($upload['attr']){ ?><?php echo $upload['attr'];?><?php } ?>
				>
			</div>
			  <?php if($upload['tips']){ ?>
			<span class="text-help"><?php echo $upload['tips'];?></span>
			<?php } ?>
		</div>
		  <?php if($data['n']=='product' && $upload['name']=='imgurl'){ ?>
		<div class="mb-2">
			<button type="button" class="btn btn-primary" data-target=".product-video-collapse" data-toggle="collapse"><?php echo $word['show_video'];?><i class="icon fa-caret-right ml-2"></i></button>
			<a href="<?php echo $url['site_admin'];?>#/safe/?head_tab_active=0" class="btn btn-outline-primary ml-2" target="_blank"><?php echo $word['video_switch'];?></a>
		</div>
		<?php $data['list']['video']=htmlspecialchars($data['list']['video']); ?>
		<div class="collapse product-video-collapse">
			<textarea name="video" data-plugin='editor' data-editor-y='200' hidden></textarea>
			<script>`<?php echo $data['list']['video'];?>`;</script>
			<span class="text-help ml-1"><?php echo $word['show_video_tips'];?></span>
		</div>
		<?php } ?>
	</dd>
</dl>
<?php unset($upload); ?>
		<?php
		$upload=array(
			'title'=>$word['columnImg2'],
			'name'=>'columnimg',
			'value'=>$data['list']['columnimg']
		);
		?>
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<dl>
	  <?php if(!$upload['no_title']){ ?>
	<dt>
		<label class='form-control-label'>
			  <?php if($upload['required']){ ?><span class="text-danger">*</span><?php } ?>
			<?php echo $upload['title'];?>
		</label>
	</dt>
	<?php } ?>
	<dd>
		<div class='form-group clearfix'>
			<div class="d-inline-block file-input-wrapper   <?php if(!$upload['auto_w']){ ?>fixw<?php } ?> mr-2">
				<input type="file" name="<?php echo $upload['name'];?>" value="<?php echo $upload['value'];?>"
				data-plugin='fileinput'
				  <?php if($upload['url']){ ?>data-url="<?php echo $upload['url'];?>"<?php } ?>
				  <?php if($upload['required']){ ?>data-filerequired='1' data-notEmpty-message="<?php echo $word['js15'];?>"<?php } ?>
				  <?php if($upload['nopreview']){ ?>data-drop-zone-enabled="false"<?php } ?>
				  <?php if($upload['preview_class']){ ?>data-preview-class='<?php echo $upload['preview_class'];?>'<?php } ?>
				  <?php if($upload['noprogress']){ ?>data-noprogress='1'<?php } ?>
				  <?php if($upload['noimage']){ ?>data-noimage='1'<?php } ?>
				  <?php if($upload['prev_input']){ ?>data-prev-input='1'<?php } ?>
				  <?php if($upload['size']){ ?>data-size='1'<?php } ?>
				  <?php if($upload['multiple']){ ?>multiple<?php } ?>
				  <?php if($upload['count']){ ?>data-fileinput-maxfilecount='<?php echo $upload['count'];?>'<?php } ?>
				  <?php if($upload['delimiter']){ ?>data-delimiter='<?php echo $upload['delimiter'];?>'<?php } ?>
				  <?php if($upload['type']=='file'){ ?>
				accept="*"
				<?php }else if($upload['type']=='image' || !$upload['type']){ ?>
				accept="image/*"
				<?php }else{ ?>
				accept="<?php echo $upload['type'];?>"
				<?php } ?>
				  <?php if($upload['format']){ ?>data-format="<?php echo $upload['format'];?>"<?php } ?>
				  <?php if($upload['callback']){ ?>data-callback="<?php echo $upload['callback'];?>"<?php } ?>
				  <?php if($upload['attr']){ ?><?php echo $upload['attr'];?><?php } ?>
				>
			</div>
			  <?php if($upload['tips']){ ?>
			<span class="text-help"><?php echo $upload['tips'];?></span>
			<?php } ?>
		</div>
		  <?php if($data['n']=='product' && $upload['name']=='imgurl'){ ?>
		<div class="mb-2">
			<button type="button" class="btn btn-primary" data-target=".product-video-collapse" data-toggle="collapse"><?php echo $word['show_video'];?><i class="icon fa-caret-right ml-2"></i></button>
			<a href="<?php echo $url['site_admin'];?>#/safe/?head_tab_active=0" class="btn btn-outline-primary ml-2" target="_blank"><?php echo $word['video_switch'];?></a>
		</div>
		<?php $data['list']['video']=htmlspecialchars($data['list']['video']); ?>
		<div class="collapse product-video-collapse">
			<textarea name="video" data-plugin='editor' data-editor-y='200' hidden></textarea>
			<script>`<?php echo $data['list']['video'];?>`;</script>
			<span class="text-help ml-1"><?php echo $word['show_video_tips'];?></span>
		</div>
		<?php } ?>
	</dd>
</dl>
<?php unset($upload); ?>
		<?php
		$iconset=array(
			'title'=>$word['column_littleicon_v6'],
			'name'=>'icon',
			'value'=>$data['list']['icon']
		);
		?>
		<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<dl>
	<dt>
		<label class='form-control-label'><?php echo $iconset['title'];?></label>
	</dt>
	<dd>
		<div class='form-group clearfix'>
			<input type="hidden" name="<?php echo $iconset['name'];?>" value="<?php echo $iconset['value'];?>" data-plugin="iconset" class="form-control">
		</div>
	</dd>
</dl>
<?php unset($iconset); ?>
		  <?php if($data['list']['module']>=2 && $data['list']['module']<=6){ ?>
		<?php $data['list']['list_length']=$data['list']['list_length']?$data['list']['list_length']:''; ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['unitytxt_42'];?></label>
			</dt>
			<dd>
				<div class='form-group clearfix'>
					<input type="number" min="1" max="9999" name="list_length" value="<?php echo $data['list']['list_length'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['list']['list_length_default'];?>" class="form-control w-a text-center">
				</div>
			</dd>
		</dl>
		<?php } ?>
		  <?php if($data['list']['module']==2 || $data['list']['module']==3 || $data['list']['module']==5){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['thumb_size_list'];?></label>
			</dt>
			<dd class="form-group">
				<input type="number" min="0" max="1500" name="thumb_list_x" value="<?php echo $data['list']['thumb_list']['0'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['list']['thumb_list_default']['0'];?>" class="form-control w-a text-center">
				<span class="float-left text-help text-muted mx-2">x</span>
				<input type="number" min="0" max="1000" name="thumb_list_y" value="<?php echo $data['list']['thumb_list']['1'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['list']['thumb_list_default']['1'];?>" class="form-control w-a text-center">
				<span class="text-help ml-2"><?php echo $word['setimgWidth'];?>x<?php echo $word['setimgHeight'];?>(<?php echo $word['setimgPixel'];?>)</span>
			</dd>
		</dl>
		  <?php if($data['list']['module']<>2){ ?>
		<dl>
			<dt>
				<label class='form-control-label'><?php echo $word['page_for_details'];?> <?php echo $word['modimgurls'];?> <?php echo $word['wapdimensionalsize'];?></label>
			</dt>
			<dd class="form-group">
				<input type="number" min="0" max="1500" name="thumb_detail_x" value="<?php echo $data['list']['thumb_detail']['0'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['list']['thumb_detail_default']['0'];?>" class="form-control w-a text-center">
				<span class="float-left text-help text-muted mx-2">x</span>
				<input type="number" min="0" max="1000" name="thumb_detail_y" value="<?php echo $data['list']['thumb_detail']['1'];?>" placeholder="<?php echo $word['default_values'];?><?php echo $word['marks'];?><?php echo $data['list']['thumb_detail_default']['1'];?>" class="form-control w-a text-center">
				<span class="text-help ml-2"><?php echo $word['setimgWidth'];?>x<?php echo $word['setimgHeight'];?>(<?php echo $word['setimgPixel'];?>)</span>
			</dd>
		</dl>
		<?php } ?>
		<?php } ?>
		  <?php if($data['list']['module']>=2 && $data['list']['module']<=5){ ?>
		<?php
		$editor=array(
			'title'=>$word['columnmappend'],
			'height'=>150
		);
		?>
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
		<?php } ?>
		<dl>
            <dt>
                <label class='form-control-label'><?php echo $word['column_other_info'];?></label>
            </dt>
            <dd>
                <input type="text" name="other_info" value="<?php echo $data['list']['other_info'];?>" class="form-control">
                <span class="text-help ml-2"><?php echo $word['banner_needtempsupport_v6'];?></span>
            </dd>
        </dl>
        <dl>
            <dt>
                <label class='form-control-label'><?php echo $word['column_custom_info'];?></label>
            </dt>
            <dd>
                <textarea name="custom_info" rows="3" class='form-control'><?php echo $data['list']['custom_info'];?></textarea>
                <span class="text-help ml-2"><?php echo $word['banner_needtempsupport_v6'];?></span>
            </dd>
        </dl>
	</div>
</form>