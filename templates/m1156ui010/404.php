<?php defined('IN_MET') or exit('No permission'); ?>
<?php $data['noindex'] = 1; // 404 页不参与索引，避免被当成软 404 ?>
<include file="head.php" page="404"/>
<ui name="404" style="met_16_1" id="59" />
<div class="container met-404-links">
  <p class="met-404-tip">您访问的页面不存在或已调整，可以试试以下入口：</p>
  <p class="met-404-nav">
    <a href="{$c.index_url}">首页</a>
    <a href="{$c.met_weburl}product/">中医馆</a>
    <a href="{$c.met_weburl}zhongyishi/">中医师</a>
    <a href="{$c.met_weburl}news/">中医资讯</a>
    <a href="{$c.met_weburl}huodong/">中医活动</a>
    <a href="{$c.met_weburl}shaoerzhongyi/">少儿中医</a>
    <a href="{$c.met_weburl}yuanneizhiji/">院内制剂</a>
    <a href="{$c.met_weburl}region/">按地区找中医馆</a>
  </p>
</div>
<style>
.met-404-links{padding:0 0 40px;text-align:center;}
.met-404-tip{margin:0 0 12px;color:#666;font-size:14px;}
.met-404-nav a{display:inline-block;margin:0 10px 8px;color:#8a6d3b;font-size:15px;text-decoration:none;}
.met-404-nav a:hover{text-decoration:underline;}
</style>
<include file="foot.php" />