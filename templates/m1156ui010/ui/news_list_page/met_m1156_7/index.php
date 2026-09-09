<?php defined('IN_MET') or exit('No permission'); ?>
<if value="!$ui['has']['location']">
<section class="$uicss_main met-content animsition"
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="row">
      <div class="<if value='$ui["has"]["sidebar"]'>col-lg-9<else/>col-lg-12</if> met-cons">
</if>

        <div class="$uicss met-news-list news-lists" m-id="{$ui.mid}">
          <if value="$ui['headlines'] && !$data['page'] && $ui['listtype'] neq 3">
          <div class="news-headlines">
            <div class="news-wrapper">
              <tag action="news.list">
              <if value="$v['_index'] lt $ui['headlines_num']">
              <div class='news-slide'>
                <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                  <img class="width-full news-lazy" data-src="{$v.imgurl|thumb:$ui['headlines_x'],$ui['headlines_y']}" alt="{$v.title}">
                  <h3>{$v.title}</h3>
                </a>
              </div>
              </if>
              </tag>
            </div>
          </div>
          </if>
          <ul class="met-page-ajax met-pager-ajax" data-scale='{$scale}'>
            <tag action="news.list">
			<if value="!($ui['headlines'] && !$data['page'] && $v['_index'] lt $ui['headlines_num'] && $ui['listtype'] neq 3)">
            <li>
              <if value="$ui['listtype'] eq 2">
              <a class="img" href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                <img src="{$v.imgurl|thumb:$c['met_newsimg_x'],$c['met_newsimg_y']}" alt="{$v.title}">
              </a>
              </if>
              <if value="$ui['listtype'] eq 3">
              <a class="ccimg" href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                <img src="{$v.imgurl|thumb:$ui['ccimg_x'],$ui['ccimg_y']}" alt="{$v.title}">
              </a>
              </if>
              <h4>
                <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>{$v.title}</a>
              </h4>
              <p class="info">
                <span><i class="fa fa-calendar"></i>{$v.updatetime|strtotime|date:strip_tags($ui['datestrong']),@@}</span>
                <if value="$v['issue']">
                <span><i class="fa fa-pencil-square"></i>{$v.issue}</span>
                </if>
                <span><i class="icon wb-eye"></i>{$v.hits}</span>
              </p>
              <?php $ui['descnum']=$ui['descnum']?$ui['descnum']:50; ?>
              <p class="des <if value='$_GET["pageset"]'>editable-click" met-id="{$v.id}" met-table="news" met-field="description"<else/>"</if>>{$v.description|utf8substr:0,$ui['descnum']}</p>
              <p class="more">
                <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>{$ui.more}</a>
              </p>
            </li>
            </if>
            </tag>
          </ul>
          <div class="met-pager-ajax-link hidden-md-up" m-type="nosysdata">
            <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn"  data-page="1">
              <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
            </button>
          </div>
          <div class="page-box" m-type="nosysdata"><pager /></div>
        </div>
      </div>

<if value="!$ui['has']['sidebar']">
    </div>
  </div>
</section>
</if>