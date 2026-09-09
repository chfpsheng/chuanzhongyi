<?php defined('IN_MET') or exit('No permission'); ?>
<tag action="category" type="current" cid="$data['classnow']"></tag>
<if value="$data['classnow'] eq 10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')">
<section class="$uicss lazy {$ui.bgfull}" m-id="{$ui.mid}" data-title="{$ui.bgtitle}"
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="title-box"><h2>{$ui.title}</h2><p>{$ui.description}</p></div>
	<div class="feedback-cut">
      <if value="$ui['name']">
	  <div class="feedback-tag">
	    <span><i>{$ui.name}</i></span>
		<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAC0lEQVQYV2NgAAIAAAUAAarVyFEAAAAASUVORK5CYII=">
	    <font>{$ui.name}</font>
	  </div>
      </if>
	  <div class="feedback-title">
        <if value="$ui['titles']"><b>{$ui.titles}</b></if>
        <if value="$ui['say']"><p>{$ui.say}</p></if>
      </div>
	  <div class="feedback-form">
    <tag action="feedback.form" cid="$ui['columnid']"></tag>
		
      </div>
	</div>
  </div>
</section>
<elseif value="$_GET['pageset']" />
<section class="$uicss" m-id="{$ui.mid}" m-type="nocontent"
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
</if>