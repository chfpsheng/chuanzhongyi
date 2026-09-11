<?php defined('IN_MET') or exit('No permission'); ?>
  <?php if(!$ui['has']['location']){ ?>
<section class="$uicss_main met-content animsition"
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="row">
      <div class="  <?php if($ui["has"]["sidebar"]){ ?>col-lg-9<?php }else{ ?>col-lg-12<?php } ?> met-cons">
<?php } ?>

        <div class="$uicss met-news-list news-lists" m-id="<?php echo $ui['mid'];?>">
            <?php if($ui['headlines'] && !$data['page'] && $ui['listtype']<>3){ ?>
          <div class="news-headlines">
            <div class="news-wrapper">
              <?php
    $cid = 0;
    if($cid == 0){
        $cid = $data['classnow'];
    }
    $num = 8;
    $order = "no_order";
    $news = load::sys_class('label', 'new')->get('news');
    $news->page_num = $num;
    $result = $news->get_list_page($cid, $data['page']);
    $sub = is_array($result) ? count($result) : 0;
     foreach($result as $index=>$v):
        $v['sub']      = $sub;
        $v['_index']   = $index;
        $v['_first']   = $index == 0 ? true:false;
        $v['_last']    = $index == (count($result)-1) ? true : false;

?>
                <?php if($v['_index']<$ui['headlines_num']){ ?>
              <div class='news-slide'>
                <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
                  <img class="width-full news-lazy" data-src="<?php echo thumb($v['imgurl'],$ui['headlines_x'],$ui['headlines_y']);?>" alt="<?php echo $v['title'];?>">
                  <h3><?php echo $v['title'];?></h3>
                </a>
              </div>
              <?php } ?>
              <?php endforeach;?>
            </div>
          </div>
          <?php } ?>
          <ul class="met-page-ajax met-pager-ajax" data-scale='<?php echo $scale;?>'>
            <?php
    $cid = 0;
    if($cid == 0){
        $cid = $data['classnow'];
    }
    $num = 8;
    $order = "no_order";
    $news = load::sys_class('label', 'new')->get('news');
    $news->page_num = $num;
    $result = $news->get_list_page($cid, $data['page']);
    $sub = is_array($result) ? count($result) : 0;
     foreach($result as $index=>$v):
        $v['sub']      = $sub;
        $v['_index']   = $index;
        $v['_first']   = $index == 0 ? true:false;
        $v['_last']    = $index == (count($result)-1) ? true : false;

?>
			  <?php if(!($ui['headlines'] && !$data['page'] && $v['_index']<$ui['headlines_num'] && $ui['listtype']<>3)){ ?>
            <li>
                <?php if($ui['listtype']==2){ ?>
              <a class="img" href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
                <img src="<?php echo thumb($v['imgurl'],$c['met_newsimg_x'],$c['met_newsimg_y']);?>" alt="<?php echo $v['title'];?>">
              </a>
              <?php } ?>
                <?php if($ui['listtype']==3){ ?>
              <a class="ccimg" href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
                <img src="<?php echo thumb($v['imgurl'],$ui['ccimg_x'],$ui['ccimg_y']);?>" alt="<?php echo $v['title'];?>">
              </a>
              <?php } ?>
              <h4>
                <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>><?php echo $v['title'];?></a>
              </h4>
              <p class="info">
                <span><i class="fa fa-calendar"></i><?php echo date(strip_tags($ui['datestrong']),strtotime($v['updatetime']));?></span>
                  <?php if($v['issue']){ ?>
                <span><i class="fa fa-pencil-square"></i><?php echo $v['issue'];?></span>
                <?php } ?>
                <span><i class="icon wb-eye"></i><?php echo $v['hits'];?></span>
              </p>
              <?php $ui['descnum']=$ui['descnum']?$ui['descnum']:50; ?>
              <p class="des   <?php if($_GET["pageset"]){ ?>editable-click" met-id="<?php echo $v['id'];?>" met-table="news" met-field="description"<?php }else{ ?>"<?php } ?>><?php echo utf8substr($v['description'],0,$ui['descnum']);?></p>
              <p class="more">
                <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>><?php echo $ui['more'];?></a>
              </p>
            </li>
            <?php } ?>
            <?php endforeach;?>
          </ul>
          <div class="met-pager-ajax-link hidden-md-up" m-type="nosysdata">
            <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn"  data-page="1">
              <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
            </button>
          </div>
          <div class="page-box" m-type="nosysdata">     <?php
     $page_type = 0;
     if(!$data['classnow']){
        $data['classnow'] = 2;
     }

     if(!$data['page']){
        $data['page'] = 1;
     }
      $result = load::sys_class('label', 'new')->get('tag')->get_page_html($data['classnow'],$data['page'],$page_type);
        if(!$result){
            $result=array();
        }
       echo $result['html'];

     ?></div>
        </div>
      </div>

  <?php if(!$ui['has']['sidebar']){ ?>
    </div>
  </div>
</section>
<?php } ?>