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