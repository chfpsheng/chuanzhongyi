<?php
$metinfover_v2=$c["metinfover"]=="v2"?true:false;
$html_lang=$_M["lang"];
switch ($_M["lang"]) {
    case "zh":
        $html_lang="zh-hant";
        break;
    case "cn":
        $html_lang="zh-hans";
        break;
}
$content_lang=$_M["lang"];
switch ($_M["lang"]) {
    case "zh":
        $content_lang="zh-tw";
        break;
    case "cn":
        $content_lang="zh-cn";
        break;
}
if(!$data["module"] || $data["module"]==10){
    $nofollow=1;
}
$user_name=$_M["user"]?$_M["user"]["username"]:"";
if(!$oxh_no){
    $html_class.="oxh";
}
$favicon_filemtime = filemtime(PATH_WEB."favicon.ico");
$og_url = $_M["url"]["web_site"].($data["classnow"]==10001?"index.php?lang=".$_M["lang"]:str_replace("../","",$data["url"]));
$og_image=$url["web_site"].str_replace("../","",$data["imgurl"]?$data["imgurl"]:$c["met_mobile_logo"]);
?>
<!DOCTYPE HTML>
<html class="<?php echo $html_class;?> met-web" lang="<?php echo $html_lang;?>">
<head>
<meta charset="utf-8">
<?php if($nofollow){ ?>
<meta name="robots" content="noindex,nofollow" />
<?php } ?>
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Language" content="<?php echo $content_lang;?>"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,minimal-ui">
<meta name="format-detection" content="telephone=no">
<title><?php echo $data['page_title'];?></title>
<meta name="description" content="<?php echo $data['page_description'];?>">
<meta name="keywords" content="<?php echo $data['page_keywords'];?>">
<meta name="generator" content="MetInfo V<?php echo $c['metcms_v'];?>" data-variable="<?php echo $url['site'];?>|<?php echo $_M["lang"];?>|<?php echo $data['synchronous'];?>|<?php echo $c['met_skin_user'];?>|<?php echo $data['module'];?>|<?php echo $data['classnow'];?>|<?php echo $data['id'];?>" data-user_name="<?php echo $user_name;?>">
<meta property="og:site_name" content="<?php echo $c['met_webname'];?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url;?>" />
<meta property="og:title" content="<?php echo $data['page_title'];?>" />
<meta property="og:description" content="<?php echo $data['page_description'];?>" />
<meta property="og:image" content="<?php echo $og_image;?>" />
<?php if($data["access_code"]){ ?>
<meta name="access_code" content="<?php echo $data['access_code'];?>">
<?php } ?>
<link rel="alternate" hreflang="x-default" href="<?php echo $_M["url"]["web_site"];?>" />
<?php
foreach ($_M["langlist"]["web"] as $key => $value) {
    if($value["useok"]){
        $value["rel_url"] = $_M["url"]["web_site"]."index.php?lang=".$value["lang"];
?>
<link rel="alternate" hreflang="<?php echo $value["lang"];?>" href="<?php echo $value["rel_url"];?>">
<?php
    }
}
?>
<link href="<?php echo $url['site'];?>favicon.ico?<?php echo $favicon_filemtime;?>" rel="shortcut icon" type="image/x-icon">
<?php
if(!$c["disable_cssjs"]){
    $basic_css_name=$c["temp_frame_version"]=="v2"?"_v2":"";
    $basic_css_filemtime = filemtime(PATH_PUBLIC_THIRD."web/basic".$basic_css_name.".css");
    $metinfo_css_filemtime = filemtime(PATH_PUBLIC_WEB."css/metinfo.css");
?>
<link rel="stylesheet" type="text/css" href="<?php echo $url['public_third'];?>web/basic<?php echo $basic_css_name;?>.css?<?php echo $basic_css_filemtime;?>">
<link rel="stylesheet" type="text/css" href="<?php echo $url['public_web'];?>css/metinfo.css?<?php echo $metinfo_css_filemtime;?>">
<?php
}
if($metinfover_v2){
    if(is_file(PATH_TEM."cache/".$c["met_skin_user"].".css")){
        $common_css_time = filemtime(PATH_TEM."cache/".$c["met_skin_user"].".css");
?>
<link rel="stylesheet" type="text/css" href="<?php echo $url['site'];?>templates/<?php echo $c['met_skin_user'];?>/cache/<?php echo $c["met_skin_user"];?>.css?<?php echo $common_css_time;?>">
<?php
    }
    if($met_page){
        if($met_page == 404) $met_page = "show";
        $page_css = PATH_TEM."cache/".$met_page."_".$_M["lang"].".css";
        if(!is_file($page_css)){
            $sys_compile = load::sys_class('view/sys_compile', 'new');
            if ($sys_compile->template_type == 'tag') {
                $sys_compile->parse_page($met_page);
            }else{
                include_once PATH_ALL_APP . "met_template/include/class/parse.class.php";
                $parse = new parse();
                $parse->parse_page($met_page);
            }
        }
        $page_css_time = filemtime($page_css);
?>
<link rel="stylesheet" type="text/css" href="<?php echo $url['site'];?>templates/<?php echo $c['met_skin_user'];?>/cache/<?php echo $met_page;?>_<?php echo $_M["lang"];?>.css?<?php echo $page_css_time;?>">
<?php
    }
}
if(is_mobile() && $c["met_headstat_mobile"]){
?>
<?php echo $c['met_headstat_mobile'];?>

<?php }else if(!is_mobile() && $c["met_headstat"]){ ?>
<?php echo $c['met_headstat'];?>

<?php
}
if($_M["html_plugin"]["head_script"]){
?>
<?php echo $_M["html_plugin"]["head_script"];?>

<?php
}
$explode_m=explode("<m ",$g["met_font"]);
$g["met_font"]=$explode_m[0];
?>
<?php
if($g["bodybgimg"] || $g["bodybgcolor"] || $g["met_font"]){
?>
<style>
body{
<?php if($g["bodybgimg"]){ ?>
    background-image: url(<?php echo $g['bodybgimg'];?>) !important;background-position: center;background-repeat: no-repeat;background-size:cover;
<?php
}
if($g["bodybgcolor"]){
?>
    background-color:<?php echo $g['bodybgcolor'];?> !important;
<?php
}
if($g["met_font"]){
?>
    font-family:<?php echo $g['met_font'];?> !important;
<?php
}
?>
}
<?php
if($g["met_font"]){
?>
h1,h2,h3,h4,h5,h6{font-family:<?php echo $g['met_font'];?> !important;}
<?php
}
?>
</style>
<?php
}
?>
<script>(function(){var t=navigator.userAgent;(t.indexOf("rv:11")>=0||t.indexOf("MSIE 10")>=0)&&document.write("<script src=\"<?php echo $url['public_third'];?>html5shiv/html5shiv.min.js\"><\/script>")})();</script>
</head>
<!--[if lte IE 9]>
<div class="text-xs-center m-b-0 bg-blue-grey-100 alert">
    <button type="button" class="close" aria-label="Close" data-dismiss="alert">
        <span aria-hidden="true">×</span>
    </button>
    <?php echo $word['browserupdatetips'];?>
</div>
<![endif]-->
<body <?php if($body_class){ ?>class="<?php echo $body_class;?>"<?php } ?>>
        <?php
            $id = 1;
            $panrent_name = 'head_nav';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<section class="head_nav_met_m1156_7_1   <?php if($ui["fixed"]){ ?>fixed<?php } ?>" m-id="<?php echo $ui['mid'];?>" m-type="head_nav">
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

        <?php
            $id = 52;
            $panrent_name = 'banner';
            $style = 'met_m1156_2';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
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
<section class="banner_met_m1156_2_52   <?php if($ui["heightfull"]&&($ui["heightfull"]!=2||$data["classnow"]==10001)){ ?>full<?php } ?>" 
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

                $v = $val;
            ?>
    <?php if(strip_tags($v)=='简介模块'&&$data['module']==1){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='新闻模块'&&$data['module']==2){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='产品模块'&&$data['module']==3){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='下载模块'&&$data['module']==4){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='图片模块'&&$data['module']==5){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='招聘模块'&&$data['module']==6){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='留言模块'&&$data['module']==7){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='反馈模块'&&$data['module']==8){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='全站搜索'&&$data['module']==11){ ?>hidden<?php } ?>
    <?php if(strip_tags($v)=='网站地图'&&$data['module']==12){ ?>hidden<?php } ?>
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
