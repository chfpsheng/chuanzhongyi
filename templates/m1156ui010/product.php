<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="product"/>
<style>
/* 产品列表：瀑布流(Masonry)在这里会按"图片高度≈0"先排一次版，再等图片懒加载完成后重排，
   期间第 4 条及之后的项会压在第 1~3 条上面，造成"没换行、重叠"。本模板的缩略图均为等高(后台设置宽×高)，瀑布流没有视觉收益，
   这里强制退回到普通浮动栅格，AJAX 翻页时脚本继续跑也无所谓，会被 !important 覆盖。 */
ul#met-grid{position:static!important;height:auto!important}
ul#met-grid>li{position:static!important;left:auto!important;top:auto!important}
</style>
<ui name="location" style="met_m1156_7" id="16" />
<?php $_rl_force = 1; ?>
<include file="region_links.php" />
<ui name="para_search" style="met_16_1" id="58" />
<ui name="product_list_page" style="met_m1156_7" id="22" />
<ui name="sidebar" style="met_m1156_7" id="13" />
<include file="foot.php" />