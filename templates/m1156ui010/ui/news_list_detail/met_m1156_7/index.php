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

              <if value="$data['publisher']&&$data['is_original']">

              <span class="met-news-source"><i class="fa fa-user-o"></i>作者：{$data.publisher}</span>

              </if>

              <if value="$data['publisher']&&!$data['is_original']">

              <span class="met-news-source"><i class="fa fa-bookmark-o"></i>来源：<if value="$data['source_url']"><a href="{$data.source_url}" target="_blank" rel="noopener" title="{$data.publisher}">{$data.publisher}</a><else/>{$data.publisher}</if></span>

              </if>

              <span><i class="icon wb-eye"></i>{$data.hits}</span>

            </div>

          </div>

          <if value="$data['imgurl']">

          <div class="met-news-cover"><img src="{$data.imgurl}" alt="{$data.title}"></div>

          </if>

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