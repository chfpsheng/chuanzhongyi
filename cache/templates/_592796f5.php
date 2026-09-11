<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss lazy" m-id="<?php echo $ui['mid'];?>"   <?php if($ui["bgimg"] && !strstr($ui["bgimg"],$c["met_agents_img"])){ ?>data-background="<?php echo $ui['bgimg'];?>"<?php } ?>>
    <div class="met-job animsition">
        <div class="container">
            <div class="row">
                <?php
    $cid = $data['classnow'];
    if($cid == 0){
        $cid = $data['classnow'];
    }
    $num = $c['met_job_list'];
    $order = "no_order";
    $result = load::sys_class('label', 'new')->get('job')->get_list_page($cid, $data['page']);
    $sub = is_array($result) ? count($result) : 0;

     foreach($result as $index=>$v):
        $v['sub']      = $sub;
        $v['_index']   = $index;
        $v['_first']   = $index == 0 ? true:false;
        $v['_last']    = $index == ($sub-1) ? true : false;
        $v['count']    = $v['count'] ? $v['count'] : $word['Job1'];
        $v['classnow'] = $v['class3'] ? $v['class3'] : ($v['class2'] ? $v['class2'] :$v['class1']);
?><?php endforeach;?>
                <ul class="met-job-list met-page-ajax met-pager-ajax met-grid" id="met-grid">
                            <?php
            $sub = is_array($result) ? count($result) : 0;
            $cycleindex = 50;

            if(!is_array($result) && $result){
                $result = explode('|',$result);
            }

            foreach ($result as $index => $val) {
                if(is_numeric($index) && $index >= $cycleindex){
                    break;
                }

                if(is_array($val)){
                    $val['_index'] = $index;
                    $val['_first'] = $index == 0 ? true : false;
                    $val['_last']  = $index == ($sub-1) ? true : false;
                    $val['sub']    = $sub;
                }

                $p = $val;
            ?>
                        <li class="col-md-6 shown">
                            <div class="widget widget-article widget-shadow">
                                <div class="widget-body">
                                    <h3 class="widget-title"><?php echo $p['position'];?></h3>
                                    <p class="widget-metas">
                                        <span><?php echo $p['addtime'];?></span>
                                        <span><i class="icon wb-map m-r-5" aria-hidden="true"></i><?php echo $p['place'];?></span>
                                        <span><i class="icon wb-user m-r-5" aria-hidden="true"></i><?php echo $p['count'];?></span>
                                        <span><i class="icon wb-payment m-r-5" aria-hidden="true"></i><?php echo $p['deal'];?></span>
                                    </p>
                                    <hr>
                                    <div class="transition job-con">
                                        <div class="met-editor">
                                            <?php echo $p['content'];?>
                                        </div>
                                        <hr>
                                          <?php if($ui['cvtitle']){ ?>
                                            <div class="card-body-footer m-t-0">
                                                <a class="btn btn-outline btn-squared btn-primary met-job-cvbtn" href="javascript:;" data-toggle="modal" data-target="#met-job-cv<?php echo $p['_index'];?>" data-jobid="<?php echo $p['id'];?>" data-cvurl="cv.php?lang=cn&selected" style="margin-top: 20px;"><?php echo $ui['cvtitle'];?></a>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <div class="modal fade modal-primary" id="met-job-cv<?php echo $p['_index'];?>" aria-hidden="true" role="dialog" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                        <h4 class="modal-title"><?php echo $ui['cvtitle'];?></h4>
                                    </div>
                                    <div class="modal-body">
                                        <?php
    $jid = $p['id'];
    $result = load::sys_class('label', 'new')->get('job')->get_module_form_html($jid);

    echo $result;
?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php }?>
                </ul>
            </div>
        </div>
        <div class='m-t-20 text-xs-center hidden-sm-down animated fadeInUpSmall' m-type="nosysdata">
                 <?php
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

     ?>
        </div>
        <div class="met_pager met-pager-ajax-link hidden-md-up animated fadeInUpSmall" data-plugin="appear" data-animate="slide-bottom" data-repeat="false" m-type="nosysdata">
            <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn" data-plugin="ladda" data-style="slide-left" data-url="" data-page="1">
                <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
            </button>
        </div>
    </div>

</section>