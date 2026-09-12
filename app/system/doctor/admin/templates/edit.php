<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<include file="pub/content_details/head"/>
<dl>
	<dt>
		<label class='form-control-label'>坐诊医馆</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<select class="form-control" name="yiguan" data-yiguan-select>
				<option value="">请选择坐诊医馆</option>
				<list data="$data['yiguan_option']" name="$ygu">
				<option value="{$ygu.val}" <if value="$ygu['checked']">selected</if>>{$ygu.name}</option>
				</list>
			</select>
		</div>
		<span class="text-help">选项来自「中医馆」栏目的内容；打开下拉后可在顶部输入关键字按名称筛选。如无选项请先到中医馆栏目添加内容。</span>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>所属医院</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<input type="text" class="form-control" name="hospital" value="{$data.list.hospital}" placeholder="如：XX市中医院">
		</div>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>挂号费</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<?php $doctor_fee = isset($data['list']['fee']) && $data['list']['fee'] > 0 ? ($data['list']['fee'] + 0) : ''; ?>
			<input type="number" class="form-control" name="fee" value="{$doctor_fee}" min="0" step="0.01" placeholder="请输入挂号费金额">
			<span class="text-help">单位：元，只能填写数字，留空表示不显示。</span>
		</div>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>毕业院校</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<input type="text" class="form-control" name="school" value="{$data.list.school}" placeholder="如：北京中医药大学">
		</div>
	</dd>
</dl>
<input type="hidden" name="imgurl_l" value="{$data.list.imgurl}">
<input type="hidden" name="imgurls_l" value="{$data.list.imgurls}">
<include file="pub/content_details/content_seo_other"/>
<?php
$upload = array(
    'title' => $word['coverimg'],
    'name' => 'imgurl',
    'value' => $data['list']['imgurl'],
    'tips' => $word['tips7_v6']
);
?>
<include file="pub/content_details/upload"/>
	</div>
</form>