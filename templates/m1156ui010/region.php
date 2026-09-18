<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="region"/>
<?php
// 注意：本模板内所有变量一律加 _rg 前缀，避免覆盖米拓全局的 $c / $v / $m / $data 等变量
$_rg_tree = isset($data['region_tree']) && is_array($data['region_tree']) ? $data['region_tree'] : array();
$_rg_city = isset($data['region_city']) ? $data['region_city'] : '';
$_rg_district = isset($data['region_district']) ? $data['region_district'] : '';
$_rg_list = isset($data['region_list']) && is_array($data['region_list']) ? $data['region_list'] : array();
$_rg_breadcrumb = isset($data['region_breadcrumb']) && is_array($data['region_breadcrumb']) ? $data['region_breadcrumb'] : array();
$_rg_name = isset($data['region_name']) ? $data['region_name'] : '中医馆地区分布';
$_rg_site = $_M['url']['web_site'];
$_rg_total = 0;
foreach ($_rg_tree as $_rg_ds) {
    foreach ((array)$_rg_ds as $_rg_n) {
        $_rg_total += intval($_rg_n);
    }
}
$_rg_count = count($_rg_breadcrumb);
?>
<style>
.region-wrap{padding:30px 0 50px;}
.region-wrap .breadcrumb{background:none;padding:0;margin-bottom:10px;font-size:14px;}
.region-title{font-size:26px;line-height:1.4;margin:0 0 8px;}
.region-meta{color:#888;font-size:14px;margin-bottom:20px;}
.region-group{margin-bottom:28px;}
.region-group h2{font-size:18px;margin:0 0 12px;padding-left:10px;border-left:4px solid #8a6d3b;}
.region-chips a{display:inline-block;margin:0 8px 8px 0;padding:5px 14px;border:1px solid #e3e3e3;border-radius:20px;color:#555;font-size:14px;text-decoration:none;}
.region-chips a:hover{border-color:#8a6d3b;color:#8a6d3b;}
.region-chips a.active{background:#8a6d3b;border-color:#8a6d3b;color:#fff;}
.region-cards{display:flex;flex-wrap:wrap;margin:0 -10px;}
.region-card{width:33.3333%;padding:0 10px;margin-bottom:20px;}
.region-card a{display:block;border:1px solid #eee;border-radius:6px;overflow:hidden;text-decoration:none;color:#333;background:#fff;}
.region-card a:hover{box-shadow:0 4px 12px rgba(0,0,0,.08);}
.region-card .thumb{height:160px;background:#f5f5f5 center/cover no-repeat;}
.region-card .body{padding:12px 14px;}
.region-card .name{font-size:16px;font-weight:600;margin-bottom:6px;}
.region-card .desc{color:#888;font-size:13px;line-height:1.6;min-height:42px;}
.region-card .area{margin-top:8px;color:#8a6d3b;font-size:13px;}
.region-empty{padding:40px 0;color:#999;text-align:center;}
@media (max-width:991px){.region-card{width:50%;}}
@media (max-width:575px){.region-card{width:100%;}}
</style>
<div class="region-wrap">
	<div class="container">
		<nav class="breadcrumb">
			<?php $_rg_i = 0; foreach ($_rg_breadcrumb as $_rg_bc) { $_rg_i++; ?>
			<?php if ($_rg_i > 1) { ?><span class="mx-1">/</span><?php } ?>
			<?php if ($_rg_i === $_rg_count) { ?><span><?php echo htmlspecialchars($_rg_bc['name'], ENT_QUOTES, 'UTF-8'); ?></span><?php } else { ?><a href="<?php echo htmlspecialchars($_rg_bc['url'], ENT_QUOTES, 'UTF-8'); ?>"><?php echo htmlspecialchars($_rg_bc['name'], ENT_QUOTES, 'UTF-8'); ?></a><?php } ?>
			<?php } ?>
		</nav>

		<h1 class="region-title"><?php echo htmlspecialchars($_rg_name, ENT_QUOTES, 'UTF-8'); ?>中医馆<?php if ($_rg_district || $_rg_city) { ?>（<?php echo count($_rg_list); ?>家）<?php } ?></h1>
		<p class="region-meta">按地区查找中医馆：当前共收录 <?php echo $_rg_total; ?> 家，可按市/州与区/县逐级筛选。</p>

		<?php if (!$_rg_tree) { ?>
		<div class="region-empty">暂无已标注地区的中医馆，请先在后台为中医馆填写「所属地区」。</div>
		<?php } else { ?>

		<?php if ($_rg_district) { ?>
		<div class="region-group region-chips">
			<h2><?php echo htmlspecialchars($_rg_city, ENT_QUOTES, 'UTF-8'); ?>其他区县</h2>
			<?php foreach ((array)$_rg_tree[$_rg_city] as $_rg_d => $_rg_n) { ?>
			<a href="<?php echo htmlspecialchars($_rg_site . 'region/?city=' . rawurlencode($_rg_city) . '&district=' . rawurlencode($_rg_d), ENT_QUOTES, 'UTF-8'); ?>" class="<?php echo ($_rg_d === $_rg_district) ? 'active' : ''; ?>"><?php echo htmlspecialchars($_rg_d, ENT_QUOTES, 'UTF-8'); ?>（<?php echo intval($_rg_n); ?>）</a>
			<?php } ?>
		</div>
		<div class="region-cards">
			<?php foreach ($_rg_list as $_rg_v) { ?>
			<div class="region-card">
				<a href="<?php echo htmlspecialchars($_rg_v['url'], ENT_QUOTES, 'UTF-8'); ?>" title="<?php echo htmlspecialchars($_rg_v['title'], ENT_QUOTES, 'UTF-8'); ?>">
					<div class="thumb" style="<?php echo $_rg_v['imgurl'] ? 'background-image:url(' . htmlspecialchars($_rg_v['imgurl'], ENT_QUOTES, 'UTF-8') . ');' : ''; ?>"></div>
					<div class="body">
						<div class="name"><?php echo htmlspecialchars($_rg_v['title'], ENT_QUOTES, 'UTF-8'); ?></div>
						<div class="desc"><?php echo htmlspecialchars($_rg_v['description'], ENT_QUOTES, 'UTF-8'); ?></div>
						<div class="area"><?php echo htmlspecialchars(trim($_rg_v['region_city'] . ' ' . $_rg_v['region_district']), ENT_QUOTES, 'UTF-8'); ?></div>
					</div>
				</a>
			</div>
			<?php } ?>
		</div>
		<?php if (!$_rg_list) { ?><div class="region-empty">该地区暂无已发布的中医馆。</div><?php } ?>

		<?php } elseif ($_rg_city) { ?>
		<div class="region-group region-chips">
			<h2><?php echo htmlspecialchars($_rg_city, ENT_QUOTES, 'UTF-8'); ?>各区/县</h2>
			<?php foreach ((array)$_rg_tree[$_rg_city] as $_rg_d => $_rg_n) { ?>
			<a href="<?php echo htmlspecialchars($_rg_site . 'region/?city=' . rawurlencode($_rg_city) . '&district=' . rawurlencode($_rg_d), ENT_QUOTES, 'UTF-8'); ?>"><?php echo htmlspecialchars($_rg_d, ENT_QUOTES, 'UTF-8'); ?>（<?php echo intval($_rg_n); ?>）</a>
			<?php } ?>
		</div>
		<div class="region-cards">
			<?php foreach ($_rg_list as $_rg_v) { ?>
			<div class="region-card">
				<a href="<?php echo htmlspecialchars($_rg_v['url'], ENT_QUOTES, 'UTF-8'); ?>" title="<?php echo htmlspecialchars($_rg_v['title'], ENT_QUOTES, 'UTF-8'); ?>">
					<div class="thumb" style="<?php echo $_rg_v['imgurl'] ? 'background-image:url(' . htmlspecialchars($_rg_v['imgurl'], ENT_QUOTES, 'UTF-8') . ');' : ''; ?>"></div>
					<div class="body">
						<div class="name"><?php echo htmlspecialchars($_rg_v['title'], ENT_QUOTES, 'UTF-8'); ?></div>
						<div class="desc"><?php echo htmlspecialchars($_rg_v['description'], ENT_QUOTES, 'UTF-8'); ?></div>
						<div class="area"><?php echo htmlspecialchars(trim($_rg_v['region_city'] . ' ' . $_rg_v['region_district']), ENT_QUOTES, 'UTF-8'); ?></div>
					</div>
				</a>
			</div>
			<?php } ?>
		</div>

		<?php } else { ?>
		<?php foreach ($_rg_tree as $_rg_c => $_rg_ds) { ?>
		<div class="region-group">
			<h2><a href="<?php echo htmlspecialchars($_rg_site . 'region/?city=' . rawurlencode($_rg_c), ENT_QUOTES, 'UTF-8'); ?>" style="color:inherit;text-decoration:none;"><?php echo htmlspecialchars($_rg_c, ENT_QUOTES, 'UTF-8'); ?></a></h2>
			<div class="region-chips">
				<?php foreach ((array)$_rg_ds as $_rg_d => $_rg_n) { ?>
				<a href="<?php echo htmlspecialchars($_rg_site . 'region/?city=' . rawurlencode($_rg_c) . '&district=' . rawurlencode($_rg_d), ENT_QUOTES, 'UTF-8'); ?>"><?php echo htmlspecialchars($_rg_d, ENT_QUOTES, 'UTF-8'); ?>（<?php echo intval($_rg_n); ?>）</a>
				<?php } ?>
			</div>
		</div>
		<?php } ?>
		<?php } ?>

		<?php } ?>
	</div>
</div>
<include file="foot.php" />
