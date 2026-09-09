<?php defined('IN_MET') or exit('No permission'); ?>
<if value="!($c['met_product_page']&&$data['sub']&&$data['module'] eq 3) && !($c['met_img_page']&&$data['sub']&&$data['module'] eq 5)">
<section class="$uicss column-side {$ui.navcenter}" m-id="{$ui.mid}" m-type="head_nav">
  <div class="<if value='$ui["navfull"]'>container-fluid<else/>container</if>">
    <div class="column-nav">
      <ol class="column-ul">
        <tag action="category" type="current" cid="$data['releclass1']"></tag>
        <if value="$m['module'] neq 1||($m['module'] eq 1&&$m['isshow'])">
        <li class="column-li <if value='$m["id"] eq $data["classnow"]'>active</if>">
          <if value="$m['module'] eq 1">
          <a href="{$m.url}" title="{$m.name}" {$m.urlnew}>{$m.name}</a>
          <else/>
          <a href="{$m.url}" title="{$ui.navall}" {$m.urlnew}>{$ui.navall}</a>
          </if>
        </li>
        </if>
        <tag action="category" type="son" cid="$data['releclass1']" class="active">
        <li class="column-li <if value="$ui['navsonopen']&&$m['sub']&&!strstr('|'.strip_tags($ui['navbarprohibit']).'|','|'.strip_tags($m['name']).'|')">navs</if> <if value="!$ui['navsondown']">not</if> {$m.class}">
          <a href="{$m.url}" title="{$m.name}" {$m.urlnew}>{$m.name}</a>
        </li>
        </tag>
      </ol>
    </div>
  </div>
  <div class="column-hover">
    <tag action="category" type="current" cid="$data['releclass1']"></tag>
    <if value="$m['module'] neq 1||($m['module'] eq 1&&$m['isshow'])">
    <ul></ul>
    </if>
    <tag action="category" type="son" cid="$data['releclass1']" class="active">
    <ul class="<if value="$ui['navsonopen']&&$m['sub']&&!strstr('|'.strip_tags($ui['navbarprohibit']).'|','|'.strip_tags($m['name']).'|')">has</if>">
      <if value="$ui['navsonopen']&&$m['sub']&&!strstr('|'.strip_tags($ui['navbarprohibit']).'|','|'.strip_tags($m['name']).'|')">
      <if value="$m['module'] neq 1||($m['module'] eq 1&&$m['isshow'])">
      <li class="all {$m.class}">
        <if value="$m['module'] eq 1">
        <a href="{$m.url}" title="{$m.name}" {$m.urlnew}>{$m.name}</a>
        <else/>
        <a href="{$m.url}" title="{$ui.navsonall}" {$m.urlnew}>{$ui.navsonall}</a>
        </if>
      </li>
      </if>        
      <tag action="category" type="son" cid="$m['id']" class="active">
      <li class="{$m.class}">
        <a href="{$m.url}" title="{$m.name}" {$m.urlnew}>{$m.name}</a>
      </li>
      </tag>
      </if>
    </ul> 
    </tag> 
  </div>
</section>
</if>