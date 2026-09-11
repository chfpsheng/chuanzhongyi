<?php defined('IN_MET') or exit('No permission'); ?>
<footer class="$uicss   <?php if($ui["contenttype"]){ ?>lr<?php } ?>" m-id="<?php echo $ui['mid'];?>" m-type="foot">
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
<div class="$uicss_bottom text-xs-center   <?php if($_M['form']['pageset']){ ?>iskeshi<?php } ?>" m-id='<?php echo $ui['mid'];?>' data-bg="<?php echo $ui['bottombgc'];?>|<?php echo $g['thirdcolor'];?>|<?php echo $ui['opacity'];?>" data-ifbotc="<?php echo $ui['bottombgc'];?>">
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