<?php defined('IN_MET') or exit('No permission'); ?>
<tag action="category" type="current" cid="$data['classnow']"></tag>
<if value="$data['classnow'] eq 10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')">
<section class="$uicss lazy {$ui.bgfull}" m-id="{$ui.mid}" data-title="{$ui.bgtitle}" 
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="title-box"><h2>{$ui.title}</h2><p>{$ui.description}</p></div>
    <div class="row">
      <div class="service-box swiper-container-horizontal">
        <ul class="service-wraper" > 
          <tag action="category" cid="$ui['columnid']" type="son">
          <li class="service-slide swiper-slide-prev">
            <a <if value="$ui['linkok']">href="{$m.url}"</if> title="{$m.name}" {$m.urlnew}>
              <b>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAC0lEQVQYV2NgAAIAAAUAAarVyFEAAAAASUVORK5CYII=">
                <if value="$ui['icontype']">
                <img class="service-lazy icon" data-src="{$m.columnimg}">
                <else/>
                <i class="{$m.icon}"></i>
                </if>
              </b>
              <h3>{$m.name}</h3> 
              <p>{$m.description}</p> 
            </a>
          </li>
          </tag> 
        </ul>
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