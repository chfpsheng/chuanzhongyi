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
      <tag action="feedback.form"></tag>
    </div>
  </div>
</section>