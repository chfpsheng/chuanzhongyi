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
<?php
// 「所属地区」二级下拉（四川省 → 市/州 → 区/县），与中医馆模块保持一致的用法。
// 数据由 shaoer_admin::sichuan_region_options() 注入 $data['sichuan_region']，
// 保存到 met_shaoer.region_city / met_shaoer.region_district。
// 使用系统内置 select-linkage 组件，后台 metCommon() 会自动初始化，无需额外引入 JS。
if (!empty($data['sichuan_region']['citylist_json'])) {
    $met_region = $data['sichuan_region'];
    $met_region_city = isset($data['list']['region_city']) ? (string)$data['list']['region_city'] : '';
    $met_region_district = isset($data['list']['region_district']) ? (string)$data['list']['region_district'] : '';
?>
<dl>
    <dt>
        <label class='form-control-label'>所属地区</label>
    </dt>
    <dd>
        <div class='form-group clearfix'>
            <div data-plugin='select-linkage' data-select-url="json" data-required="0" data-value_key="value" class="clearfix float-left mr-3">
                <textarea class="select-linkage-data" hidden><?php echo htmlspecialchars($met_region['citylist_json'], ENT_QUOTES, 'UTF-8'); ?></textarea>
                <?php // 省份固定为四川省，隐藏该级下拉，只保留 市 → 区 两级 ?>
                <span style="display:none"><select class="prov" data-checked="<?php echo htmlspecialchars($met_region['province'], ENT_QUOTES, 'UTF-8'); ?>"></select></span>
                <?php // 同名隐藏域兜底：下拉被置为 disabled 时仍能提交空值，保证可清空 ?>
                <input type="hidden" name="region_city" value="">
                <select name="region_city" class="form-control mr-1 w-a city" data-checked="<?php echo htmlspecialchars($met_region_city, ENT_QUOTES, 'UTF-8'); ?>"></select>
                <input type="hidden" name="region_district" value="">
                <select name="region_district" class="form-control mr-1 w-a dist" data-checked="<?php echo htmlspecialchars($met_region_district, ENT_QUOTES, 'UTF-8'); ?>"></select>
            </div>
            <span class="text-help">仅限四川省内 21 个地级行政区及其对应区/县/县级市，用于按地区检索活动。</span>
        </div>
    </dd>
</dl>
<?php } ?>
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
