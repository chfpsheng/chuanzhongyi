<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<div class="met-safe-set">
    <form method="POST" action="<?php echo $url['own_name'];?>c=index&a=doSaveSetup" class="info-form" data-submit-ajax="1">
        <div class="metadmin-fmbx">
            <h3 class="example-title"><?php echo $word['safety_efficiency'];?></h3>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['admin_log'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_logs" value="0" />
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['access_type'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <div class="custom-control custom-radio ">
                            <input type="radio" id="access_type1" name="access_type" value="1" class="custom-control-input" data-checked="<?php echo $c['access_type'];?>">
                            <label class="custom-control-label" for="access_type1"><?php echo $word['access_type1'];?></label>
                        </div>
                        <div class="custom-control custom-radio ">
                            <input type="radio" id="access_type2" name="access_type" value="2" class="custom-control-input">
                            <label class="custom-control-label" for="access_type2"><?php echo $word['access_type2'];?></label>
                        </div>
                    </div>
                </dd>
            </dl>
            <hr>
            <dl>
                <dt>
                    <label class='form-control-label'><?php echo $word['disableCssJs'];?></label>
                </dt>
                <dd>
                    <div class='form-group clearfix'>
                        <input type="checkbox" data-plugin="switchery" name="disable_cssjs" value='0' >
                        <span class="text-help ml-2"><?php echo $word['disableCssJsTips'];?></span>
                    </div>
                </dd>
            </dl>

            <div class="hide set-admindir">
                <hr>
                <!--后台目录-->
                <dl>
                    <dt>
                        <label class="form-control-label"><?php echo $word['setsafeadminname'];?></label>
                    </dt>
                    <dd>
                        <div class="form-group clearfix">
                            <input type="text" name="met_adminfile" class="form-control" />
                            <span class="text-help ml-2">
                                <?php echo $word['setsafeadminname1c'];?>
                                <a href="<?php echo $url['admin_site'];?>" target="_blank"><?php echo $url['admin_site'];?></a>
                            </span>

                        </div>
                    </dd>
                </dl>
                <!--删除安装文件-->
                <dl class="delete-file" style="display: none;">
                    <dt>
                        <label class="form-control-label"><?php echo $word['setsafeinstall'];?></label>
                    </dt>
                    <dd>
                        <div class="form-group clearfix">
                            <button type="button" class="btn btn-primary btn-delete-install"><?php echo $word['delete'];?></button>
                            <span class="text-help ml-2"><?php echo $word['setsafeupdate1'];?></span>
                        </div>
                    </dd>
                </dl>
            </div>

            <!--产品模块视频播放控制-->
            <h3 class="example-title"><?php echo $word['video_switch'];?>
                <span class="text-help ml-2 font-size-14 font-weight-normal"><?php echo $word['auto_play_tips'];?>
                </span>
            </h3>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['auto_show'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_auto_show" value="0"/>
                        <span class="text-help ml-2"><?php echo $word['auto_play_tips1'];?></span>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['auto_play_pc'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_auto_play_pc" value="0"/>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['auto_play_mobile'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_auto_play_mobile" value="0"/>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['auto_close'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_auto_close" value="0"/>
                    </div>
                </dd>
            </dl>
            <!--/产品模块视频播放控制-->
            <!--验证码-->
            <h3 class="example-title"><?php echo $word['logincode'];?></h3>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['setsafemember'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_memberlogin_code" value="0" />
                        <span class="text-help ml-2"><?php echo $word['upfiletips24'];?></span>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['setsafeadmin'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_login_code" value="0" />
                        <span class="text-help ml-2"><?php echo $word['loginadmin'];?></span>
                    </div>
                </dd>
            </dl>
            <!--/验证码-->
            <!--上传设置-->
            <h3 class="example-title"><?php echo $word['unitytxt_70'];?></h3>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['close'];?><?php echo $word['upfileFile'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_upload_close" value="0" />
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['setimgrename'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_img_rename" value="0" />
                        <span class="text-help ml-2"><?php echo $word['setimgrename1'];?>，<?php echo $word['setimgrename2'];?></span>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['setbasicUploadMax'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="text" name="met_file_maxsize" class="form-control w-auto" />
                        <span class="text-help ml-2"><?php echo $word['systips15'];?></span>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['setbasicEnableFormat'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <textarea name="met_file_format" type="text" rows="5" class="form-control mr-2"></textarea>
                        <span class="text-help ml-2"><?php echo $word['setbasicTip5'];?></span>
                    </div>
                </dd>
            </dl>
            <!--/上传设置-->
            <!--敏感字符过滤-->
            <h3 class="example-title"><?php echo $word['fdincSlash'];?></h3>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['fdincSlash'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <textarea name="met_fd_word" type="text" rows="5" class="form-control mr-2"></textarea>
                        <span class="text-help ml-2"><?php echo $word['setbasicTip5'];?></span>
                    </div>
                </dd>
            </dl>
            <!--/敏感字符过滤-->
            <!--信息安全声明-->
            <h3 class="example-title"><?php echo $word['info_security_statement'];?></h3>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['info_security_statement_switch'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="checkbox" data-plugin="switchery" name="met_info_security_statement_open" value="0" />
                        <span class="text-help ml-2"><?php echo $word['info_security_statement_tips1'];?></span>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['info_security_statement_title'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="text" name="met_info_security_statement_title" class="form-control" />
                        <span class="text-help ml-2"><?php echo $word['info_security_statement_tips2'];?></span>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>
                    <label class="form-control-label"><?php echo $word['info_security_statement_modal_title'];?></label>
                </dt>
                <dd>
                    <div class="form-group clearfix">
                        <input type="text" name="met_info_security_statement_modal_title" class="form-control" />
                    </div>
                </dd>
            </dl>
            <?php
            $editor=array(
                'dt'=>$word['info_security_statement_content'],
                'no_title'=>1,
                'name'=>'met_info_security_statement_content',
                'height'=>100
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
            <!--/信息安全声明-->
            <?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
$submit_text=$submit_text?$submit_text:$word['Submit'];
?>
<dl>
	  <?php if($submit_dt){ ?><dt>&nbsp;</dt><?php } ?>
	<dd class="<?php echo $submit_wrapper_class;?>">
		<button type="submit" class='btn btn-primary px-4 <?php echo $submit_class;?>'><?php echo $submit_text;?></button>
	</dd>
</dl>
<?php unset($submit_wrapper_class);unset($submit_class);unset($submit_dt); ?>
        </div>
    </form>
</div>