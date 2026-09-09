<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss lazy" m-id="{$ui.mid}" 
<if value='$ui[bgimg] && !strstr($ui[bgimg],$c[met_agents_img])'>data-background="{$ui.bgimg}"</if>> 
  <div class="met-sitemap animsition">
    <div class="container">
      <div class="row">
        <div class="met-sitemap-body">
          <ul class="sitemap-list">
            <tag action="category" type="head">
            <li>
              <a href="{$m.url}" title="{$m.name}" {$g.urlnew}>
                <i class="icon wb-menu m-r-10" aria-hidden="true"></i>
                {$m.name}
              </a>
              <if value="$m[sub]">
              <ul>
                <tag action="category" type="son" cid="$m[id]">
                <li>
                  <a href="{$m.url}" title="{$m.name}" {$g.urlnew}>
                    <i class="icon wb-link pull-xs-right"></i>
                    <span>{$m.name}</span>
                  </a>
                </li>
                <if value="$m[sub]">
                <ul class="sitemap-list-sub">
                  <tag action="category" type="son" cid="$m[id]">
                  <li><a href="{$m.url}" title="{$m.name}" {$g.urlnew}>{$m.name}</a></li>
                  </tag>
                </ul>
                </if>
                </tag>
              </ul>
              </if>
            </li>
            </tag>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>