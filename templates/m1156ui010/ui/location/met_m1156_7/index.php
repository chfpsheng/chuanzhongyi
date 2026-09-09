<?php defined('IN_MET') or exit('No permission'); ?>
<if value="$ui['ui_show']">
<if value="$data['classnow'] neq 10001">
<section class="$uicss_main met-content animsition"
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="row">
      <div class="<if value='$ui["has"]["sidebar"]'>col-lg-9<else/>col-lg-12</if> met-cons">
        <div class="$uicss met-position  pattern-show" m-id="{$ui.mid}" m-type="nocontent">
          <div class="container">
            <div class="row">
              <ol class="breadcrumb m-b-0">
                <li>
                  <a href="{$c.index_url}" title="{$word.home}" {$g.urlnew}>
                    <i class="icon wb-home" aria-hidden="true"></i>
                    {$word.home}
                  </a>
                </li>
				<location>
				<if value="$v['name']">
                <if value="$v['sub']&&$v['module']!=6&&$v['module']!=7">
                <li class="dropdown">
                  <a href="{$v.url}" title="{$v.name}" class="dropdown-toggle" data-toggle="dropdown"  aria-expanded="false">
                    {$v.name}
                    <i class="caret"></i>
                  </a>
                  <ul class="dropdown-menu bullet">
                    <if value="!($v['module'] eq 1 && !$v['isshow'])">
                    <li>
                      <if value="$v['module'] eq 1">
                      <a href="{$v.url}" title="{$v.name}" {$v.urlnew}>{$v.name}</a>
                      <else/>
                      <a href="{$v.url}" title="{$ui.all}" {$v.urlnew}>{$ui.all}</a>
                      </if>
                    </li>
                    </if>
                    <tag action="category" cid="$v['id']" type="son">
                    <li>
                      <a href="{$m.url}" title="{$m.name}" {$m.urlnew}>{$m.name}</a>
                    </li>
                    </tag>
                  </ul>
                </li>
                <else/>
                <li class="dropdown">
                  <a href="{$v.url}" title="{$v.name}">{$v.name}</a>
                </li>
                </if>
                </if>
				</location>
              </ol>
            </div>
          </div>
        </div>
</if>
<elseif value="$_GET['pageset']" />
<section class="$uicss" m-id="{$ui.mid}" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了侧边栏隐藏，可在“侧边栏配置”中设置显示（该文字仅“可视化”模式下可见）
</section>
</if>