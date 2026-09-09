<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss lazy" m-id="{$ui.mid}" 
<if value='$ui["bgimg"] && !strstr($ui["bgimg"],$c["met_agents_img"])'>data-background="{$ui.bgimg}"</if>>
  <div class="met-search animsition">
    <div class="container"> 
      <div class="met-search-body">
        <tag action="search.form"></tag>
        <ul class="list-group list-group-full list-group-dividered met-pager-ajax">
          <tag action="search.list">
          <li class="list-group-item">
            <h4><a href="{$v.url}" title="{$v.ctitle}" {$g.urlnew}>{$v.title}</a></h4>
            <a class="search-result-link" href="{$v.url}" {$g.urlnew}>{$v.url}</a>
            <p>{$v.content}</p>
          </li>
          </tag>
        </ul>
        <div class="page-box" m-type="nosysdata"><pager /></div>
        <div class="met-pager-ajax-link hidden-md-up" m-type="nosysdata">
          <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn"  data-page="1">
            <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
          </button>
        </div>
      </div>
    </div> 
  </div>
</section>