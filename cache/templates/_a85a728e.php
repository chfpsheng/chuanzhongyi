<?php defined('IN_MET') or exit('No permission'); ?>
  <?php if($ui['ui_show']){ ?>
  <?php if($data['classnow']<>10001){ ?>
<section class="$uicss_main met-content animsition"
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="row">
      <div class="  <?php if($ui["has"]["sidebar"]){ ?>col-lg-9<?php }else{ ?>col-lg-12<?php } ?> met-cons">
        <div class="$uicss met-position  pattern-show" m-id="<?php echo $ui['mid'];?>" m-type="nocontent">
          <div class="container">
            <div class="row">
              <ol class="breadcrumb m-b-0">
                <li>
                  <a href="<?php echo $c['index_url'];?>" title="<?php echo $word['home'];?>" <?php echo $g['urlnew'];?>>
                    <i class="icon wb-home" aria-hidden="true"></i>
                    <?php echo $word['home'];?>
                  </a>
                </li>
				        <?php
            $cid = 0;
            if(!$cid){
                $cid = $data['classnow'];
            }
            $location = load::sys_class('label', 'new')->get('column')->get_class123_reclass($cid);
            $location_data = array();
            $location_data[0] = $location['class1'];
            $location_data[1] = $location['class2'];
            $location_data[2] = $location['class3'];
            unset($location);
            foreach($location_data as $index=> $v):
        ?>
				  <?php if($v['name']){ ?>
                  <?php if($v['sub']&&$v['module']!=6&&$v['module']!=7){ ?>
                <li class="dropdown">
                  <a href="<?php echo $v['url'];?>" title="<?php echo $v['name'];?>" class="dropdown-toggle" data-toggle="dropdown"  aria-expanded="false">
                    <?php echo $v['name'];?>
                    <i class="caret"></i>
                  </a>
                  <ul class="dropdown-menu bullet">
                      <?php if(!($v['module']==1 && !$v['isshow'])){ ?>
                    <li>
                        <?php if($v['module']==1){ ?>
                      <a href="<?php echo $v['url'];?>" title="<?php echo $v['name'];?>" <?php echo $v['urlnew'];?>><?php echo $v['name'];?></a>
                      <?php }else{ ?>
                      <a href="<?php echo $v['url'];?>" title="<?php echo $ui['all'];?>" <?php echo $v['urlnew'];?>><?php echo $ui['all'];?></a>
                      <?php } ?>
                    </li>
                    <?php } ?>
                    <?php
    $type=strtolower(trim('son'));
    $cid = $v['id'];
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
                    <li>
                      <a href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>><?php echo $m['name'];?></a>
                    </li>
                    <?php endforeach;?>
                  </ul>
                </li>
                <?php }else{ ?>
                <li class="dropdown">
                  <a href="<?php echo $v['url'];?>" title="<?php echo $v['name'];?>"><?php echo $v['name'];?></a>
                </li>
                <?php } ?>
                <?php } ?>
				<?php endforeach;?>
              </ol>
            </div>
          </div>
        </div>
<?php } ?>
<?php }else if($_GET['pageset']){ ?>
<section class="$uicss" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了侧边栏隐藏，可在“侧边栏配置”中设置显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>