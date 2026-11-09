<?php defined('IN_MET') or exit('No permission'); ?>
<?php $data['noindex'] = 1; // 在线留言为功能页，无检索价值，避免占用抓取预算 ?>
<include file="head.php" page="message_index"/>
<ui name="subcolumn_nav" style="met_m1156_4" id="55" />
<ui name="message" style="met_m1156_4" id="56" />
<include file="foot.php" />