<?php defined('IN_MET') or exit('No permission'); ?>

<section class="$uicss lazy" m-id="{$ui.mid}" m-type="nocontent"

  <if value='$ui[bgimg] && !strstr($ui[bgimg],$c[met_agents_img])'>data-background="{$ui.bgimg}"</if>>

  <div class="container met-feedback" m-id='{$ui.mid}' m-type='feedback'>

    <div class="row">

      <if value="$ui[title]">

      <if value="$ui[title] neq 1">

      <h1>{$ui.title}</h1>

      <else/>

      <h1>{$data.name}</h1>

      </if>

      </if>

      <div class="met-feedback-contact text-center">
        <div class="row">
          <div class="col-md-6 contact-phone">
            <h4>联系电话</h4>
            <p><a href="tel:18026954495">18026954495</a></p>
          </div>
          <div class="col-md-6 contact-wechat">
            <h4>微信咨询</h4>
            <img src="{$c.met_weburl}upload/file/wechat_qrcode.jpg" alt="微信二维码" class="img-responsive center-block">
          </div>
        </div>
      </div>

      <tag action="feedback.form"></tag>

    </div>

  </div>

</section>