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
              <span><i class="fa fa-pencil-square"></i>{$data.issue}</span>
              <span><i class="icon wb-eye"></i>{$data.hits}</span>
            </div>
          </div>
          <div class="met-editor lazyload clearfix">
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