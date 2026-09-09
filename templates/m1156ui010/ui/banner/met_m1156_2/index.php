<?php defined('IN_MET') or exit('No permission'); ?>
<tag action="banner.list"></tag>
<if value="$sub">
<section class="$uicss <if value='$ui["heightfull"]&&($ui["heightfull"]!=2||$data["classnow"]==10001)'>full</if>" 
  data-title="{$ui.bgtitle}" m-id="{$ui.mid}" m-type="banner"
  <if value="$array=!$data['id']?$ui['showlist']:$ui['showdetail']">
  <list data="$array" name="$v">
  <if value="strip_tags($v) eq '简介模块'&&$data['module']==1">hidden</if>
  <if value="strip_tags($v) eq '新闻模块'&&$data['module']==2">hidden</if>
  <if value="strip_tags($v) eq '产品模块'&&$data['module']==3">hidden</if>
  <if value="strip_tags($v) eq '下载模块'&&$data['module']==4">hidden</if>
  <if value="strip_tags($v) eq '图片模块'&&$data['module']==5">hidden</if>
  <if value="strip_tags($v) eq '招聘模块'&&$data['module']==6">hidden</if>
  <if value="strip_tags($v) eq '留言模块'&&$data['module']==7">hidden</if>
  <if value="strip_tags($v) eq '反馈模块'&&$data['module']==8">hidden</if>
  <if value="strip_tags($v) eq '全站搜索'&&$data['module']==11">hidden</if>
  <if value="strip_tags($v) eq '网站地图'&&$data['module']==12">hidden</if>
  </list>
  </if> >
  <div class="banner-box <if value="$v['_index']">banner-container</if>">
    <div class="banner-wrapper">
      <tag action="banner.list">
      <div class="banner-slide">
        <if value="$v['img_link']">
        <a href="{$v.img_link}" title="{$v.img_title}" target="_blank">
        </if>
          <if value="($v['img_title']||$v['img_des'])&&$ui['word_ok']">
          <dl class="H{$v.img_text_position}">
            <dd class="container">
              <if value="$v['img_title']">
              <h3><font <if value="$v['img_title_color']">color="{$v.img_title_color}"</if>>{$v.img_title}</font></h3>
              </if>
              <if value="$v['img_des']">
              <p><font <if value="$v['img_title_color']">color="{$v.img_des_color}"</if>>{$v.img_des}</font></p>
              </if>
            </dd>
          </dl>
          </if>
          <ul>
            <if value='$ui["heightfull"]'>
            <li class="banner-lazy fullheight" data-background="{$v.img_path}">
               <img class="banner-lazy" data-src="{$v.img_path}" alt="{$v.img_title}">
            </li>
            <else/>
            <li class="pc <if value='$v.height'>height</if>">
              <img <if value="!$v['_first']">data-</if>src="<if value='!$v["height"]'>{$v.img_path}<else/>{$v.img_path|thumb:0,$v['height']}</if>" <if value='$v.height'>height="{$v.height}"</if> alt="{$v.img_title}">
            </li>
            <li class="pad <if value='$v.height_t'>height</if>">
              <img data-src="<if value='!$v["height_t"]'>{$v.img_path}<else/>{$v.img_path|thumb:0,$v['height_t']}</if>" <if value='$v.height_t'>height="{$v.height_t}"</if> alt="{$v.img_title}">
            </li>
            <li class="phone <if value='$v.height_m'>height</if>">
              <img data-src="<if value='!$v["height_m"]'>{$v.img_path}<else/>{$v.img_path|thumb:0,$v['height_m']}</if>" <if value='$v.height_m'>height="{$v.height_m}"</if> alt="{$v.img_title}">
            </li>
            </if>
          </ul>
        <if value="$v['img_link']">
        </a>
        </if> 
      </div>
      </tag>
    </div>
    <if value="$v['_index']">
    <div class="banner-pagination"></div>
    <div class="banner-controls left"><i class="icon wb-chevron-left"></i></div>
    <div class="banner-controls right"><i class="icon wb-chevron-right"></i></div>
    </if>
  </div>
</section>
</if>