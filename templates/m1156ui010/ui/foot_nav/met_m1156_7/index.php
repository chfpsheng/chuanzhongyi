<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss" m-id="{$ui.mid}" m-type="foot">
  <div class="<if value='!$ui["full"]'>container<else/>container-fluid</if>"> 
    <div class="foot-content">
      <div class="foot-nav" m-id="noset" m-type="foot_nav">
        <ul class="foot-nav-wraper">
          <tag action="category" type="foot">
          <li class="foot-nav-slide">
            <b><a href="<if value='$data["classnow"] eq 10001'>{$m.url|str_replace:'../','',@@}<else/>{$m.url}</if>" {$m.urlnew} title="{$m.name}">{$m.name}</a></b>
            <if value="$m['sub']&&$ui['nav2ok']"> 
            <ol>
              <tag action="category" type="son" cid="$m['id']">
              <li><a href="<if value='$data["classnow"] eq 10001'>{$m.url|str_replace:'../','',@@}<else/>{$m.url}</if>" {$m.urlnew} title="{$m.name}">{$m.name}</a></li>
              </tag>
            </ol>
            </if>
          </li>
          </tag>
        </ul>
      </div>  
      <div class="foot-text">
        <span>{$ui.phonetel}</span>
        <b><a href="tel:{$ui.info_tel}" title="{$ui.info_tel}">{$ui.info_tel}</a></b>
        <i>{$ui.info_dsc}</i>
        <p>
          <tag action="category" type="son" cid="$ui['iconid']">
          <a <if value="$_GET['pageset']||($m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img'])))">href="javascript:void(0);"<else/>href="{$m.url}"</if> data-id="{$m.id}" rel="nofollow" target="_blank">
            <if value="$_GET['pageset']||($m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img'])))">
            <span><img src="{$m.columnimg}" alt="{$m.name}"></span>
            </if>
            <font class="{$m.icon}"></font>
          </a>
          </tag>
        </p>
      </div>    
    </div>
  </div>
</section>