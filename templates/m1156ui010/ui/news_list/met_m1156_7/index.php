<?php defined('IN_MET') or exit('No permission'); ?>
<tag action="category" type="current" cid="$data['classnow']"></tag>
<if value="$data['classnow'] eq 10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')">
<section class="$uicss lazy {$ui.bgfull}" m-id="{$ui.mid}" data-title="{$ui.bgtitle}" 
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="title-box"><h2>{$ui.title}</h2><p>{$ui.description}</p></div>
    <div class="row">
      <div class="info-box">
        <ul class="info-wraper">
    	  <tag action="category" cid="$ui['columnid']" type="son">
          <li class="info-slide">
            <span>
              <h3>{$m.name}</h3>
              <a href="{$m.url}" title="{$word.fliptext1}" {$m.urlnew}><hr><hr><hr></a>
            </span>
            <ol>
              <tag action="list" cid="$m['id']" type="$ui['type']" num="$ui['number']">    
              <li>
                <h4><a href="{$v.url}" title="{$v.title}" {$g.urlnew}>{$v.title}</a></h4>
                <p>{$v.description}</p>
                <b>
                  <i>{$v.updatetime}</i>
                  <if value="$ui['tagok']">
                  <em class="fa fa-tag"></em>
                  <strong>{$ui.tag}</strong> 
                  <list data="$v['tag']" name="$t">
                  <a href="search/?searchword={$t}" title="{$t}" target="_blank">{$t}</a>
                  </list>
                  </if>
                </b>
              </li>
              </tag>
            </ol>
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