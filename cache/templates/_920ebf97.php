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