<?php defined('IN_MET') or exit('No permission'); ?>
<if value="!$ui['has']['location']">  
<section class="$uicss_main met-content animsition lazy" 
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="row">
      <div class="<if value='$ui["has"]["sidebar"]'>col-lg-9<else/>col-lg-12</if> met-cons">
</if> 
        <div class="$uicss page met-showproduct pagetype{$ui.pagetype}" m-id="{$ui.mid}">
		  <if value="$ui['pagetype'] eq 1">
          <div class="met-showproduct-head"> 
            <div class="product-intro">
              <div class="product-text">
                <h1>{$data.title}</h1>
                <span class="t">
                  <if value="$ui['dateok']">
                  <i class="fa fa-calendar"></i> {$data.updatetime} &nbsp;
                  <i class="icon wb-eye" aria-hidden="true"></i> {$data.hits}
                  </if>
                </span>
                <div class="shownews-container" id="met-imgs-slick">
                  <div class="shownews-wrapper">
                    <list data="$data['displayimgs']" name="$val">
                    <div class="shownews-slide <if value='$val["_first"]'>slick-current</if>">
                      <img class="shownews-lazy" <if value='$val["_first"]'>src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}"</if> data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$val.title}" />
                    </div>
                    </list>
                  </div>
                  <div class="swiper-button-next swiper-button-white"></div>
                  <div class="swiper-button-prev swiper-button-white"></div>
                </div>
                <if value="$val['_index'] gt 0">
                <div class="shownews-container-small">
                  <div class="shownews-wrapper-small">
                    <list data="$data['displayimgs']" name="$val">
                    <div class="shownews-slide-small <if value='$val["_first"]'>active</if>">
                      <img class="shownews-lazy" src="{$c['met_agents_img']|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$val.title}" />
                    </div>
                    </list>
                  </div>
                </div>
                </if>
                <if value="$data['description']">
                <p class="description">{$data.description}</p>
                </if>
                <if value="$data['para'] && $ui['paranum'] lt count($data['para'])">
                <ul class="para blocks-2">
                  <list data="$data['para']" name="$val">
                  <if value="!($val['_index'] lt $ui['paranum'])">
                  <li>{$val.name} : {$val.value}</li>
                  </if>
                  </list>
                </ul>
                </if>
                <if value="$data['para_url']">
                <div class='para-button-link'>
                    <list data="$data['para_url']" name="$para_url" num='100'>
                    <if value="$para_url['value']">
                    <a href="{$para_url.value}" class="linkbox btn btn-danger m-r-15" target="_blank">{$para_url.name}</a>
                    </if>
                    </list>
                </div>
                </if> 
              </div>
            </div> 
          </div>
          <div class="met-showproduct-body"> 
            <div class="no-space">
              <div class="product-content-body">
                <div class=" product-detail <if value='!$ui["hitsok"]'>m-r-0 m-b-0</if>">
                  <div class="container">
                    <div class="row">
                      <div class="panel-body">
                        <ul class="nav nav-tabs nav-tabs-line met-showproduct-navtabs affix-nav">
                          <list data="$data['contents']" name="$s">
                          <if value="$s['content']">
                          <li class="nav-item"><a class="nav-link <if value='$s["_first"]'>active</if>" data-toggle="tab" href="#product-content{$s._index}" data-get="product-details">{$s.title}</a></li>
                          </if>
                          </list>
                        </ul>
                        <div class="tab-content">
                          <list data="$data['contents']" name="$s"> 
                          <div id="product-content{$s._index}" class="tab-pane met-editor lazyload clearfix animation-fade 
                          	<if value="$s['_first']">active</if>
                            <if value='$_GET["pageset"]'>
                            editable-click" met-id="{$data.id}" met-table="product" met-field="content{$s._index}"
                            <else/>"</if>
                            >
                            <div>{$s.content|preg_replace:'/(<img[^>]*)src(=[^>]*>)/', '\\1class="imgloading" data-original\\2',@@}</div>
                          </div> 
                          </list>
                          <if value="$ui['tag_ok']">
                          <div class="tag">
                            <span>{$data.tagname}</span>
                            <list data="$data['taglist']" name="$tag" num="$ui['tag_num']">
                            <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>
                            </list>
                          </div>
                          </if>
                        </div>
                        <if value="$data['taglist']">
                        <div class="tag-box">
                          <span>{$word.tagweb} : </span>
                          <list data="$data['taglist']" name="$tag">
                            <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>
                          </list>
                        </div>
                        </if>
                        <div class="showproduct-pager"><pagination /></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div> 
          </div>
          <if value="$ui['hitsok']">
          <div class="met-showproduct-foot">
            <div class="panel product-hot">
              <div class="container">
                <div class="row">
                  <div class="panel-body">
                    <h4 class="example-title">{$ui.hitsname}</h4>
                    <ul class="blocks-2 blocks-sm-3 blocks-lg-3" data-scale='{$v["displayimgs"][0]["x"]}x{$v["displayimgs"][0]["y"]}'>
                      <?php $cls=$ui['hitsid']?$ui['hitsid']:$data['classnow']; ?>
                      <tag action="list" type="$ui['hitstype']" cid="$cls" num="$ui['hitsnumber']">
                      <li>
                        <a href="{$v.url}" title="{$v.title}" class="img" {$g.urlnew}>
                          <img class="imgloading" data-original="{$v.imgurl|thumb:$c['met_productimg_x'],$c['met_productimg_y']}">
                        </a>
                        <a href="{$v.url}" title="{$v.title}" class="txt" {$g.urlnew}>{$v.title}</a>
                      </li>
                      </tag>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div> 
          </if>
          <elseif value="$ui['pagetype'] eq 2"/> 
          <div class="page met-showproduct pagetype{$ui.pagetype} animsition" id="content-1"> 
            <nav class="navbar navbar-default" role="navigation" data-class="{$ui.fixedclass}">
              <div class="container not">
                <ul class="nav navbar-toolbar pull-xs-right shop-btn-body">
                  <if value="$data['para_url']">
                  <list data="$data['para_url']" name="$para_url" num='100'>
                  <li class="m-r-10">
                    <div class="h-50 vertical-align">
                      <div class="vertical-align-middle">
                        <if value="$para_url['value']">
                        <a href="{$para_url.value}" class="linkbox btn btn-danger" target="_blank">{$para_url.name}</a>
                        </if>
                      </div>
                    </div>
                  </li>
                  </list>
                  </if> 
                </ul>  
                <div class="head-nav">
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-target="#navbar-showproduct-pagetype2" data-toggle="collapse">
                      <span class="sr-only">Toggle navigation</span>
                      <i class="icon wb-chevron-down" aria-hidden="true"></i>
                    </button>
                    <h1 class="navbar-brand">{$data.title}</h1>
                  </div>
                  <div class="collapse navbar-collapse navbar-collapse-toolbar" id="navbar-showproduct-pagetype2">
                    <ul class="nav navbar-toolbar navbar-right met-showproduct-navtabs">
                      <list data="$data['contents']" name="$s">
                      <if value="$s['content']">
                      <li class="nav-item"><a class='nav-link' href="#content{$s._index}" data-get="product-details">{$s.title}</a></li>
                      </if>
                      </list>
                      <if value="$data['para'] && $ui['paranum'] lt count($data['para'])">
                      <li class="nav-item"><a class='nav-link' href="#contenti">{$ui.specpara}</a></li>
                      </if>
                    </ul>
                  </div>
                </div>
              </div>
            </nav>
            <div class="shownews-container full" id="met-imgs-slick">
              <div class="shownews-wrapper">
                <list data="$data['displayimgs']" name="$val">
                <div class="shownews-slide <if value='$val["_first"]'>slick-current</if>">
                  <img class="shownews-lazy" data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$val.title}" />
                </div>
                </list>
              </div>
              <div class="swiper-button-next swiper-button-white"></div>
              <div class="swiper-button-prev swiper-button-white"></div>
            </div>
            <if value="$val['_index'] gt 1">
            <div class="shownews-container-small">
              <div class="shownews-wrapper-small">
                <list data="$data['displayimgs']" name="$val">
                <div class="shownews-slide-small <if value='$val["_first"]'>active</if>">
                  <img class="shownews-lazy" data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$val.title}" />
                </div>
                </list>
              </div>
            </div>
            </if>
            <list data="$data['contents']" name="$s">
            <if value="$s['content']">
            <div class="content content{$s._index}" id="content{$s._index}">
              <div class="container">
                <div class="row">
                  <div class="met-editor lazyload clearfix">
                    {$s.content|preg_replace:'/(<img[^>]*)src(=[^>]*>)/', '\\1class="imgloading" data-original\\2',@@}
                    <if value="$data['taglist']&&$s['_last']">
                    <div class="tag-box">
                      <span>{$word.tagweb} : </span>
                      <list data="$data['taglist']" name="$tag">
                        <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>
                      </list>
                    </div>
                    </if>
                  </div>
                </div>
              </div>
            </div>
            </if>
            </list>
            <if value="$data['para'] && $ui['paranum'] lt count($data['para'])">
            <div class="content contenti" id="contenti">
              <div class="container">      
                <ul class="product-para paralist blocks-100 blocks-md-2 blocks-lg-3 blocks-xxl-2">
                  <list data="$data['para']" name="$s">
                  <if value="!($s['_index'] lt $ui['paranum'])">
                  <li class="p-x-0 m-b-15"><span>{$s.name}：</span> {$s.value}</li>
                  </if>
                  </list>
                </ul>
              </div>
            </div>
            </if>
          </div> 
          </if>
        </div>
      </div>
<if value="!$ui['has']['sidebar']">
    </div>
  </div>
</section>
</if>