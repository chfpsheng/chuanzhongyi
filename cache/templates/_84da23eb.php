<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss   <?php if($ui["fixed"]){ ?>fixed<?php } ?>" m-id="<?php echo $ui['mid'];?>" m-type="head_nav">
  <?php if($ui['top_ok']){ ?>
<header role="heading">
  <div class="head-box">
    <div class="container">
      <div class="head-left">
        <div class="head-left-wrapper">
          <div class="head-left-slide">
            <?php echo $c['met_seo'];?>
            <font>
            <?php
    $type=strtolower(trim('son'));
    $cid = $ui['icon_id'];
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
            <hr>
            <a   <?php if($m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img']))){ ?>href="javascript:void(0);" data-id="<?php echo $m['id'];?>"<?php }else{ ?>href="<?php echo $m['url'];?>" rel="nofollow" target="_blank"<?php } ?>>
              <i class="<?php echo $m['icon'];?>"></i>
            </a>
            <?php endforeach;?>
            </font>
          </div>
        </div>
      </div>
      <div class="head-left-img">
        <?php
    $type=strtolower(trim('son'));
    $cid = $ui['icon_id'];
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
            <?php if($_GET['pageset']||($m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img'])))){ ?>
          <img id="<?php echo $m['id'];?>" src="<?php echo $m['columnimg'];?>" alt="<?php echo $m['name'];?>">
          <?php } ?>
        <?php endforeach;?>
      </div>
      <div class="head-right">
        <div class="head-other">
          <b><?php echo $ui['right_more'];?><i class="caret"></i></b>
          <span>
          <?php
    $type=strtolower(trim('son'));
    $cid = $ui['right_id'];
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
            <?php if(!$m['_first']){ ?><hr /><?php } ?>
          <a href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>><i class="<?php echo $m['icon'];?>"></i><?php echo $m['name'];?></a>
          <?php endforeach;?>
          </span>
        </div>
      </div>
    </div>
  </div>
</header>
<?php } ?>
<nav class=" navbar navbar-default met-nav " role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle hamburger hamburger-close collapsed"
				data-target="#navbar-default-collapse" data-toggle="collapse">
      <span class="sr-only">&nbsp;</span>
      <span class="hamburger-bar"></span>
      </button>
      <a href="<?php echo $c['index_url'];?>" class="navbar-brand navbar-logo vertical-align" title="<?php echo $c['met_webname'];?>">
          <?php if($data['classnow']==10001){ ?>
            <h1 hidden><?php echo $c['met_webname'];?></h1>
            <?php }else{ ?>
            <h3 hidden><?php echo $c['met_webname'];?></h3>
        <?php } ?>
          <?php if(($data['classnow']<>10001&&!$data['id'])||$data['module']==1){ ?>
            <h1 hidden><?php echo $data['name'];?></h1>
              <?php if($data['classtype']<>1){ ?>
                <?php
    $type=strtolower(trim('current'));
    $cid = $data['class1'];
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
                    <h2 hidden><?php echo $m['name'];?></h2>
                <?php endforeach;?>
            <?php } ?>
            <?php }else{ ?>
              <?php if(!$data['id']&&$data['classnow']<>10001){ ?>
                <h1 hidden><?php echo $data['name'];?></h1>
            <?php } ?>
        <?php } ?>
        <div class="vertical-align-middle">
          <img src="<?php echo $c['met_logo'];?>" alt="<?php echo $c['met_logo_keyword'];?>" class="hidden-sm-down">
          <img src="<?php echo $c['met_mobile_logo'];?>" alt="<?php echo $c['met_logo_keyword'];?>" class="hidden-md-up">
        </div>
      </a>
    </div>
    <div class="navbar-right vertical-align m-r-0 met-lang">
          <?php if($c['met_ch_lang'] && $ui['s2t_ok']){ ?>
                <li class="met-langlist met-s2t nav-item vertical-align nav-item" m-id="lang" m-type="lang">
                <div class="inline-block link">
                      <?php if($data['lang']==cn){ ?>
                    <button type="button" class="btn btn-outline btn-default btn-squared btn-lang btn-cntotc" data-tolang='tc'>繁体</button>
                    <?php }else if($data['lang']==tc){ ?>
                    <button type="button" class="btn btn-outline btn-default btn-squared btn-lang btn-cntotc"  data-tolang='cn'>简体</button>
                    <?php } ?>
                </div>
            	</li>
        <?php } ?>
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
          <?php if($c['met_lang_mark'] && $sub>1 && $ui['lang_ok']){ ?>
              <li class="met-langlist nav-item vertical-align" m-id='lang' m-type='lang'>
                  <div class="inline-block dropdown ">
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
                        <?php if(($sub>2)?($data['lang']==$v['mark']):$data['lang']<>$v['mark']){ ?>
                        <?php if($sub>2){ ?>
                      <button type="button" data-toggle="dropdown" class="btn btn-outline btn-default btn-squared dropdown-toggle btn-lang">
                      <?php }else{ ?>
                      <a href="<?php echo $v['met_weburl'];?>" title="<?php echo $v['name'];?>"   <?php if($v['newwindows']){ ?>target="_blank"<?php } ?> class="btn btn-outline btn-default btn-squared btn-lang">
                      <?php } ?>
                          <img src="<?php echo $v['flag'];?>" alt="<?php echo $v['name'];?>" style="max-width:100%;">
                          <span ><?php echo $v['name'];?></span>
                         <?php if($sub>2){ ?></button><?php }else{ ?></a><?php } ?>
                      <?php } ?>
                      <?php endforeach;?>
                        <?php if($sub>2){ ?>
                      <div class="dropdown-menu dropdown-menu-right animate animate-reverse" id="met-langlist-dropdown" role="menu">
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
                            <?php if($data['lang']<>$v['mark']){ ?>
                          <a href="<?php echo $v['met_weburl'];?>" title="<?php echo $v['name'];?>" class='dropdown-item'   <?php if($v['newwindows']){ ?>target="_blank"<?php } ?>>
                              <img src="<?php echo $v['flag'];?>" alt="<?php echo $v['name'];?>" style="max-width:100%;">
                              <?php echo $v['name'];?>
                          </a>
                          <?php } ?>
                          <?php endforeach;?>
                      </div>
                      <?php } ?>
                  </div>
              </li>
        <?php } ?>
    </div>
    <div class="collapse navbar-collapse navbar-collapse-toolbar" id="navbar-default-collapse">
        <?php if($ui['user_ok']){ ?>
        <?php if($user){ ?>
        <?php if($c['shopv2_open']){ ?>
          <ul class="navbar-nav navbar-right vertical-align p-l-0 m-b-0 met-head-user met-head-shop" m-id="member" m-type="member">
              <li class="dropdown">
                  <a
                      href="javascript:;"
                      class="navbar-avatar dropdown-toggle"
                      data-toggle="dropdown"
                      aria-expanded="false"
                  >
                  <span class="avatar avatar-online m-r-5"><img src="<?php echo $user['head'];?>" alt="<?php echo $user['username'];?>"/></span>
                      <?php echo $user['username'];?>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-right animate" role="menu">
                      <?php
    $result = load::mod_class('column/ifcolumn_database','new')->getLeftColumn();
    $sub = is_array($result) ? count($result) : 0;
    foreach($result as $index=>$v):
        $id = $v['id'];
        $v['sub'] = $sub;
        $v['_index']= $index;
        $v['_first']= $index==0 ? true:false;
        $v['_last']=$index==(count($result)-1)?true:false;
        $v['active']=($_M['config']['app_no']==$v['no']&&$_M['config']['own_order']==$v['own_order'])?'active':'';
        $v['target']=$v['target']?'target="_blank"':'';
        $$v = $v;
?>
                       <li role="presentation">
                          <a href="<?php echo $v['url'];?>" class="dropdown-item" <?php echo $v['target'];?>><i class="icon wb-settings" aria-hidden="true"></i> <?php echo $v['title'];?></a>
                      </li>
                      <?php endforeach;?>
                      <li class="divider" role="presentation"></li>
                      <li role="presentation">
                          <a href="<?php echo $url['shop_member_login_out'];?>" class="dropdown-item" role="menuitem"><i class="icon wb-power" aria-hidden="true"></i> <?php echo $word['app_shop_out'];?></a>
                      </li>
                  </ul>
              </li>
              <li class="dropdown shop_cart">
                  <a
                      href="javascript:void(0)"
                      title="<?php echo $word['app_shop_cart'];?>"
                      data-toggle="dropdown"
                      aria-expanded="false"
                      data-animation="slide-bottom10"
                      role="button"
                  >
                      <i class="icon wb-shopping-cart" aria-hidden="true"></i>
                      <?php echo $word['app_shop_cart'];?>
                      <span class="badge badge-danger up hide topcart-goodnum"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media topcartremove" role="menu">
                      <li class="dropdown-menu-header">
                          <h5><?php echo $word['app_shop_cart'];?></h5>
                          <span class="label label-round label-danger"><?php echo $word['app_shop_intotal'];?> <span class="topcart-goodnum"></span> <?php echo $word['app_shop_piece'];?><?php echo $word['app_shop_commodity'];?></span>
                      </li>
                      <li class="list-group dropdown-scrollable" role="presentation">
                          <div data-role="container">
                              <div data-role="content" id="topcart-body"></div>
                          </div>
                      </li>
                      <li class="dropdown-menu-footer" role="presentation">
                          <div class="dropdown-menu-footer-btn">
                              <a href="<?php echo $url['shop_cart'];?>" class="btn btn-squared btn-danger margin-bottom-5 margin-right-10"><?php echo $word['app_shop_gosettlement'];?></a>
                          </div>
                          <span class="red-600 font-size-18 topcarttotal"></span>
                      </li>
                  </ul>
              </li>
          </ul>
          <?php }else{ ?>
          <ul class="navbar-nav navbar-right vertical-align p-l-0 m-b-0 met-head-user" m-id="member" m-type="member">
              <li class="dropdown">
                  <a
                      href="javascript:;"
                      class="navbar-avatar dropdown-toggle"
                      data-toggle="dropdown"
                      aria-expanded="false"
                  >
                  <span class="avatar avatar-online m-r-5"><img src="<?php echo $user['head'];?>" alt="<?php echo $user['username'];?>"/></span>
                      <?php echo $user['username'];?>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-right animate">
                      <li role="presentation">
                          <a href="<?php echo $c['met_weburl'];?>member/basic.php?lang=<?php echo $_M['lang'];?>" class="dropdown-item" title='<?php echo $word['memberIndex9'];?>' role="menuitem"><i class="icon wb-user" aria-hidden="true"></i> <?php echo $word['memberIndex9'];?></a>
                      </li>
                      <li role="presentation">
                          <a href="<?php echo $c['met_weburl'];?>member/basic.php?lang=<?php echo $_M['lang'];?>&a=dosafety" class="dropdown-item" title='<?php echo $word['accsafe'];?>' role="menuitem"><i class="icon wb-lock" aria-hidden="true"></i> <?php echo $word['accsafe'];?></a>
                      </li>
                      <li class="divider" role="presentation"></li>
                      <li role="presentation">
                          <a href="<?php echo $c['met_weburl'];?>member/login.php?lang=<?php echo $_M['lang'];?>&a=dologout" class="dropdown-item" role="menuitem"><i class="icon wb-power" aria-hidden="true"></i> <?php echo $word['memberIndex10'];?></a>
                      </li>
                  </ul>
              </li>
          </ul>
      <?php } ?>
      <?php }else{ ?>
      <div class="navbar-nav navbar-right vertical-align met-nav-login">
        <div class="vertical-align-middle m-r-10">
             <a href="<?php echo $_M['url']['site'];?>member/register_include.php?lang=<?php echo $_M['lang'];?>" class="btn btn-squared btn-success"><?php echo $word['register'];?></a>
        </div>
        <div class="vertical-align-middle">
              <a href="<?php echo $_M['url']['site'];?>member/login.php?lang=<?php echo $_M['lang'];?>" class="btn btn-squared btn-primary btn-outline"><?php echo $word['login'];?></a>
        </div>
      </div>
      <?php } ?>
      <?php } ?>
        <?php if($ui['search_ok']){ ?>
      <div class="navbar-right search-box   <?php if(($sub>1 && $ui["lang_ok"]) && $ui["user_ok"]){ ?>go<?php } ?>">
        <div class="search-button">
          <i class="wb-search"></i>
        </div>
        <div class="search-form">
                  <?php
            $result = load::sys_class('label', 'new')->get('search')->get_search_global($data);
            echo $result;
        ?>
          <!-- <form method="get" action="<?php echo $c['index_url'];?>search/search.php?lang=<?php echo $_M['lang'];?>">
            <input type="hidden" name='class1' value="<?php echo $data['class1'];?>">
            <input type="hidden" name='class2' value="<?php echo $data['class2'];?>">
            <input type="hidden" name='class3' value="<?php echo $data['class3'];?>">
            <input type="hidden" name='search' value="search">
            <input type="hidden" name='order' value="com">
            <input type="text" name="searchword" placeholder="<?php echo $ui['search'];?>">
            <button type="submit" class="input-search-btn"><i class="icon wb-search" aria-hidden="true"></i></button>
          </form> -->
        </div>
      </div>
      <?php } ?>
      <ul class="nav navbar-nav navbar-right navlist">
        <li class="nav-item m-r-20">
          <a href="<?php echo $c['index_url'];?>" title="<?php echo $word['home'];?>" class="link   <?php if($data['classnow']==10001){ ?>active<?php } ?>"><?php echo $word['home'];?></a>
        </li>
        <?php
    $type=strtolower(trim('head'));
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
            $m['class']="active";
        }else{
            $m['class'] = '';
        }
        
        //产品所属多个栏目时
        if($data['module']==3 && $data['page_type']=='showpage' && $data['classother']){
            if(strpos($data['classother'],'-'.$m['id'].'-')){
                $m['class']="active";
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
          <?php if($m['sub']&&$m['module']!=6&&$m['module']!=7&&$ui['nav2_ok']&&!in_array(strip_tags($m['name']),explode('|',strip_tags($ui['nav2_hide'])))){ ?>
        <li class="nav-item dropdown m-r-20">
          <a class="dropdown-toggle link <?php echo $m['class'];?>" href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>
			data-hover="dropdown" data-toggle="dropdown">  <?php if($m['_name']){ ?><?php echo $m['_name'];?><?php }else{ ?><?php echo $m['name'];?><?php } ?></a>
          <ul class="two-menu dropdown-menu dropdown-menu-right bullet">
              <?php if(!($m['module']==1 && !$m['isshow'])){ ?>
            <li class="nav-parent visible-xs">
              <a class="dropdown-submenu nav-parent hidden-lg-up   <?php if(!$data["class2"]){ ?><?php echo $m['class'];?><?php } ?>" href="<?php echo $m['url'];?>" title="<?php echo $ui['all'];?>" <?php echo $m['urlnew'];?>>
             	  <?php if($m['module']<>1){ ?><?php echo $ui['nav2_all'];?><?php }else{ ?>  <?php if($m['_name']){ ?><?php echo $m['_name'];?><?php }else{ ?><?php echo $m['name'];?><?php } ?><?php } ?>
              </a>
            </li>
            <?php } ?>
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
            $m['class']="active";
        }else{
            $m['class'] = '';
        }
        
        //产品所属多个栏目时
        if($data['module']==3 && $data['page_type']=='showpage' && $data['classother']){
            if(strpos($data['classother'],'-'.$m['id'].'-')){
                $m['class']="active";
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
              <?php if($m['sub']){ ?>
			<li class="dropdown-submenu">
              <a href="<?php echo $m['url'];?>" class="<?php echo $m['class'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>  <?php if($m['_name']){ ?><?php echo $m['_name'];?><?php }else{ ?><?php echo $m['name'];?><?php } ?></a>
              <ul class="dropdown-menu animate">
                  <?php if(!($m['module']==1 && !$m['isshow'])){ ?>
                <li class="nav-parent visible-xs">
                  <a class="  <?php if(!$data["class3"]){ ?><?php echo $m['class'];?><?php } ?>" href="<?php echo $m['url'];?>" title="<?php echo $ui['all'];?>" <?php echo $m['urlnew'];?>>
                      <?php if($m['module']<>1){ ?><?php echo $ui['nav2_all'];?><?php }else{ ?>  <?php if($m['_name']){ ?><?php echo $m['_name'];?><?php }else{ ?><?php echo $m['name'];?><?php } ?><?php } ?>
                  </a>
                </li>
                <?php } ?>
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
            $m['class']="active";
        }else{
            $m['class'] = '';
        }
        
        //产品所属多个栏目时
        if($data['module']==3 && $data['page_type']=='showpage' && $data['classother']){
            if(strpos($data['classother'],'-'.$m['id'].'-')){
                $m['class']="active";
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
                <li><a href="<?php echo $m['url'];?>" class="<?php echo $m['class'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>  <?php if($m['_name']){ ?><?php echo $m['_name'];?><?php }else{ ?><?php echo $m['name'];?><?php } ?></a></li>
			    <?php endforeach;?>
              </ul>
			</li>
            <?php }else{ ?>
            <li>
              <a href="<?php echo $m['url'];?>" class="<?php echo $m['class'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>  <?php if($m['_name']){ ?><?php echo $m['_name'];?><?php }else{ ?><?php echo $m['name'];?><?php } ?></a>
            </li>
            <?php } ?>
            <?php endforeach;?>
          </ul>
        </li>
        <?php }else{ ?>
        <li class="nav-item m-r-20">
          <a class="link <?php echo $m['class'];?>" href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>  <?php if($m['_name']){ ?><?php echo $m['_name'];?><?php }else{ ?><?php echo $m['name'];?><?php } ?></a>
        </li>
        <?php } ?>
        <?php endforeach;?>
      </ul>
    </div>
  </div>
</nav>
</section>