<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<include file="pub/content_details/head"/>
<dl>
	<dt>
		<label class='form-control-label'>活动时间</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<input type="text" name="start_time" value="{$data.list.start_time}" placeholder="点击选择开始时间" class="form-control d-inline-block" style="width:190px;" data-plugin='datetimepicker' data-day-type="2">
			<span class="mx-2">至</span>
			<input type="text" name="end_time" value="{$data.list.end_time}" placeholder="点击选择结束时间" class="form-control d-inline-block" style="width:190px;" data-plugin='datetimepicker' data-day-type="2">
		</div>
		<span class="text-help">点击输入框分别选择活动的开始时间和结束时间，留空则不显示。</span>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>活动地点</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<input type="text" class="form-control" name="location" value="{$data.list.location}" placeholder="如：XX市中医院门诊楼三楼会议室">
		</div>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>是否免费</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" id="is_free1" name="is_free" value="1" data-checked='{$data.list.is_free}' class="custom-control-input">
				<label class="custom-control-label" for="is_free1">免费</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" id="is_free0" name="is_free" value="0" data-checked='{$data.list.is_free}' class="custom-control-input">
				<label class="custom-control-label" for="is_free0">收费</label>
			</div>
		</div>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>所属医馆</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<select class="form-control" name="yiguan" data-yiguan-select>
				<option value="">请选择所属医馆</option>
				<list data="$data['yiguan_option']" name="$ygu">
				<option value="{$ygu.val}" <if value="$ygu['checked']">selected</if>>{$ygu.name}</option>
				</list>
			</select>
		</div>
		<span class="text-help">选项来自「中医馆」栏目的内容；打开下拉后可在顶部输入关键字按名称筛选。如无选项请先到中医馆栏目添加内容。</span>
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
