
        <?php
            $id = 9;
            $panrent_name = 'foot_nav';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<section class="foot_nav_met_m1156_7_9" m-id="<?php echo $ui['mid'];?>" m-type="foot">
  <div class="  <?php if(!$ui["full"]){ ?>container<?php }else{ ?>container-fluid<?php } ?>"> 
    <div class="foot-content">
      <div class="foot-nav" m-id="noset" m-type="foot_nav">
        <ul class="foot-nav-wraper">
          <?php
    $type=strtolower(trim('foot'));
    $cid = 0;
    $num = 1000;
    if(!isset($column)){
        $column = load::sys_class('label', 'new')->get('column');
    }
    $result = $column->get_column_by_type($type,$cid,$num);
    
    $sub = is_array($result) ? count($result) : 0;
    foreach($result as $index=>$m):
        if($m['display'] == 1){
            continue;
        }
          
        if($data['module'] == 10001){
            $m['url'] = str_replace(array('../',$_M['url']['site']),'',$m['url']);
            $m['content'] = str_replace(array('../',$_M['url']['site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['site']),'',$m['columnimg']);
        }
        
        if($data['module'] == 404){
            $m['url'] = str_replace(array('../',$_M['url']['web_site']),'',$m['url']);
            if(!strstr($m['url'],'http')){
                $m['url'] = $_M['url']['web_site'] . $m['url'];
            }
            $m['content'] = str_replace(array('../',$_M['url']['web_site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['columnimg']);
        }
        
        $hides = 1;
        $hide = explode("|",$hides);
        $m['_index']= $index;
        if($data['classnow']==$m['id'] || $data['class1']==$m['id'] || $data['class2']==$m['id'] || $data['releclass'] == $m['id']){
            $m['class']="''";
        }else{
            $m['class'] = '';
        }
        
        //产品所属多个栏目时
        if($data['module']==3 && $data['page_type']=='showpage' && $data['classother']){
            if(strpos($data['classother'],'-'.$m['id'].'-')){
                $m['class']="''";
            }
        }
        
        if(in_array(replaceTagm($m['name']),$hide)){
            unset($m['id']);
            $m['hide'] = $hide;
            $m['sub'] = 0;
        }

        if(substr(trim($m['icon']),0,1) == 'm' || substr(trim($m['icon']),0,1) == ''){
            $m['icon'] = 'icon fa-pencil-square-o '.$m['icon'];
        }
        $m['urlnew'] = $m['new_windows'] ? "target='_blank'" :"target='_self'";
        $m['urlnew'] = $m['nofollow'] ? $m['urlnew']." rel='nofollow'" :$m['urlnew'];
        $m['_first']=$index==0 ? true:false;
        $m['_last']=$index==($sub-1)?true:false;
        $$m = $m;
        
        $result[$index] = $m;
?>
          <li class="foot-nav-slide">
            <b><a href="  <?php if($data["classnow"]==10001){ ?><?php echo str_replace('../','',$m['url']);?><?php }else{ ?><?php echo $m['url'];?><?php } ?>" <?php echo $m['urlnew'];?> title="<?php echo $m['name'];?>"><?php echo $m['name'];?></a></b>
              <?php if($m['sub']&&$ui['nav2ok']){ ?> 
            <ol>
              <?php
    $type=strtolower(trim('son'));
    $cid = $m['id'];
    $num = 1000;
    if(!isset($column)){
        $column = load::sys_class('label', 'new')->get('column');
    }
    $result = $column->get_column_by_type($type,$cid,$num);
    
    $sub = is_array($result) ? count($result) : 0;
    foreach($result as $index=>$m):
        if($m['display'] == 1){
            continue;
        }
          
        if($data['module'] == 10001){
            $m['url'] = str_replace(array('../',$_M['url']['site']),'',$m['url']);
            $m['content'] = str_replace(array('../',$_M['url']['site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['site']),'',$m['columnimg']);
        }
        
        if($data['module'] == 404){
            $m['url'] = str_replace(array('../',$_M['url']['web_site']),'',$m['url']);
            if(!strstr($m['url'],'http')){
                $m['url'] = $_M['url']['web_site'] . $m['url'];
            }
            $m['content'] = str_replace(array('../',$_M['url']['web_site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['columnimg']);
        }
        
        $hides = 1;
        $hide = explode("|",$hides);
        $m['_index']= $index;
        if($data['classnow']==$m['id'] || $data['class1']==$m['id'] || $data['class2']==$m['id'] || $data['releclass'] == $m['id']){
            $m['class']="''";
        }else{
            $m['class'] = '';
        }
        
        //产品所属多个栏目时
        if($data['module']==3 && $data['page_type']=='showpage' && $data['classother']){
            if(strpos($data['classother'],'-'.$m['id'].'-')){
                $m['class']="''";
            }
        }
        
        if(in_array(replaceTagm($m['name']),$hide)){
            unset($m['id']);
            $m['hide'] = $hide;
            $m['sub'] = 0;
        }

        if(substr(trim($m['icon']),0,1) == 'm' || substr(trim($m['icon']),0,1) == ''){
            $m['icon'] = 'icon fa-pencil-square-o '.$m['icon'];
        }
        $m['urlnew'] = $m['new_windows'] ? "target='_blank'" :"target='_self'";
        $m['urlnew'] = $m['nofollow'] ? $m['urlnew']." rel='nofollow'" :$m['urlnew'];
        $m['_first']=$index==0 ? true:false;
        $m['_last']=$index==($sub-1)?true:false;
        $$m = $m;
        
        $result[$index] = $m;
?>
              <li><a href="  <?php if($data["classnow"]==10001){ ?><?php echo str_replace('../','',$m['url']);?><?php }else{ ?><?php echo $m['url'];?><?php } ?>" <?php echo $m['urlnew'];?> title="<?php echo $m['name'];?>"><?php echo $m['name'];?></a></li>
              <?php endforeach;?>
            </ol>
            <?php } ?>
          </li>
          <?php endforeach;?>
        </ul>
      </div>  
      <div class="foot-text">
        <span><?php echo $ui['phonetel'];?></span>
        <b><a href="tel:<?php echo $ui['info_tel'];?>" title="<?php echo $ui['info_tel'];?>"><?php echo $ui['info_tel'];?></a></b>
        <i><?php echo $ui['info_dsc'];?></i>
        <p>
          <?php
    $type=strtolower(trim('son'));
    $cid = $ui['iconid'];
    $num = 1000;
    if(!isset($column)){
        $column = load::sys_class('label', 'new')->get('column');
    }
    $result = $column->get_column_by_type($type,$cid,$num);
    
    $sub = is_array($result) ? count($result) : 0;
    foreach($result as $index=>$m):
        if($m['display'] == 1){
            continue;
        }
          
        if($data['module'] == 10001){
            $m['url'] = str_replace(array('../',$_M['url']['site']),'',$m['url']);
            $m['content'] = str_replace(array('../',$_M['url']['site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['site']),'',$m['columnimg']);
        }
        
        if($data['module'] == 404){
            $m['url'] = str_replace(array('../',$_M['url']['web_site']),'',$m['url']);
            if(!strstr($m['url'],'http')){
                $m['url'] = $_M['url']['web_site'] . $m['url'];
            }
            $m['content'] = str_replace(array('../',$_M['url']['web_site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['columnimg']);
        }
        
        $hides = 1;
        $hide = explode("|",$hides);
        $m['_index']= $index;
        if($data['classnow']==$m['id'] || $data['class1']==$m['id'] || $data['class2']==$m['id'] || $data['releclass'] == $m['id']){
            $m['class']="''";
        }else{
            $m['class'] = '';
        }
        
        //产品所属多个栏目时
        if($data['module']==3 && $data['page_type']=='showpage' && $data['classother']){
            if(strpos($data['classother'],'-'.$m['id'].'-')){
                $m['class']="''";
            }
        }
        
        if(in_array(replaceTagm($m['name']),$hide)){
            unset($m['id']);
            $m['hide'] = $hide;
            $m['sub'] = 0;
        }

        if(substr(trim($m['icon']),0,1) == 'm' || substr(trim($m['icon']),0,1) == ''){
            $m['icon'] = 'icon fa-pencil-square-o '.$m['icon'];
        }
        $m['urlnew'] = $m['new_windows'] ? "target='_blank'" :"target='_self'";
        $m['urlnew'] = $m['nofollow'] ? $m['urlnew']." rel='nofollow'" :$m['urlnew'];
        $m['_first']=$index==0 ? true:false;
        $m['_last']=$index==($sub-1)?true:false;
        $$m = $m;
        
        $result[$index] = $m;
?>
          <a   <?php if($_GET['pageset']||($m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img'])))){ ?>href="javascript:void(0);"<?php }else{ ?>href="<?php echo $m['url'];?>"<?php } ?> data-id="<?php echo $m['id'];?>" rel="nofollow" target="_blank">
              <?php if($_GET['pageset']||($m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img'])))){ ?>
            <span><img src="<?php echo $m['columnimg'];?>" alt="<?php echo $m['name'];?>"></span>
            <?php } ?>
            <font class="<?php echo $m['icon'];?>"></font>
          </a>
          <?php endforeach;?>
        </p>
      </div>    
    </div>
  </div>
</section>

        <?php
            $id = 10;
            $panrent_name = 'foot_info';
            $style = 'met_m1156_5';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<footer class="foot_info_met_m1156_5_10   <?php if($ui["contenttype"]){ ?>lr<?php } ?>" m-id="<?php echo $ui['mid'];?>" m-type="foot">
  <div class="container">
    <div class="foot-left">
        <?php if($ui['navok']){ ?>
      <div class="foot-nav" m-id="noset" m-type="foot_nav">
        <?php
    $type=strtolower(trim('foot'));
    $cid = 0;
    $num = 1000;
    if(!isset($column)){
        $column = load::sys_class('label', 'new')->get('column');
    }
    $result = $column->get_column_by_type($type,$cid,$num);
    
    $sub = is_array($result) ? count($result) : 0;
    foreach($result as $index=>$m):
        if($m['display'] == 1){
            continue;
        }
          
        if($data['module'] == 10001){
            $m['url'] = str_replace(array('../',$_M['url']['site']),'',$m['url']);
            $m['content'] = str_replace(array('../',$_M['url']['site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['site']),'',$m['columnimg']);
        }
        
        if($data['module'] == 404){
            $m['url'] = str_replace(array('../',$_M['url']['web_site']),'',$m['url']);
            if(!strstr($m['url'],'http')){
                $m['url'] = $_M['url']['web_site'] . $m['url'];
            }
            $m['content'] = str_replace(array('../',$_M['url']['web_site']),'',$m['content']);
            $m['indeximg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['indeximg']);
            $m['columnimg'] = str_replace(array('../',$_M['url']['web_site']),'',$m['columnimg']);
        }
        
        $hides = 1;
        $hide = explode("|",$hides);
        $m['_index']= $index;
        if($data['classnow']==$m['id'] || $data['class1']==$m['id'] || $data['class2']==$m['id'] || $data['releclass'] == $m['id']){
            $m['class']="''";
        }else{
            $m['class'] = '';
        }
        
        //产品所属多个栏目时
        if($data['module']==3 && $data['page_type']=='showpage' && $data['classother']){
            if(strpos($data['classother'],'-'.$m['id'].'-')){
                $m['class']="''";
            }
        }
        
        if(in_array(replaceTagm($m['name']),$hide)){
            unset($m['id']);
            $m['hide'] = $hide;
            $m['sub'] = 0;
        }

        if(substr(trim($m['icon']),0,1) == 'm' || substr(trim($m['icon']),0,1) == ''){
            $m['icon'] = 'icon fa-pencil-square-o '.$m['icon'];
        }
        $m['urlnew'] = $m['new_windows'] ? "target='_blank'" :"target='_self'";
        $m['urlnew'] = $m['nofollow'] ? $m['urlnew']." rel='nofollow'" :$m['urlnew'];
        $m['_first']=$index==0 ? true:false;
        $m['_last']=$index==($sub-1)?true:false;
        $$m = $m;
        
        $result[$index] = $m;
?>
        <a href="<?php echo $m['url'];?>" <?php echo $m['urlnew'];?> title="<?php echo $m['name'];?>"><?php echo $m['name'];?></a>
        <?php endforeach;?>
      </div>
      <?php } ?>
        <?php if($ui['linkok']){ ?>
      <div class="text-link" m-id="noset" m-type="link">
        <ul>
          <li><?php echo $ui['linktitle'];?></li>
          <?php
    $result = load::sys_class('label', 'new')->get('link')->get_link_list($data['classnow']);
    $sub = is_array($result) ? count($result) : 0;
     foreach($result as $index=>$v):
         if($data['module'] == 10001){
             $v['weburl']   = \str_replace(array('../',$_M['url']['site']),'',$v['weburl']);
         }
        $v['sub']      = $sub;
        $v['_index']   = $index;
        $v['_first']   = $index == 0 ? true:false;
        $v['_last']    = $index == (count($result)-1) ? true : false;
        $v['nofollow'] = $v['nofollow'] ? "rel='nofollow'" : '';
?>
          <li>
            <a href="<?php echo $v['weburl'];?>" title="<?php echo $v['webname'];?>" target="_blank">
                <?php if($v['link_type']==1){ ?>
              <img src="<?php echo $v['weblogo'];?>" alt="<?php echo $v['webname'];?>">
              <?php }else{ ?>
              <span><?php echo $v['webname'];?></span>
              <?php } ?>
            </a>
          </li>
          <?php endforeach;?>
        </ul>
      </div>
      <?php } ?>
      <div class="foot-copyright">
          <?php if($c['met_footaddress']){ ?><p><?php echo $c['met_footaddress'];?></p><?php } ?>
          <?php if($c['met_foottel']){ ?><p><?php echo $c['met_foottel'];?></p><?php } ?>
          <?php if($c['met_footother']){ ?><?php echo $c['met_footother'];?><?php } ?>
          <?php if($c['met_footright']||$c['met_footstat']){ ?><p><?php echo $c['met_footright'];?></p><?php } ?>
      </div>
        <?php if(($ui['simok']&&$c['met_ch_lang']&&$data['lang']=='cn')||($c['met_lang_mark']&&$ui['langok'])){ ?>
      <div class="foot-lang" m-type="lang" m-id="0">
          <?php if($ui['simok']&&$c['met_ch_lang']&&$data['lang']=='cn'){ ?>
        <a href="javascript:void(0);" class="simplified" title="设置页面显示为繁体中文">
          <i>繁</i>
        </a>
        <?php } ?>
          <?php if($c['met_lang_mark']&&$ui['langok']){ ?>
                <?php
            $language = load::sys_class('label', 'new')->get('language')->get_lang();

            $sub = is_array($language) ? count($language) : 0;
            $i = 0;
            foreach($language as $index=>$v):
                $v['_index']   = $index;
                $v['_first']   = $i == 0 ? true:false;
                $v['_last']    = $index == (count($language)-1) ? true : false;
                $v['sub'] = $sub;
                $i++;
        ?><?php endforeach;?>
          <?php if($sub>1){ ?>
                <?php
            $language = load::sys_class('label', 'new')->get('language')->get_lang();

            $sub = is_array($language) ? count($language) : 0;
            $i = 0;
            foreach($language as $index=>$v):
                $v['_index']   = $index;
                $v['_first']   = $i == 0 ? true:false;
                $v['_last']    = $index == (count($language)-1) ? true : false;
                $v['sub'] = $sub;
                $i++;
        ?>
          <?php if($data['lang']==$v['mark']){ ?>
        <a href="javascript:void(0);" class="lang" data-toggle="modal" data-target="#met-langlist-modal">
            <?php if($ui['langqiok']){ ?><i class="flag-icon flag-icon-<?php echo $v['iconname'];?>"></i><?php } ?>
          <b><?php echo $v['name'];?></b>
        </a>
        <?php } ?>
        <?php endforeach;?>
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
    <div class="foot-right">
        <?php if($c['met_foottext']||$_GET['pageset']){ ?>
      <div class="foot-text" m-id="noset" m-type="head_seo">
          <?php if($c['met_foottext']){ ?><?php echo $c['met_foottext'];?><?php }else{ ?><u>点击添加【网站底部优化字】内容（该文字仅“可视化”模式下可见）！</u><?php } ?>
      </div>
      <?php } ?>
      <div class="powered_by_metinfo"><?php echo $c['met_agents_copyright_foot'];?></div>
    </div>
  </div>
    <?php if($ui['boticon_ok'] || $_M['form']['pageset']){ ?>
  <div class="hasbottom   <?php if($_M['form']['pageset']){ ?>iskeshi<?php } ?>"></div>
  <?php } ?>
</footer>
  <?php if($c['met_lang_mark']&&$ui['langok']){ ?>
<div class="modal fade modal-3d-flip-vertical" id="met-langlist-modal" aria-hidden="true" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-center modal-lg">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
        </button>
        <div class="row">
                  <?php
            $language = load::sys_class('label', 'new')->get('language')->get_lang();

            $sub = is_array($language) ? count($language) : 0;
            $i = 0;
            foreach($language as $index=>$v):
                $v['_index']   = $index;
                $v['_first']   = $i == 0 ? true:false;
                $v['_last']    = $index == (count($language)-1) ? true : false;
                $v['sub'] = $sub;
                $i++;
        ?>
          <div class="col-md-4 col-sm-6 col-xs-12 lang-button">
            <a href="<?php echo $v['met_weburl'];?>" class="btn btn-block btn-outline btn-default btn-squared text-nowrap" title="<?php echo $v['name'];?>">
                <?php if($ui['langqiok']){ ?><i class="flag-icon flag-icon-<?php echo $v['iconname'];?>"></i><?php } ?>
              <b><?php echo $v['name'];?></b>
            </a>
          </div>
          <?php endforeach;?>
        </div>
      </div>
    </div>
  </div>
</div>
<?php } ?>


<?php
if($_M['form']['pageset']){
    $pullpage_id = explode("<m",$ui['iconone']);
    $pullpage_id = $pullpage_id[0];

    $pullpage_id2 = explode("<m",$ui['icontwo']);
    $pullpage_id2 = $pullpage_id2[0];

    $pullpage_id3 = explode("<m",$ui['iconthird']);
    $pullpage_id3 = $pullpage_id3[0];

    $pullpage_id4 = explode("<m",$ui['iconfour']);
    $pullpage_id4 = $pullpage_id4[0];
}else{
    $pullpage_id = $ui['iconone'];

    $pullpage_id2 = $ui['icontwo'];

    $pullpage_id3 = $ui['iconthird'];

    $pullpage_id4 = $ui['iconfour'];
}

?>
  <?php if($ui['boticon_ok'] || $_M['form']['pageset']){ ?>
<div class="foot_info_met_m1156_5_10_bottom text-xs-center   <?php if($_M['form']['pageset']){ ?>iskeshi<?php } ?>" m-id='<?php echo $ui['mid'];?>' data-bg="<?php echo $ui['bottombgc'];?>|<?php echo $g['thirdcolor'];?>|<?php echo $ui['opacity'];?>" data-ifbotc="<?php echo $ui['bottombgc'];?>">
    <div class="main">
      <?php if($ui['icononet']){ ?>
    <div class="">
        <a href="<?php echo $ui['icononelink'];?>" class="item" target="_blank">
            <i class="fa fa-<?php echo $pullpage_id;?>"></i>
            <span><?php echo $ui['icononet'];?></span>
        </a>
    </div>
    <?php } ?>
      <?php if($ui['icontwot']){ ?>
    <div class="">
        <a href="<?php echo $ui['icontwolink'];?>" class="item" target="_blank">
            <i class="fa fa-<?php echo $pullpage_id2;?>"></i>
            <span><?php echo $ui['icontwot'];?></span>
        </a>
    </div>
    <?php } ?>
      <?php if($ui['iconthirdt']){ ?>
    <div class="">
        <a href="<?php echo $ui['iconthirdlink'];?>" class="item" target="_blank">
            <i class="fa fa-<?php echo $pullpage_id3;?>"></i>
            <span><?php echo $ui['iconthirdt'];?></span>
        </a>
    </div>
    <?php } ?>
      <?php if($ui['iconfourt']){ ?>
    <div class="">
        <a href="<?php echo $ui['iconfourlink'];?>" class="item" target="_blank">
            <i class="fa fa-<?php echo $pullpage_id4;?>"></i>
            <span><?php echo $ui['iconfourt'];?></span>
        </a>
    </div>
    <?php } ?>
    </div>
</div>
<?php } ?>

        <?php
            $id = 50;
            $panrent_name = 'back_top';
            $style = 'met_m1156_1';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<button class="back_top_met_m1156_1_50   <?php if($_GET["pageset"]){ ?>active<?php } ?>" number="<?php echo $ui['number'];?>" m-id="<?php echo $ui['mid'];?>" m-type="nocontent"></button>
<input type="hidden" name="met_lazyloadbg" value="<?php echo $g['lazyloadbg'];?>">
<?php if($data["module"]==3&&$data["id"]){ ?>
<textarea name="met_product_video" data-playinfo="<?php echo $c['met_auto_play_pc'];?>|<?php echo $c['met_auto_play_mobile'];?>|<?php echo $c['met_auto_close'];?>|<?php echo $c['met_auto_show'];?>" hidden><?php echo $data['video'];?></textarea>
<?php
}
if($c["shopv2_open"]){
    $data["shop_goods"]=$data["shop_goods"]?$data["shop_goods"]:0;
?>
<script>
var jsonurl="<?php echo $url['shop_cart_jsonlist'];?>",
    totalurl="<?php echo $url['shop_cart_modify'];?>",
    delurl="<?php echo $url['shop_cart_del'];?>",
    price_prefix="<?php echo $c['shopv2_price_str_prefix'];?>",
    price_suffix="<?php echo $c['shopv2_price_str_suffix'];?>",
    shop_goods=<?php echo $data['shop_goods'];?>;
</script>
<?php
}
$met_lang_time = filemtime(PATH_WEB."cache/lang_json_".$_M["lang"].".js");
?>
<script src="<?php echo $url['site'];?>cache/lang_json_<?php echo $_M["lang"];?>.js?<?php echo $met_lang_time;?>"></script>
<?php
if(!$c["disable_cssjs"]){
    if(is_file(PATH_TEM."cache/".$c["met_skin_user"].".js")){
        $common_js_time = filemtime(PATH_TEM."cache/".$c["met_skin_user"].".js");
        $metpagejs=$c["met_skin_user"].".js?".$common_js_time;
    }
    if($met_page){
        $page_js_time = filemtime(PATH_TEM."cache/".$met_page."_".$_M["lang"].".js");
        $metpagejs=$met_page."_".$_M["lang"].".js?".$page_js_time;
    }
    $basic_js_name=$metinfover_v2?"":"_web";
    if($c["temp_frame_version"]=="v2") $basic_js_name.="_v2";
    $basic_js_time = filemtime(PATH_PUBLIC_THIRD."web/basic".$basic_js_name.".js");
    $metinfo_js_time = filemtime(PATH_PUBLIC_WEB."js/metinfo.js");
?>
<script src="<?php echo $url['public_third'];?>web/basic<?php echo $basic_js_name;?>.js?<?php echo $basic_js_time;?>"></script>
<script src="<?php echo $url['public_web'];?>js/metinfo.js?<?php echo $metinfo_js_time;?>" data-js_url="<?php echo $url['site'];?>templates/<?php echo $c['met_skin_user'];?>/cache/<?php echo $metpagejs;?>" id="met-page-js"></script>
<?php
}
if($c["shopv2_open"]){
    $shop_js_filemtime = filemtime(PATH_ALL_APP."shop/web/templates/met/js/own.js");
    if($metinfover_v2){
        $app_js_filemtime = filemtime(PATH_PUBLIC_WEB."js/app.js");
?>
<script src="<?php echo $url['public_web'];?>js/app.js?<?php echo $app_js_filemtime;?>"></script>
<?php } ?>
<script src="<?php echo $url['shop_ui'];?>js/own.js?<?php echo $shop_js_filemtime;?>"></script>
<?php
}
if(is_mobile() && $c["met_footstat_mobile"]){
?>
<?php echo $c['met_footstat_mobile'];?>

<?php }else if(!is_mobile() && $c["met_footstat"]){ ?>
<?php echo $c['met_footstat'];?>

<?php
}
if($_M["html_plugin"]["foot_script"]){
?>
<?php echo $_M["html_plugin"]["foot_script"];?>

<?php
}
?></body>
</html>