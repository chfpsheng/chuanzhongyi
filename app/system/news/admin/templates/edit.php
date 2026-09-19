<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<include file="pub/content_details/head"/>
<?php
// 来源 / 作者 与 来源链接（转载标注出处用；原创可只填作者名，留空则不显示）
$news_publisher  = isset($data['list']['publisher']) ? (string)$data['list']['publisher'] : '';
$news_source_url = isset($data['list']['source_url']) ? (string)$data['list']['source_url'] : '';
?>
<dl>
	<dt>
		<label class='form-control-label'>来源 / 作者</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<input type="text" name="news_publisher" value="{$news_publisher}" class="form-control" placeholder="如：健康时报 / 四川省中医药管理局 / 张三">
			<span class="text-help">原创可填作者或本站编辑名；<strong>转载请填原文出处名称</strong>。前台在标题下方显示「来源：XXX」，留空则不显示。</span>
		</div>
	</dd>
</dl>
<dl>
	<dt>
		<label class='form-control-label'>来源链接</label>
	</dt>
	<dd>
		<div class="form-group clearfix">
			<input type="text" name="news_source_url" value="{$news_source_url}" class="form-control" placeholder="https://原文地址">
			<span class="text-help">转载文章请填原文地址：前台「来源」会显示为可点击链接，并写入结构化数据 <code>isBasedOn</code>；留空只显示来源名称、不带链接。仅支持 http/https。</span>
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