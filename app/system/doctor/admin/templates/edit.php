<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<include file="pub/content_details/head"/>
<?php
// 排序号：数字越小越靠前；新增时（无值）默认 4（与 doctor_admin::DEFAULT_NO_ORDER、数据库列默认值一致）
$doctor_no_order = (isset($data['list']['no_order']) && $data['list']['no_order'] !== '') ? intval($data['list']['no_order']) : 4;
?>
<dl>
	<dt>
		<label class='form-control-label'>排序</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<input type="number" class="form-control" name="doctor_no_order" value="{$doctor_no_order}" step="1" placeholder="数字越小越靠前">
			<span class="text-help"><strong>数字越小排得越靠前</strong>（可填负数，如 -10 会排在 4 前面）；默认 4，留空按 4 保存。序号相同的医师按更新时间排序。<br>需要优先展示的医师，可在下方「其他设置」里勾选<strong>推荐</strong>或<strong>置顶</strong>，二者优先级都高于排序号。</span>
		</div>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>坐诊医馆</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<div style="max-width:640px;max-height:260px;overflow-y:auto;border:1px solid #e4eaec;border-radius:4px;background:#fff;padding:10px 14px;">
				<list data="$data['yiguan_option']" name="$ygu">
				<label class="d-block mb-2" style="cursor:pointer;font-weight:400;">
					<input type="checkbox" name="yiguan[]" value="{$ygu.val}" <if value="$ygu['checked']">checked</if>>
					<span class="ml-1 align-middle">{$ygu.name}</span>
				</label>
				</list>
				<if value="!$data['yiguan_option']">
				<span class="text-help">暂无选项，请先到「中医馆」栏目添加内容。</span>
				</if>
			</div>
		</div>
		<span class="text-help">可多选：勾选该医师坐诊的全部医馆，前台按此处医馆的顺序依次展示。选项来自「中医馆」栏目的内容。</span>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>擅长</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<textarea class="form-control" name="specialty" rows="6" placeholder="如：擅长中医内科常见病、多发病的辨证论治，尤以脾胃病、失眠、慢性咳嗽见长；针灸治疗颈肩腰腿痛。"><?php echo htmlspecialchars(isset($data['list']['specialty']) ? (string)$data['list']['specialty'] : '', ENT_QUOTES, 'UTF-8'); ?></textarea>
		</div>
		<span class="text-help">支持长文本，可分段换行。前台在医师详情页显示「擅长领域」区块，并用于详情页 FAQ 与结构化数据。</span>
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
