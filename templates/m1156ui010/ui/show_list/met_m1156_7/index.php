<?php defined('IN_MET') or exit('No permission'); ?>
<tag action="category" type="current" cid="$data['classnow']"></tag>
<if value="$data['classnow'] eq 10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')">
<section class="$uicss lazy {$ui.bgfull}" m-id="{$ui.mid}" data-title="{$ui.bgtitle}" 
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">  
	<div class="row">
	  <div class="col-md-6">
		<div class="about-title title-box"><h2>{$ui.title}</h2></div>
		<div class="about-box">{$ui.content}</div>
		<div class="about-link">
		  <a href="<tag action='category' cid='$ui["columnid"]' type='current'>{$m.url}</tag>" title="{$ui.title}" {$m.urlnew}>
            <span>{$ui.more}</span>
            <i class="fa fa-angle-double-right"></i>
          </a>
		</div>
	  </div>
	  <div class="col-md-6 about-video">{$ui.videoshow}</div>
	</div> 
  </div> 
</section>
<elseif value="$_GET['pageset']" />
<section class="$uicss" m-id="{$ui.mid}" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
</if>