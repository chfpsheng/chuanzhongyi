<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.
defined('IN_MET') or exit('No permission');
?>
<include file="pub/content_details/head"/>
<?php
// 中医馆栏目（class1 = 104）才显示「所属地区」二级下拉（四川省 → 市/州 → 区/县）。
// 数据由 product_admin::sichuan_region_options() 注入 $data['sichuan_region']，
// 保存到 met_product.region_city / met_product.region_district。
//
// 这里使用系统内置的 select-linkage 组件（public/third-party/select-linkage/jquery.cityselect.js），
// 与 job 模块 position_edit.php、后台公共表单 content_details/head.php 用法一致：
// 后台在内容加载完成后会调用 metCommon() 自动初始化 [data-plugin="select-linkage"]，
// 并负责与 met-select 下拉皮肤的联动，因此不需要额外引入 JS。
if (!empty($data['is_yiguan']) && !empty($data['sichuan_region']['citylist_json'])) {
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
                <?php // 兜底：组件在未选择上级时会把下拉置为 disabled，此时表单不会提交该字段，
                      // 因此在每个下拉之前放一个同名隐藏域，保证清空操作能真正提交空值（同名取后提交的值） ?>
                <input type="hidden" name="region_city" value="">
                <select name="region_city" class="form-control mr-1 w-a city" data-checked="<?php echo htmlspecialchars($met_region_city, ENT_QUOTES, 'UTF-8'); ?>"></select>
                <input type="hidden" name="region_district" value="">
                <select name="region_district" class="form-control mr-1 w-a dist" data-checked="<?php echo htmlspecialchars($met_region_district, ENT_QUOTES, 'UTF-8'); ?>"></select>
            </div>
            <span class="text-help">仅限四川省内 21 个地级行政区及其对应区/县/县级市。</span>
        </div>
    </dd>
</dl>
<?php
// 中医馆结构化字段：擅长项目 / 出诊时间 / 是否医保 / 预约方式
// 保存到 met_product.specialty / visit_time / insurance / booking，前台用于信息栏展示与结构化数据
$met_specialty  = isset($data['list']['specialty']) ? (string)$data['list']['specialty'] : '';
$met_visit_time = isset($data['list']['visit_time']) ? (string)$data['list']['visit_time'] : '';
$met_insurance  = isset($data['list']['insurance']) ? intval($data['list']['insurance']) : 2;
$met_booking    = isset($data['list']['booking']) ? (string)$data['list']['booking'] : '';
?>
<dl>
    <dt>
        <label class='form-control-label'>擅长项目</label>
    </dt>
    <dd>
        <div class="form-group clearfix">
            <input type="text" class="form-control" name="specialty" value="<?php echo htmlspecialchars($met_specialty, ENT_QUOTES, 'UTF-8'); ?>" placeholder="如：中医内科,针灸推拿,小儿推拿,脾胃调理">
        </div>
        <span class="text-help">多个项目用英文逗号分隔，前台会按标签展示，并输出到结构化数据。</span>
    </dd>
</dl>
<dl>
    <dt>
        <label class='form-control-label'>出诊时间</label>
    </dt>
    <dd>
        <div class="form-group clearfix">
            <input type="text" class="form-control" name="visit_time" value="<?php echo htmlspecialchars($met_visit_time, ENT_QUOTES, 'UTF-8'); ?>" placeholder="如：周一至周日 09:00-18:00（节假日不休）">
        </div>
        <span class="text-help">填写门急诊/挂号时间，会输出为结构化数据中的营业时间。</span>
    </dd>
</dl>
<dl>
    <dt>
        <label class='form-control-label'>是否医保</label>
    </dt>
    <dd>
        <div class="form-group clearfix">
            <select class="form-control" name="insurance">
                <option value="2" <?php echo $met_insurance === 2 ? 'selected' : ''; ?>>未标注</option>
                <option value="1" <?php echo $met_insurance === 1 ? 'selected' : ''; ?>>支持医保</option>
                <option value="0" <?php echo $met_insurance === 0 ? 'selected' : ''; ?>>不支持医保</option>
            </select>
        </div>
        <span class="text-help">选择后前台会明确显示，并用于详情页 FAQ 与结构化数据。</span>
    </dd>
</dl>
<dl>
    <dt>
        <label class='form-control-label'>预约方式</label>
    </dt>
    <dd>
        <div class="form-group clearfix">
            <input type="text" class="form-control" name="booking" value="<?php echo htmlspecialchars($met_booking, ENT_QUOTES, 'UTF-8'); ?>" placeholder="如：电话预约 / 微信公众号放号 / 现场挂号">
        </div>
    </dd>
</dl>
<?php } ?>
<input type="hidden" name="imgurl_l" value="{$data.list.imgurl}">
<if value="$data['displayimgs']"></div></if>
<?php
$upload = array(
    'title' => $word['displayimg'],
    'name' => 'imgurl',
    'value' => $data['list']['imgurl_all'],
    'multiple' => 1,
    'tips' => $word['tips11_v6'],
    'size' => 1,
    'delimiter' => '|'
);
?>
<include file="pub/content_details/upload"/>
<if value="$data['displayimgs']"><div hidden></if>
<include file="pub/content_details/content_seo_other"/>
<if value="$data['displayimgs']"></div></if>
</div>
</form>