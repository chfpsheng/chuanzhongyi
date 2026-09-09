<?php defined('IN_MET') or exit('No permission'); ?>   
<if value="!$ui['has']['location']">  
<section class="$uicss_main met-content animsition" 
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="row">
      <div class="<if value='$ui["has"]["sidebar"]'>col-lg-9<else/>col-lg-12</if> met-cons">
</if> 

        <div class="$uicss" m-id="{$ui.mid}">  
          <div class="met-editor lazyload clearfix">
            <div class="editorlightgallery">{$data.content}</div>
          </div> 
        </div>
      </div>
      
<if value="!$ui['has']['sidebar']">
    </div>
  </div>
</section>
</if>