<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 模板版本标记（改动本文件内容即可让前台模板编译缓存自动失效，无需后台“更新缓存”）
 * 2026-09-11：中医馆/产品详情页详情 Tab 新增“中医师”标签页，列出属于当前医馆的中医师（每行4个，每页12条=最多3行，dpage 参数分页）。
 * 实现位置：ui/product_list_detail/met_m1156_7/index.php（本页通过下方 <ui name="product_list_detail" /> 引入，
 * 该 <ui> 在编译时会把 UI 文件内容内联进本页的编译缓存，故只要本文件比缓存新就会整页重新编译）。
 */
?>
<include file="head.php" page="showproduct"/>
<ui name="location" style="met_m1156_7" id="32" />
<ui name="product_list_detail" style="met_m1156_7" id="33" />
<ui name="sidebar" style="met_m1156_7" id="34" />
<include file="foot.php" />