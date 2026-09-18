<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 「按地区找中医馆」链接组（列表页、网站地图、页脚复用）
 * 只展示已发布且已标注地区的区/县，按条目数从多到少排列。
 * 中医馆列表页自身已有该入口时（$_rl_skip_list 未设置且当前是产品列表页）自动不重复输出。
 */
$_rl_limit = isset($_rl_limit) ? intval($_rl_limit) : 12;
$_rl_class1 = isset($_rl_class1) ? intval($_rl_class1) : 0;
if (!$_rl_class1) {
    // 默认取「中医馆」栏目（module=3 的一级栏目），避免在资讯等活动页按错栏目过滤
    // 注意：米拓模板编译器会把花括号加美元符的变量写法当成输出标签，PHP 里一律用字符串拼接
    $_rl_col = DB::get_one("SELECT id FROM " . $_M['table']['column'] . " WHERE lang='" . $_M['lang'] . "' AND module=3 AND bigclass=0 ORDER BY no_order ASC, id ASC LIMIT 1");
    $_rl_class1 = $_rl_col && !empty($_rl_col['id']) ? intval($_rl_col['id']) : 0;
}
$_rl_where = "lang='" . $_M['lang'] . "' AND recycle=0 AND displaytype!=-1 AND region_city<>''";
if ($_rl_class1) {
    $_rl_where .= " AND class1='" . $_rl_class1 . "'";
}
$_rl_rows = DB::get_all("SELECT region_city, region_district, COUNT(*) AS cnt FROM " . $_M['table']['product'] . " WHERE " . $_rl_where . " GROUP BY region_city, region_district ORDER BY cnt DESC, region_city ASC");
$_rl_items = array();
foreach ((array)$_rl_rows as $_rl_r) {
    $_rl_d = trim($_rl_r['region_district']);
    if ($_rl_d === '') {
        continue;
    }
    $_rl_items[] = array(
        'name' => trim($_rl_r['region_city']) . $_rl_d,
        'url'  => $_M['url']['web_site'] . 'region/?city=' . rawurlencode(trim($_rl_r['region_city'])) . '&district=' . rawurlencode($_rl_d),
        'cnt'  => intval($_rl_r['cnt']),
    );
}
$_rl_items = array_slice($_rl_items, 0, $_rl_limit);
// 产品列表页已有顶部入口时，页脚不再重复
$_rl_hidden = (!empty($data['module']) && intval($data['module']) === 3 && empty($data['id']) && empty($_rl_force));
?>
<?php if ($_rl_items && !$_rl_hidden) { ?>
<div class="region-links">
	<div class="container">
		<div class="region-links-inner">
			<span class="region-links-title">按地区找中医馆：</span>
			<?php foreach ($_rl_items as $_rl_i) { ?>
			<a href="<?php echo htmlspecialchars($_rl_i['url'], ENT_QUOTES, 'UTF-8'); ?>"><?php echo htmlspecialchars($_rl_i['name'], ENT_QUOTES, 'UTF-8'); ?><?php if ($_rl_i['cnt'] > 1) { ?>（<?php echo $_rl_i['cnt']; ?>）<?php } ?></a>
			<?php } ?>
			<a class="region-links-more" href="<?php echo htmlspecialchars($_M['url']['web_site'] . 'region/', ENT_QUOTES, 'UTF-8'); ?>">全部地区 ›</a>
		</div>
	</div>
</div>
<style>
.region-links{padding:14px 0;border-top:1px solid #eee;border-bottom:1px solid #eee;margin-bottom:20px;}
.region-links-inner{font-size:14px;line-height:2.2;}
.region-links-title{color:#888;margin-right:6px;}
.region-links a{display:inline-block;margin-right:12px;color:#555;text-decoration:none;}
.region-links a:hover{color:#8a6d3b;}
.region-links .region-links-more{color:#8a6d3b;}
</style>
<?php } ?>
