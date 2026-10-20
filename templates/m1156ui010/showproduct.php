<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 模板版本标记（改动本文件内容即可让前台模板编译缓存自动失效，无需后台“更新缓存”）
 * 2026-09-11：中医馆/产品详情页详情 Tab 新增“中医师”标签页，列出属于当前医馆的中医师（每行4个，每页12条=最多3行，dpage 参数分页）。
 * 2026-10-10：中医馆「官网」字段（参数管理，类型=链接，参数 id=196）：
 *           1) 详情页按钮加 rel="nofollow"，且仅站外链接加（站内「在线询价」不加），
 *              标准模式与时尚模式两处 para_url 区块均已处理；
 *           2) head.php 的 MedicalClinic 结构化数据新增 sameAs 指向该官网地址。
 * 2026-10-13：中医馆详情页隐藏系统自动追加的「在线询价」按钮（保留官网等真实链接参数按钮）：
 *           在 ui/product_list_detail/met_m1156_7/index.php 顶部按 id 过滤 $data['para_url']
 *           （询价项 id 恒为 0），标准模式与时尚模式两处 para_url 区块均已生效。
 *           两处改动均位于被本页 <ui>/<include> 内联的文件中，故改动本文件内容即可让整页重新编译。
 * 2026-10-15：诊所页正文已批量补全（≥300 字），强制刷新模板编译缓存，避免旧缓存 parse error。
 * 实现位置：ui/product_list_detail/met_m1156_7/index.php（本页通过下方 <ui name="product_list_detail" /> 引入，
 * 该 <ui> 在编译时会把 UI 文件内容内联进本页的编译缓存，故只要本文件比缓存新就会整页重新编译）。
 */
?>
<include file="head.php" page="showproduct"/>
<ui name="location" style="met_m1156_7" id="32" />
<ui name="product_list_detail" style="met_m1156_7" id="33" />
<ui name="sidebar" style="met_m1156_7" id="34" />
<include file="foot.php" />
