<?php defined('IN_MET') or exit('No permission'); ?>   
  <?php if(!$ui['has']['location']){ ?>  
<section class="$uicss_main met-content animsition" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="row">
      <div class="  <?php if($ui["has"]["sidebar"]){ ?>col-lg-9<?php }else{ ?>col-lg-12<?php } ?> met-cons">
<?php } ?> 

        <div class="$uicss" m-id="<?php echo $ui['mid'];?>">  
          <div class="met-editor lazyload clearfix">
            <div class="editorlightgallery"><?php echo $data['content'];?></div>
          </div> 
        </div>
      </div>
      
  <?php if(!$ui['has']['sidebar']){ ?>
    </div>
  </div>
</section>
<?php } ?>