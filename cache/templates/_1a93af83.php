<?php defined('IN_MET') or exit('No permission'); ?> 
  <?php if($ui['ui_show']){ ?>
      <div class="$uicss col-lg-3 met-conx" m-id="<?php echo $ui['mid'];?>" m-type="nocontent">
          <?php if($ui['service_ok']){ ?>
        <div class="met-service">
          <h3><?php echo $ui['service_name'];?></h3>
          <ul>
            <?php
    $cid=$ui['service_id']?$ui['service_id']:$data['classnow'];
    $num = $ui['service_num'];
    $module = "";
    $type = $ui['service_type'];
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
              <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>>
                <span><img src="<?php echo thumb($v['imgurl'],$ui['service_width'],$ui['service_height']);?>" alt="<?php echo $v['title'];?>"></span>
                <h6><?php echo $v['title'];?></h6>
              </a>
            </li>
            <?php endforeach;?>
          </ul>
        </div>  
        <?php } ?>
          <?php if($ui['information_ok']){ ?>
        <div class="met-information">
          <h3><?php echo $ui['information_name'];?></h3>
          <ul>
            <?php
    $cid=$ui['information_id']?$ui['information_id']:$data['classnow'];
    $num = $ui['information_num'];
    $module = "";
    $type = $ui['information_type'];
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
              <h6>
                <a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" <?php echo $g['urlnew'];?>><?php echo $v['title'];?></a>
              </h6>
            </li>
            <?php endforeach;?>
          </ul>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
</section>
<?php }else if($_GET['pageset']){ ?>
<section class="$uicss" m-id="<?php echo $ui['mid'];?>" m-type="nocontent" 
  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">
  该栏目设置了侧边栏隐藏，可在“侧边栏配置”中设置显示（该文字仅“可视化”模式下可见）
</section>
<?php } ?>