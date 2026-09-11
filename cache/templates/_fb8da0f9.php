<?php defined('IN_MET') or exit('No permission'); ?>
<?php $met_page = "index";?><?php
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


        <?php
            $id = 2;
            $panrent_name = 'column_list';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<?php
    $type=strtolower(trim('current'));
    $cid = $data['classnow'];
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
?><?php endforeach;?>
  <?php if($data['classnow']==10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')){ ?>
<section class="column_list_met_m1156_7_2 lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="title-box"><h2><?php echo $ui['title'];?></h2><p><?php echo $ui['description'];?></p></div>
    <div class="row">
      <div class="service-box swiper-container-horizontal">
        <ul class="service-wraper" > 
          <?php
    $type=strtolower(trim('son'));
    $cid = $ui['columnid'];
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
          <li class="service-slide swiper-slide-prev">
            <a   <?php if($ui['linkok']){ ?>href="<?php echo $m['url'];?>"<?php } ?> title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>
              <b>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAC0lEQVQYV2NgAAIAAAUAAarVyFEAAAAASUVORK5CYII=">
                  <?php if($ui['icontype']){ ?>
                <img class="service-lazy icon" data-src="<?php echo $m['columnimg'];?>">
                <?php }else{ ?>
                <i class="<?php echo $m['icon'];?>"></i>
                <?php } ?>
              </b>
              <h3><?php echo $m['name'];?></h3> 
              <p><?php echo $m['description'];?></p> 
            </a>
          </li>
          <?php endforeach;?> 
        </ul>
      </div>
    </div>
  </div> 
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="column_list_met_m1156_7_2" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>

        <?php
            $id = 3;
            $panrent_name = 'show_list';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<?php
    $type=strtolower(trim('current'));
    $cid = $data['classnow'];
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
?><?php endforeach;?>
  <?php if($data['classnow']==10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')){ ?>
<section class="show_list_met_m1156_7_3 lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">  
	<div class="row">
	  <div class="col-md-6">
		<div class="about-title title-box"><h2><?php echo $ui['title'];?></h2></div>
		<div class="about-box"><?php echo $ui['content'];?></div>
		<div class="about-link">
		  <a href="<?php
    $type=strtolower(trim('current'));
    $cid = $ui["columnid"];
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
?><?php echo $m['url'];?><?php endforeach;?>" title="<?php echo $ui['title'];?>" <?php echo $m['urlnew'];?>>
            <span><?php echo $ui['more'];?></span>
            <i class="fa fa-angle-double-right"></i>
          </a>
		</div>
	  </div>
	  <div class="col-md-6 about-video"><?php echo $ui['videoshow'];?></div>
	</div> 
  </div> 
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="show_list_met_m1156_7_3" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>

        <?php
            $id = 4;
            $panrent_name = 'product_list';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<?php
    $type=strtolower(trim('current'));
    $cid = $data['classnow'];
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
?><?php endforeach;?>
  <?php if($data['classnow']==10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')){ ?>
<section class="product_list_met_m1156_7_4 lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="title-box"><h2><?php echo $ui['title'];?></h2><p><?php echo $ui['description'];?></p></div>
    <div class="row">
      <div class="product-box">
		<ul class="product-wraper">
          <?php
    $cid=$ui['columnid'];
    $num = $ui['number'];
    $module = "";
    $type = $ui['type'];
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
		  <li class="product-slide">
			<a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
			  <span><img data-original="<?php echo thumb($v['imgurl'],$ui['width'],$ui['height']);?>" alt="<?php echo $v['title'];?>"></span>
			  <h4><?php echo $v['title'];?>  <?php if($v['price_str']){ ?><font><?php echo $v['price_str'];?></font><?php } ?></h4>
			</a>
		  </li>
          <?php endforeach;?> 
		</ul>
	  </div>
      <?php
    $type=strtolower(trim('current'));
    $cid = $ui['columnid'];
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
	  <div class="product-link">
		<a href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>
		  <span><?php echo $ui['more'];?></span>
          <i class="fa fa-angle-double-right"></i>
		</a>
	  </div>
      <?php endforeach;?> 
    </div>
  </div> 
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="product_list_met_m1156_7_4" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>

        <?php
            $id = 5;
            $panrent_name = 'img_list';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<?php
    $type=strtolower(trim('current'));
    $cid = $data['classnow'];
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
?><?php endforeach;?>
  <?php if($data['classnow']==10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')){ ?>
<section class="img_list_met_m1156_7_5 lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="title-box"><h2><?php echo $ui['title'];?></h2><p><?php echo $ui['description'];?></p></div> 
    <div class="row">
	  <div class="case-box">
		<ul class="case-wraper">
          <?php
    $cid=$ui['columnid'];
    $num = $ui['number'];
    $module = "";
    $type = $ui['type'];
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
		  <li class="case-slide">
			<a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
			  <span><img class="case-lazy" src="<?php echo thumb($c['met_agents_img'],$ui['width'],$ui['height']);?>" data-src="<?php echo thumb($v['imgurl'],$ui['width'],$ui['height']);?>" alt="<?php echo $v['title'];?>"></span>
			  <h4><?php echo $v['title'];?></h4>
			</a>
		  </li> 
          <?php endforeach;?> 
		</ul>
	  </div>
	</div> 
    <?php
    $type=strtolower(trim('current'));
    $cid = $ui['columnid'];
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
    <div class="about-link text-center">
      <a href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>
        <span><?php echo $ui['more'];?></span>
        <i class="fa fa-angle-double-right"></i>
      </a> 
	</div>
    <?php endforeach;?>  
  </div> 
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="img_list_met_m1156_7_5" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>

        <?php
            $id = 6;
            $panrent_name = 'news_list';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<?php
    $type=strtolower(trim('current'));
    $cid = $data['classnow'];
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
?><?php endforeach;?>
  <?php if($data['classnow']==10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')){ ?>
<section class="news_list_met_m1156_7_6 lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="title-box"><h2><?php echo $ui['title'];?></h2><p><?php echo $ui['description'];?></p></div>
    <div class="row">
      <div class="info-box">
        <ul class="info-wraper">
    	  <?php
    $type=strtolower(trim('son'));
    $cid = $ui['columnid'];
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
          <li class="info-slide">
            <span>
              <h3><?php echo $m['name'];?></h3>
              <a href="<?php echo $m['url'];?>" title="<?php echo $word['fliptext1'];?>" <?php echo $m['urlnew'];?>><hr><hr><hr></a>
            </span>
            <ol>
              <?php
    $cid=$m['id'];
    $num = $ui['number'];
    $module = "";
    $type = $ui['type'];
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
                <h4><a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>><?php echo $v['title'];?></a></h4>
                <p><?php echo $v['description'];?></p>
                <b>
                  <i><?php echo $v['updatetime'];?></i>
                    <?php if($ui['tagok']){ ?>
                  <em class="fa fa-tag"></em>
                  <strong><?php echo $ui['tag'];?></strong> 
                          <?php
            $sub = is_array($v['tag']) ? count($v['tag']) : 0;
            $cycleindex = 50;

            if(!is_array($v['tag']) && $v['tag']){
                $v['tag'] = explode('|',$v['tag']);
            }

            foreach ($v['tag'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $t = $val;
            ?>
                  <a href="search/?searchword=<?php echo $t;?>" title="<?php echo $t;?>" target="_blank"><?php echo $t;?></a>
                  <?php }?>
                  <?php } ?>
                </b>
              </li>
              <?php endforeach;?>
            </ol>
          </li>
          <?php endforeach;?>
        </ul>
      </div>
    </div>
  </div> 
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="news_list_met_m1156_7_6" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>

        <?php
            $id = 7;
            $panrent_name = 'case_list';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<?php
    $type=strtolower(trim('current'));
    $cid = $data['classnow'];
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
?><?php endforeach;?>
  <?php if($data['classnow']==10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')){ ?>
<section class="case_list_met_m1156_7_7 lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="title-box"><h2><?php echo $ui['title'];?></h2><p><?php echo $ui['description'];?></p></div> 
    <div class="row">
	  <div class="parent-box swiper-container-horizontal">
        <ul class="parent-wraper">
          <?php
    $cid=$ui['columnid'];
    $num = $ui['number'];
    $module = "";
    $type = $ui['type'];
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
		  <li class="parent-slide">
			<a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
			  <span><img class="parent-lazy" src="<?php echo thumb($c['met_agents_img'],$ui['width'],$ui['height']);?>" data-src="<?php echo thumb($v['imgurl'],$ui['width'],$ui['height']);?>" alt="<?php echo $v['title'];?>"></span>
			  <h4><?php echo $v['title'];?></h4>
                <?php if($ui['tagok']&&$v['tag']){ ?>
			  <b>
                        <?php
            $sub = is_array($v['tag']) ? count($v['tag']) : 0;
            $cycleindex = 50;

            if(!is_array($v['tag']) && $v['tag']){
                $v['tag'] = explode('|',$v['tag']);
            }

            foreach ($v['tag'] as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $t = $val;
            ?> 
                <i class="fa fa-check-square-o"></i>
                <?php echo $t;?> &nbsp;
                <?php }?>
              </b>
              <?php } ?>
			  <p>  <?php if($v['description']){ ?><?php echo str_replace("\n",'<br>',$v['description']);?><?php } ?></p>
			</a>
		  </li> 
          <?php endforeach;?> 
	    </ul>
	  </div>
    </div> 
    <?php
    $type=strtolower(trim('current'));
    $cid = $ui['columnid'];
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
    <div class="about-link text-center">
      <a href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>
        <span><?php echo $ui['more'];?></span>
        <i class="fa fa-angle-double-right"></i>
      </a> 
	</div>
    <?php endforeach;?>  
  </div> 
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="case_list_met_m1156_7_7" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>

        <?php
            $id = 8;
            $panrent_name = 'feedback_list';
            $style = 'met_m1156_7';
            $skin_name = 'm1156ui010';
            if(!isset($parse)){
                include_once PATH_ALL_APP . 'met_template/include/class/parse.class.php';
                $parse = new parse();
            }
            
            $ui = $parse->list_local_config($id,$skin_name,$panrent_name,$style);
            $ui['has'] =$parse->list_page_config($met_page);
        ?>
<?php
    $type=strtolower(trim('current'));
    $cid = $data['classnow'];
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
?><?php endforeach;?>
  <?php if($data['classnow']==10001||!$ui['bgcolumn']||strstr('|'.strip_tags($ui['bgcolumn']).'|','|'.strip_tags($m['name']).'|')){ ?>
<section class="feedback_list_met_m1156_7_8 lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>"
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="title-box"><h2><?php echo $ui['title'];?></h2><p><?php echo $ui['description'];?></p></div>
	<div class="feedback-cut">
        <?php if($ui['name']){ ?>
	  <div class="feedback-tag">
	    <span><i><?php echo $ui['name'];?></i></span>
		<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAC0lEQVQYV2NgAAIAAAUAAarVyFEAAAAASUVORK5CYII=">
	    <font><?php echo $ui['name'];?></font>
	  </div>
      <?php } ?>
	  <div class="feedback-title">
          <?php if($ui['titles']){ ?><b><?php echo $ui['titles'];?></b><?php } ?>
          <?php if($ui['say']){ ?><p><?php echo $ui['say'];?></p><?php } ?>
      </div>
	  <div class="feedback-form">
    <?php
    $cid= $ui['columnid'];
    $cid= $cid ? $cid : $data['classnow'];
    $fdtitle=$data['name'];
    $result = load::sys_class('label', 'new')->get('feedback')->get_module_form_html($cid,$fdtitle);
    echo $result;
?>
		
      </div>
	</div>
  </div>
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="feedback_list_met_m1156_7_8" m-id="<?php echo $ui['mid'];?>" m-type="nocontent"
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>

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