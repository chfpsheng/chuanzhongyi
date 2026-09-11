<?php defined('IN_MET') or exit('No permission'); ?>

  <?php if(!$ui['has']['location']){ ?>  

<section class="$uicss_main met-content animsition lazy" 

  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">

  <div class="container">

    <div class="row">

      <div class="  <?php if($ui["has"]["sidebar"]){ ?>col-lg-9<?php }else{ ?>col-lg-12<?php } ?> met-cons">

<?php } ?> 

        <div class="$uicss page met-showproduct pagetype<?php echo $ui['pagetype'];?>" m-id="<?php echo $ui['mid'];?>">

		    <?php if($ui['pagetype']==1){ ?>

          <div class="met-showproduct-head"> 

            <div class="product-intro">

              <div class="product-text">

                <h1><?php echo $data['title'];?></h1>

                <span class="t">

                    <?php if($ui['dateok']){ ?>

                  <i class="fa fa-calendar"></i> <?php echo $data['updatetime'];?> &nbsp;

                  <i class="icon wb-eye" aria-hidden="true"></i> <?php echo $data['hits'];?>

                  <?php } ?>

                </span>

                <div class="shownews-container" id="met-imgs-slick">

                  <div class="shownews-wrapper">

                            <?php
            $sub = is_array($data['displayimgs']) ? count($data['displayimgs']) : 0;
            $cycleindex = 50;

            if(!is_array($data['displayimgs']) && $data['displayimgs']){
                $data['displayimgs'] = explode('|',$data['displayimgs']);
            }

            foreach ($data['displayimgs'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $val = $val;
            ?>

                    <div class="shownews-slide   <?php if($val["_first"]){ ?>slick-current<?php } ?>">

                      <img class="shownews-lazy"   <?php if($val["_first"]){ ?>src="<?php echo thumb($val['img'],$c['met_productdetail_x'],$c['met_productdetail_y']);?>"<?php } ?> data-src="<?php echo thumb($val['img'],$c['met_productdetail_x'],$c['met_productdetail_y']);?>" data-gallery="<?php echo $val['img'];?>" alt="<?php echo $val['title'];?>" />

                    </div>

                    <?php }?>

                  </div>

                  <div class="swiper-button-next swiper-button-white"></div>

                  <div class="swiper-button-prev swiper-button-white"></div>

                </div>

                  <?php if($val['_index']>0){ ?>

                <div class="shownews-container-small">

                  <div class="shownews-wrapper-small">

                            <?php
            $sub = is_array($data['displayimgs']) ? count($data['displayimgs']) : 0;
            $cycleindex = 50;

            if(!is_array($data['displayimgs']) && $data['displayimgs']){
                $data['displayimgs'] = explode('|',$data['displayimgs']);
            }

            foreach ($data['displayimgs'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $val = $val;
            ?>

                    <div class="shownews-slide-small   <?php if($val["_first"]){ ?>active<?php } ?>">

                      <img class="shownews-lazy" src="<?php echo thumb($c['met_agents_img'],$c['met_productdetail_x'],$c['met_productdetail_y']);?>" data-src="<?php echo thumb($val['img'],$c['met_productdetail_x'],$c['met_productdetail_y']);?>" data-gallery="<?php echo $val['img'];?>" alt="<?php echo $val['title'];?>" />

                    </div>

                    <?php }?>

                  </div>

                </div>

                <?php } ?>

                  <?php if($data['description']){ ?>

                <p class="description"><?php echo $data['description'];?></p>

                <?php } ?>

                  <?php if($data['para'] && $ui['paranum']<count($data['para'])){ ?>

                <ul class="para blocks-2">

                          <?php
            $sub = is_array($data['para']) ? count($data['para']) : 0;
            $cycleindex = 50;

            if(!is_array($data['para']) && $data['para']){
                $data['para'] = explode('|',$data['para']);
            }

            foreach ($data['para'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $val = $val;
            ?>

                    <?php if(!($val['_index']<$ui['paranum'])){ ?>

                  <li><?php echo $val['name'];?> : <?php echo $val['value'];?></li>

                  <?php } ?>

                  <?php }?>

                </ul>

                <?php } ?>

                  <?php if($data['para_url']){ ?>

                <div class='para-button-link'>

                            <?php
            $sub = is_array($data['para_url']) ? count($data['para_url']) : 0;
            $cycleindex = 100;

            if(!is_array($data['para_url']) && $data['para_url']){
                $data['para_url'] = explode('|',$data['para_url']);
            }

            foreach ($data['para_url'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $para_url = $val;
            ?>

                      <?php if($para_url['value']){ ?>

                    <a href="<?php echo $para_url['value'];?>" class="linkbox btn btn-danger m-r-15" target="_blank"><?php echo $para_url['name'];?></a>

                    <?php } ?>

                    <?php }?>

                </div>

                <?php } ?> 

              </div>

            </div> 

          </div>

          <div class="met-showproduct-body"> 

            <div class="no-space">

              <div class="product-content-body">

                <div class=" product-detail   <?php if(!$ui["hitsok"]){ ?>m-r-0 m-b-0<?php } ?>">

                  <div class="container">

                    <div class="row">

                      <div class="panel-body">

                      <?php
                      //中医馆详情页：读取属于当前医馆的中医师（每行4个，每页12条即最多3行）
                      $met_dpage = isset($_M['form']['dpage']) ? intval($_M['form']['dpage']) : (isset($_GET['dpage']) ? intval($_GET['dpage']) : 0);
                      $met_doctor_list = array('list' => array(), 'total' => 0, 'pages' => 0, 'page' => 1);
                      if ($data['id']) {
                      $met_doctor_list = load::mod_class('doctor/doctor_label', 'new')->get_list_by_yiguan($data['id'], $met_dpage > 0 ? $met_dpage : 1, 12);
                      }
                      ?>

                      <ul class="nav nav-tabs nav-tabs-line met-showproduct-navtabs affix-nav">

                                <?php
            $sub = is_array($data['contents']) ? count($data['contents']) : 0;
            $cycleindex = 50;

            if(!is_array($data['contents']) && $data['contents']){
                $data['contents'] = explode('|',$data['contents']);
            }

            foreach ($data['contents'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $s = $val;
            ?>

                          <?php if($s['content']){ ?>

                        <li class="nav-item"><a class="nav-link   <?php if($s["_first"]){ ?>active<?php } ?>" data-toggle="tab" href="#product-content<?php echo $s['_index'];?>" data-get="product-details"><?php echo $s['title'];?></a></li>

                        <?php } ?>

                        <?php }?>

                          <?php if($met_doctor_list['total']){ ?>

                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product-content-doctor">中医师</a></li>

                        <?php } ?>

                      </ul>

                        <div class="tab-content">

                                  <?php
            $sub = is_array($data['contents']) ? count($data['contents']) : 0;
            $cycleindex = 50;

            if(!is_array($data['contents']) && $data['contents']){
                $data['contents'] = explode('|',$data['contents']);
            }

            foreach ($data['contents'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $s = $val;
            ?> 

                          <div id="product-content<?php echo $s['_index'];?>" class="tab-pane met-editor lazyload clearfix animation-fade 

                          	  <?php if($s['_first']){ ?>active<?php } ?>

                              <?php if($_GET["pageset"]){ ?>

                            editable-click" met-id="<?php echo $data['id'];?>" met-table="product" met-field="content<?php echo $s['_index'];?>"

                            <?php }else{ ?>"<?php } ?>

                            >

                            <div><?php echo preg_replace('/(<img[^>]*)src(=[^>]*>)/', '\\1class="imgloading" data-original\\2',$s['content']);?></div>

                          </div> 

                          <?php }?>

                            <?php if($met_doctor_list['total']){ ?>

                          <div id="product-content-doctor" class="tab-pane animation-fade">

                            <style type="text/css">
                            .met-yiguan-doctors-list{margin:0 -10px; padding:0; list-style:none;}
                            .met-yiguan-doctors-list:after{display:block; clear:both; content:'';}
                            .met-yiguan-doctors-list li{float:left; width:25%; padding:0 10px 20px 10px; box-sizing:border-box; text-align:center;}
                            .met-yiguan-doctors-list li a.img{display:block;}
                            .met-yiguan-doctors-list li a.img img{width:100%; display:block; border-radius:4px;}
                            .met-yiguan-doctors-list li h4{margin:12px 0 5px 0; font-size:16px; font-weight:400; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
                            .met-yiguan-doctors-list li h4 a{display:block;}
                            .met-yiguan-doctors-list li p.info{margin:0; font-size:13px; color:#999;}
                            .met-yiguan-doctors-list li p.info span{margin:0 5px; display:inline-block;}
                            .met-yiguan-doctors-pager .pagination{display:flex; justify-content:center; margin:0;}
                            .met-yiguan-doctors-pager .page-item{margin:10px 3px 0 3px;}
                            @media (max-width:767px){.met-yiguan-doctors-list li{width:50%;}}
                            </style>

                            <ul class="met-yiguan-doctors-list">

                                      <?php
            $sub = is_array($met_doctor_list['list']) ? count($met_doctor_list['list']) : 0;
            $cycleindex = 50;

            if(!is_array($met_doctor_list['list']) && $met_doctor_list['list']){
                $met_doctor_list['list'] = explode('|',$met_doctor_list['list']);
            }

            foreach ($met_doctor_list['list'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $met_doctor = $val;
            ?>

                              <li>

                                <a class="img" href="<?php echo $met_doctor['url'];?>" title="<?php echo $met_doctor['title'];?>">

                                    <?php if($met_doctor['imgurl']){ ?>

                                  <img src="<?php echo thumb($met_doctor['imgurl'],400,250);?>" alt="<?php echo $met_doctor['title'];?>">

                                  <?php } ?>

                                </a>

                                <h4><a href="<?php echo $met_doctor['url'];?>" title="<?php echo $met_doctor['title'];?>"><?php echo $met_doctor['title'];?></a></h4>

                                <p class="info">

                                    <?php if($met_doctor['hospital']){ ?>

                                  <span><i class="fa fa-building-o"></i><?php echo $met_doctor['hospital'];?></span>

                                  <?php } ?>

                                    <?php if($met_doctor['fee']){ ?>

                                  <span><i class="fa fa-money"></i>挂号费 <?php echo $met_doctor['fee'];?> 元</span>

                                  <?php } ?>

                                </p>

                              </li>

                              <?php }?>

                            </ul>

                            <?php
                            if ($met_doctor_list['pages'] > 1) {
                                //分页链接：保留当前地址的其它参数，仅替换 dpage
                                $met_page_url = preg_replace('/([?&])dpage=\d+/', '', $_SERVER['REQUEST_URI']);
                                $met_page_url = str_replace('?&', '?', $met_page_url);
                                $met_page_url .= strpos($met_page_url, '?') === false ? '?' : '&';
                            ?>
                            <div class="met-yiguan-doctors-pager">
                              <ul class="pagination">
                                <?php for ($met_page_i = 1; $met_page_i <= $met_doctor_list['pages']; $met_page_i++) { ?>
                                <li class="page-item<?php echo $met_page_i == $met_doctor_list['page'] ? ' active' : ''; ?>">
                                  <a class="page-link" href="<?php echo htmlspecialchars($met_page_url . 'dpage=' . $met_page_i, ENT_QUOTES, 'UTF-8'); ?>"><?php echo $met_page_i; ?></a>
                                </li>
                                <?php } ?>
                              </ul>
                            </div>
                            <?php } ?>

                            <?php if ($met_dpage > 0) { ?>

                            <script>
                            jQuery(function ($) {
                                var $doctorTab = $('ul.met-showproduct-navtabs a[href="#product-content-doctor"]');
                                if ($doctorTab.length > 0)
                                {
                                    $doctorTab.tab('show');
                                }
                            });
                            </script>

                            <?php } ?>

                          </div>

                          <?php } ?>

                            <?php if($ui['tag_ok']){ ?>

                          <div class="tag">

                            <span><?php echo $data['tagname'];?></span>

                                    <?php
            $sub = is_array($data['taglist']) ? count($data['taglist']) : 0;
            $cycleindex = $ui['tag_num'];

            if(!is_array($data['taglist']) && $data['taglist']){
                $data['taglist'] = explode('|',$data['taglist']);
            }

            foreach ($data['taglist'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $tag = $val;
            ?>

                            <a href="<?php echo $tag['url'];?>" title="<?php echo $tag['name'];?>"><?php echo $tag['name'];?></a>

                            <?php }?>

                          </div>

                          <?php } ?>

                        </div>

                          <?php if($data['taglist']){ ?>

                        <div class="tag-box">

                          <span><?php echo $word['tagweb'];?> : </span>

                                  <?php
            $sub = is_array($data['taglist']) ? count($data['taglist']) : 0;
            $cycleindex = 50;

            if(!is_array($data['taglist']) && $data['taglist']){
                $data['taglist'] = explode('|',$data['taglist']);
            }

            foreach ($data['taglist'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $tag = $val;
            ?>

                            <a href="<?php echo $tag['url'];?>" title="<?php echo $tag['name'];?>"><?php echo $tag['name'];?></a>

                          <?php }?>

                        </div>

                        <?php } ?>

                        <div class="showproduct-pager">        <div class='met-page p-y-30 border-top1'>
            <div class="container p-t-30 ">
                <ul class="pagination block blocks-2 text-xs-center text-sm-left">
                    <li class='page-item m-b-0 <?php echo $data['preinfo']['disable'];?>'>
                        <a href='<?php if($data['preinfo']['url']){?><?php echo $data['preinfo']['url'];?><?php }else{?>javascript:;<?php }?>' title="<?php echo $data['preinfo']['title'];?>" class='page-link text-truncate' data-before="<?php echo $word['Previous_news'];?>">
                            <span aria-hidden="true" class='<?php if($data['preinfo']['url']){?>hidden-xs-down<?php }?>'><?php if($data['preinfo']['title']){?><?php echo $data['preinfo']['title'];?><?php }else{?><?php echo $word['Noinfo'];?><?php }?></span>
                        </a>
                    </li>
                    <li class='page-item m-b-0 <?php echo $data['nextinfo']['disable'];?>'>
                        <a href='<?php if($data['nextinfo']['url']){?><?php echo $data['nextinfo']['url'];?><?php }else{?>javascript:;<?php }?>' title="<?php echo $data['nextinfo']['title'];?>" class='page-link pull-xs-right text-truncate' data-before="<?php echo $word['Next_news'];?>">
                            <span aria-hidden="true" class='<?php if($data['nextinfo']['url']){?>hidden-xs-down<?php }?>'><?php if($data['nextinfo']['title']){?><?php echo $data['nextinfo']['title'];?><?php }else{?><?php echo $word['Noinfo'];?><?php }?></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div></div>

                      </div>

                    </div>

                  </div>

                </div>

              </div>

            </div> 

          </div>

            <?php if($ui['hitsok']){ ?>

          <div class="met-showproduct-foot">

            <div class="panel product-hot">

              <div class="container">

                <div class="row">

                  <div class="panel-body">

                    <h4 class="example-title"><?php echo $ui['hitsname'];?></h4>

                    <ul class="blocks-2 blocks-sm-3 blocks-lg-3" data-scale='<?php echo $v["displayimgs"][0]["x"];?>x<?php echo $v["displayimgs"][0]["y"];?>'>

                      <?php $cls=$ui['hitsid']?$ui['hitsid']:$data['classnow']; ?>

                      <?php
    $cid=$cls;
    $num = $ui['hitsnumber'];
    $module = "";
    $type = $ui['hitstype'];
    $order = 'no_order asc';
    $para = "0";
    if(!$module){
        if(!$cid){
            $value = $m['classnow'];
        }else{
            $value = $cid;
        }
    }else{
        $value = $module;
    }

    $result = load::sys_class('label', 'new')->get('tag')->get_list($value, $num, $type, $order, $para);
    $sub = is_array($result)? count($result):0;
    foreach($result as $index=>$v):
        $id = $v['id'];
        $v['sub'] = $sub;
        $v['_index']= $index;
        $v['_first']= $index==0 ? true:false;
        $v['_last']=$index==(count($result)-1)?true:false;
        $$v = $v;    
?>

                      <li>

                        <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" class="img" <?php echo $g['urlnew'];?>>

                          <img class="imgloading" data-original="<?php echo thumb($v['imgurl'],$c['met_productimg_x'],$c['met_productimg_y']);?>">

                        </a>

                        <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" class="txt" <?php echo $g['urlnew'];?>><?php echo $v['title'];?></a>

                      </li>

                      <?php endforeach;?>

                    </ul>

                  </div>

                </div>

              </div>

            </div>

          </div> 

          <?php } ?>

          <?php }else if($ui['pagetype']==2){ ?> 

          <div class="page met-showproduct pagetype<?php echo $ui['pagetype'];?> animsition" id="content-1"> 

            <nav class="navbar navbar-default" role="navigation" data-class="<?php echo $ui['fixedclass'];?>">

              <div class="container not">

                <ul class="nav navbar-toolbar pull-xs-right shop-btn-body">

                    <?php if($data['para_url']){ ?>

                          <?php
            $sub = is_array($data['para_url']) ? count($data['para_url']) : 0;
            $cycleindex = 100;

            if(!is_array($data['para_url']) && $data['para_url']){
                $data['para_url'] = explode('|',$data['para_url']);
            }

            foreach ($data['para_url'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $para_url = $val;
            ?>

                  <li class="m-r-10">

                    <div class="h-50 vertical-align">

                      <div class="vertical-align-middle">

                          <?php if($para_url['value']){ ?>

                        <a href="<?php echo $para_url['value'];?>" class="linkbox btn btn-danger" target="_blank"><?php echo $para_url['name'];?></a>

                        <?php } ?>

                      </div>

                    </div>

                  </li>

                  <?php }?>

                  <?php } ?> 

                </ul>  

                <div class="head-nav">

                  <div class="navbar-header">

                    <button type="button" class="navbar-toggle collapsed" data-target="#navbar-showproduct-pagetype2" data-toggle="collapse">

                      <span class="sr-only">Toggle navigation</span>

                      <i class="icon wb-chevron-down" aria-hidden="true"></i>

                    </button>

                    <h1 class="navbar-brand"><?php echo $data['title'];?></h1>

                  </div>

                  <div class="collapse navbar-collapse navbar-collapse-toolbar" id="navbar-showproduct-pagetype2">

                    <ul class="nav navbar-toolbar navbar-right met-showproduct-navtabs">

                              <?php
            $sub = is_array($data['contents']) ? count($data['contents']) : 0;
            $cycleindex = 50;

            if(!is_array($data['contents']) && $data['contents']){
                $data['contents'] = explode('|',$data['contents']);
            }

            foreach ($data['contents'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $s = $val;
            ?>

                        <?php if($s['content']){ ?>

                      <li class="nav-item"><a class='nav-link' href="#content<?php echo $s['_index'];?>" data-get="product-details"><?php echo $s['title'];?></a></li>

                      <?php } ?>

                      <?php }?>

                        <?php if($data['para'] && $ui['paranum']<count($data['para'])){ ?>

                      <li class="nav-item"><a class='nav-link' href="#contenti"><?php echo $ui['specpara'];?></a></li>

                      <?php } ?>

                    </ul>

                  </div>

                </div>

              </div>

            </nav>

            <div class="shownews-container full" id="met-imgs-slick">

              <div class="shownews-wrapper">

                        <?php
            $sub = is_array($data['displayimgs']) ? count($data['displayimgs']) : 0;
            $cycleindex = 50;

            if(!is_array($data['displayimgs']) && $data['displayimgs']){
                $data['displayimgs'] = explode('|',$data['displayimgs']);
            }

            foreach ($data['displayimgs'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $val = $val;
            ?>

                <div class="shownews-slide   <?php if($val["_first"]){ ?>slick-current<?php } ?>">

                  <img class="shownews-lazy" data-src="<?php echo thumb($val['img'],$c['met_productdetail_x'],$c['met_productdetail_y']);?>" data-gallery="<?php echo $val['img'];?>" alt="<?php echo $val['title'];?>" />

                </div>

                <?php }?>

              </div>

              <div class="swiper-button-next swiper-button-white"></div>

              <div class="swiper-button-prev swiper-button-white"></div>

            </div>

              <?php if($val['_index']>1){ ?>

            <div class="shownews-container-small">

              <div class="shownews-wrapper-small">

                        <?php
            $sub = is_array($data['displayimgs']) ? count($data['displayimgs']) : 0;
            $cycleindex = 50;

            if(!is_array($data['displayimgs']) && $data['displayimgs']){
                $data['displayimgs'] = explode('|',$data['displayimgs']);
            }

            foreach ($data['displayimgs'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $val = $val;
            ?>

                <div class="shownews-slide-small   <?php if($val["_first"]){ ?>active<?php } ?>">

                  <img class="shownews-lazy" data-src="<?php echo thumb($val['img'],$c['met_productdetail_x'],$c['met_productdetail_y']);?>" data-gallery="<?php echo $val['img'];?>" alt="<?php echo $val['title'];?>" />

                </div>

                <?php }?>

              </div>

            </div>

            <?php } ?>

                    <?php
            $sub = is_array($data['contents']) ? count($data['contents']) : 0;
            $cycleindex = 50;

            if(!is_array($data['contents']) && $data['contents']){
                $data['contents'] = explode('|',$data['contents']);
            }

            foreach ($data['contents'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $s = $val;
            ?>

              <?php if($s['content']){ ?>

            <div class="content content<?php echo $s['_index'];?>" id="content<?php echo $s['_index'];?>">

              <div class="container">

                <div class="row">

                  <div class="met-editor lazyload clearfix">

                    <?php echo preg_replace('/(<img[^>]*)src(=[^>]*>)/', '\\1class="imgloading" data-original\\2',$s['content']);?>

                      <?php if($data['taglist']&&$s['_last']){ ?>

                    <div class="tag-box">

                      <span><?php echo $word['tagweb'];?> : </span>

                              <?php
            $sub = is_array($data['taglist']) ? count($data['taglist']) : 0;
            $cycleindex = 50;

            if(!is_array($data['taglist']) && $data['taglist']){
                $data['taglist'] = explode('|',$data['taglist']);
            }

            foreach ($data['taglist'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $tag = $val;
            ?>

                        <a href="<?php echo $tag['url'];?>" title="<?php echo $tag['name'];?>"><?php echo $tag['name'];?></a>

                      <?php }?>

                    </div>

                    <?php } ?>

                  </div>

                </div>

              </div>

            </div>

            <?php } ?>

            <?php }?>

              <?php if($data['para'] && $ui['paranum']<count($data['para'])){ ?>

            <div class="content contenti" id="contenti">

              <div class="container">      

                <ul class="product-para paralist blocks-100 blocks-md-2 blocks-lg-3 blocks-xxl-2">

                          <?php
            $sub = is_array($data['para']) ? count($data['para']) : 0;
            $cycleindex = 50;

            if(!is_array($data['para']) && $data['para']){
                $data['para'] = explode('|',$data['para']);
            }

            foreach ($data['para'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $s = $val;
            ?>

                    <?php if(!($s['_index']<$ui['paranum'])){ ?>

                  <li class="p-x-0 m-b-15"><span><?php echo $s['name'];?>：</span> <?php echo $s['value'];?></li>

                  <?php } ?>

                  <?php }?>

                </ul>

              </div>

            </div>

            <?php } ?>

          </div> 

          <?php } ?>

        </div>

      </div>

  <?php if(!$ui['has']['sidebar']){ ?>

    </div>

  </div>

</section>

<?php } ?>