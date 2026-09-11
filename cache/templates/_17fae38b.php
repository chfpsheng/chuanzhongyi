<?php defined('IN_MET') or exit('No permission'); ?>   
  <?php if(!$ui['has']['location']){ ?>  
<section class="$uicss_main met-content animsition" 
  data-background="  <?php if($ui["bgok"]){ ?><?php echo $ui['bgimg'];?><?php } ?>">
  <div class="container">
    <div class="row">
      <div class="  <?php if($ui["has"]["sidebar"]){ ?>col-lg-9<?php }else{ ?>col-lg-12<?php } ?> met-cons">
<?php } ?> 

        <div class="$uicss" m-id="<?php echo $ui['mid'];?>">
          <div class="met-img">
            <ul class="blocks-100 blocks-xs-<?php echo $ui['xs'];?> blocks-md-<?php echo $ui['md'];?> blocks-lg-<?php echo $ui['lg'];?> blocks-xlg-<?php echo $ui['xlg'];?> met-page-ajax met-pager-ajax met-grid" id="met-grid" data-scale="<?php echo $scale;?>">
                <?php if($c['met_img_page'] && $data['sub']){ ?>
              <?php
    $type=strtolower(trim('son'));
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
?>
              <li class="parent-slide shown page1">
                <a href="<?php echo $m['url'];?>" title="<?php echo $m['name'];?>" <?php echo $m['urlnew'];?>>
                  <span><img data-original="<?php echo thumb($m['columnimg'],$c['met_imgs_x'],$c['met_imgs_y']);?>" alt="<?php echo $m['name'];?>"></span>
                    <?php if($ui['listtype']==1 || $data['index_num']==1){ ?>
                  <h4 class="on"><?php echo $m['name'];?></h4>
                  <?php }else if($ui['listtype']==2 || $data['index_num']==2){ ?>
                  <h4><?php echo $m['name'];?></h4>
                    <?php if($m['namemark']){ ?>
                  <b><i class="fa fa-check-square-o"></i> <?php echo $m['namemark'];?> &nbsp;</b>
                  <?php } ?>
                  <p><?php echo str_replace("\n",'<br>',$m['description']);?></p>
                  <?php } ?>
                </a>
              </li>
              <?php endforeach;?>
              <?php }else{ ?>
              <?php
    $cid = 0;
    if($cid == 0){
        $cid = $data['classnow'];
    }
    $num = 8;
    $order = "no_order";
    $result = load::sys_class('label', 'new')->get('img')->get_list_page($cid,$data['page']);
    $sub = count($result);
     foreach($result as $index=>$v):
        $v['sub']      = $sub;
        $v['_index']   = $index;
        $v['_first']   = $index == 0 ? true:false;
        $v['_last']    = $index == (count($result)-1) ? true : false;
?>
              <li class="parent-slide page1">
                <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
                  <span><img data-original="<?php echo thumb($v['imgurl'],$c['met_imgs_x'],$c['met_imgs_y']);?>" alt="<?php echo $v['title'];?>"></span>
                    <?php if($ui['listtype']==1 || $data['index_num']==1){ ?>
                  <h4 class="on"><?php echo $v['title'];?></h4>
                  <?php }else if($ui['listtype']==2 || $data['index_num']==2){ ?>
                  <h4><?php echo $v['title'];?></h4>
                    <?php if($v['tag']){ ?>
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
                  <p><?php echo str_replace("\n",'<br>',$v['description']);?></p>
                  <?php } ?>
                </a>
              </li>
              <?php endforeach;?>
              <?php } ?>
            </ul>
          </div>
            <?php if(!($c['met_img_page'] && $data['sub'])){ ?>
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
          <?php } ?>
		</div>
      </div>
      
  <?php if(!$ui['has']['sidebar']){ ?>
    </div>
  </div>
</section>
<?php } ?>