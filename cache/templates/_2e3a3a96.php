<?php defined('IN_MET') or exit('No permission'); ?>

<?php 
    $banner = load::sys_class('label', 'new')->get('banner')->get_column_banner($data['classnow']);
    $sub = is_array($banner['img']) ? count($banner['img']) : 0;
    foreach($banner['img'] as $index=>$v):
        $v['_index']   = $index;
        $v['_first']   = $index == 0 ? true:false;
        $v['_last']    = $index == ($sub-1) ? true : false;
        $v['type'] = $banner['config']['type'];
        $v['y'] = $banner['config']['y'];
        $v['sub'] = $sub;
?><?php endforeach;?>

  <?php if($sub){ ?>

<section class="$uicss   <?php if($ui["heightfull"]&&($ui["heightfull"]!=2||$data["classnow"]==10001)){ ?>full<?php } ?>" 

  data-title="<?php echo $ui['bgtitle'];?>" m-id="<?php echo $ui['mid'];?>" m-type="banner"

    <?php if($array=!$data['id']?$ui['showlist']:$ui['showdetail']){ ?>

          <?php
            $sub = is_array($array) ? count($array) : 0;
            $cycleindex = 50;

            if(!is_array($array) && $array){
                $array = explode('|',$array);
            }

            foreach ($array as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $ui_mod = $val;
            ?>

    <?php if(strip_tags($ui_mod)=='简介模块'&&$data['module']==1){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='新闻模块'&&$data['module']==2){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='产品模块'&&$data['module']==3){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='下载模块'&&$data['module']==4){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='图片模块'&&$data['module']==5){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='招聘模块'&&$data['module']==6){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='留言模块'&&$data['module']==7){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='反馈模块'&&$data['module']==8){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='全站搜索'&&$data['module']==11){ ?>hidden<?php } ?>

    <?php if(strip_tags($ui_mod)=='网站地图'&&$data['module']==12){ ?>hidden<?php } ?>

  <?php }?>

  <?php } ?> >

  <div class="banner-box   <?php if($v['_index']){ ?>banner-container<?php } ?>">

    <div class="banner-wrapper">

      <?php 
    $banner = load::sys_class('label', 'new')->get('banner')->get_column_banner($data['classnow']);
    $sub = is_array($banner['img']) ? count($banner['img']) : 0;
    foreach($banner['img'] as $index=>$v):
        $v['_index']   = $index;
        $v['_first']   = $index == 0 ? true:false;
        $v['_last']    = $index == ($sub-1) ? true : false;
        $v['type'] = $banner['config']['type'];
        $v['y'] = $banner['config']['y'];
        $v['sub'] = $sub;
?>

      <div class="banner-slide">

          <?php if($v['img_link']){ ?>

        <a href="<?php echo $v['img_link'];?>" title="<?php echo $v['img_title'];?>" target="_blank">

        <?php } ?>

            <?php if(($v['img_title']||$v['img_des'])&&$ui['word_ok']){ ?>

          <dl class="H<?php echo $v['img_text_position'];?>">

            <dd class="container">

                <?php if($v['img_title']){ ?>

              <h3><font   <?php if($v['img_title_color']){ ?>color="<?php echo $v['img_title_color'];?>"<?php } ?>><?php echo $v['img_title'];?></font></h3>

              <?php } ?>

                <?php if($v['img_des']){ ?>

              <p><font   <?php if($v['img_title_color']){ ?>color="<?php echo $v['img_des_color'];?>"<?php } ?>><?php echo $v['img_des'];?></font></p>

              <?php } ?>

            </dd>

          </dl>

          <?php } ?>

          <ul>

              <?php if($ui["heightfull"]){ ?>

            <li class="banner-lazy fullheight" data-background="<?php echo $v['img_path'];?>">

               <img class="banner-lazy" data-src="<?php echo $v['img_path'];?>" alt="<?php echo $v['img_title'];?>">

            </li>

            <?php }else{ ?>

            <li class="pc   <?php if($v['height']){ ?>height<?php } ?>">

              <img   <?php if(!$v['_first']){ ?>data-<?php } ?>src="  <?php if(!$v["height"]){ ?><?php echo $v['img_path'];?><?php }else{ ?><?php echo thumb($v['img_path'],0,$v['height']);?><?php } ?>"   <?php if($v['height']){ ?>height="<?php echo $v['height'];?>"<?php } ?> alt="<?php echo $v['img_title'];?>">

            </li>

            <li class="pad   <?php if($v['height_t']){ ?>height<?php } ?>">

              <img data-src="  <?php if(!$v["height_t"]){ ?><?php echo $v['img_path'];?><?php }else{ ?><?php echo thumb($v['img_path'],0,$v['height_t']);?><?php } ?>"   <?php if($v['height_t']){ ?>height="<?php echo $v['height_t'];?>"<?php } ?> alt="<?php echo $v['img_title'];?>">

            </li>

            <li class="phone   <?php if($v['height_m']){ ?>height<?php } ?>">

              <img data-src="  <?php if(!$v["height_m"]){ ?><?php echo $v['img_path'];?><?php }else{ ?><?php echo thumb($v['img_path'],0,$v['height_m']);?><?php } ?>"   <?php if($v['height_m']){ ?>height="<?php echo $v['height_m'];?>"<?php } ?> alt="<?php echo $v['img_title'];?>">

            </li>

            <?php } ?>

          </ul>

          <?php if($v['img_link']){ ?>

        </a>

        <?php } ?> 

      </div>

      <?php endforeach;?>

    </div>

      <?php if($v['_index']){ ?>

    <div class="banner-pagination"></div>

    <div class="banner-controls left"><i class="icon wb-chevron-left"></i></div>

    <div class="banner-controls right"><i class="icon wb-chevron-right"></i></div>

    <?php } ?>

  </div>

</section>

<?php } ?>