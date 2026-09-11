<?php defined('IN_MET') or exit('No permission'); ?>
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
<section class="$uicss lazy <?php echo $ui['bgfull'];?>" m-id="<?php echo $ui['mid'];?>" data-title="<?php echo $ui['bgtitle'];?>"
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
<section class="$uicss" m-id="<?php echo $ui['mid'];?>" m-type="nocontent"
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了限制显示，可在“区块显示的栏目”中添加显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>