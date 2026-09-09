<?php defined('IN_MET') or exit('No permission'); ?>   
<if value="!$ui['has']['location']">  
<section class="$uicss_main met-content animsition" 
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="row">
      <div class="<if value='$ui["has"]["sidebar"]'>col-lg-9<else/>col-lg-12</if> met-cons">
</if> 

        <div class="$uicss" m-id="{$ui.mid}"> 
          <div class="met-shownews-header">
            <h1>{$data.title}</h1>
            <div class="info">
              <span><i class="fa fa-calendar"></i>{$data.updatetime}</span> 
              <span><i class="icon wb-eye"></i>{$data.hits}</span>
            </div>
          </div>    
          <if value="$data['displayimgs']">
          <div class='met-showimg-con'>
            <div class='met-showimg-list fngallery margin-0 text-center slick-dotted <if value="count($data['displayimgs']) eq 1">p-b-0</if>' id="met-imgs-carousel">
              <list data="$data['displayimgs']" name="$img">
              <div class='slick-slide lg-item-box' data-src="{$img.img}" 
              	  data-exthumbimage="{$img.img|thumb:$c['met_imgdetail_x'],$c['met_imgdetail_y']}">
                <span>
                  <img src="{$img.img|thumb:$c['met_imgdetail_x'],$c['met_imgdetail_y']}" class="img-responsive" alt="{$img.title}" />
                </span>
              </div>
              </list>
            </div>
          </div>
          </if>
          <div class="met-editor lazyload clearfix">
            <if value="$data['para']">
            <ul class="para blocks-2 product-para">
              <list data="$data['para']" name="$p">
              <if value="strip_tags($p['value'])">
              <li><name>{$p.name}</name>: <value>{$p.value}</value></li>
              </if>
              </list>
            </ul>
            </if>
            <div class="editorlightgallery">{$data.content}</div>
          </div>
          <if value="$data['taglist']">
          <div class="tag-box">
            <span>{$word.tagweb} : </span>
            <list data="$data['taglist']" name="$tag">
              <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>
            </list>
          </div>
          </if>
          <div class="met-shownews-footer"><pagination /></div> 
        </div>
      </div>
      
<if value="!$ui['has']['sidebar']">
    </div>
  </div>
</section>
</if>