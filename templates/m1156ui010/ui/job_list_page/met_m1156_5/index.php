<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss lazy" m-id="{$ui.mid}" <if value='$ui["bgimg"] && !strstr($ui["bgimg"],$c["met_agents_img"])'>data-background="{$ui.bgimg}"</if>>
    <div class="met-job animsition">
        <div class="container">
            <div class="row">
                <tag action='job.list' num="$c['met_job_list']" cid="$data['classnow']"></tag>
                <ul class="met-job-list met-page-ajax met-pager-ajax met-grid" id="met-grid">
                    <list data="$result" name="$p">
                        <li class="col-md-6 shown">
                            <div class="widget widget-article widget-shadow">
                                <div class="widget-body">
                                    <h3 class="widget-title">{$p.position}</h3>
                                    <p class="widget-metas">
                                        <span>{$p.addtime}</span>
                                        <span><i class="icon wb-map m-r-5" aria-hidden="true"></i>{$p.place}</span>
                                        <span><i class="icon wb-user m-r-5" aria-hidden="true"></i>{$p.count}</span>
                                        <span><i class="icon wb-payment m-r-5" aria-hidden="true"></i>{$p.deal}</span>
                                    </p>
                                    <hr>
                                    <div class="transition job-con">
                                        <div class="met-editor">
                                            {$p.content}
                                        </div>
                                        <hr>
                                        <if value="$ui['cvtitle']">
                                            <div class="card-body-footer m-t-0">
                                                <a class="btn btn-outline btn-squared btn-primary met-job-cvbtn" href="javascript:;" data-toggle="modal" data-target="#met-job-cv{$p._index}" data-jobid="{$p.id}" data-cvurl="cv.php?lang=cn&selected" style="margin-top: 20px;">{$ui.cvtitle}</a>
                                            </div>
                                        </if>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <div class="modal fade modal-primary" id="met-job-cv{$p._index}" aria-hidden="true" role="dialog" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                        <h4 class="modal-title">{$ui.cvtitle}</h4>
                                    </div>
                                    <div class="modal-body">
                                        <tag action='job.form' cid="$p['id']"></tag>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </list>
                </ul>
            </div>
        </div>
        <div class='m-t-20 text-xs-center hidden-sm-down animated fadeInUpSmall' m-type="nosysdata">
            <pager />
        </div>
        <div class="met_pager met-pager-ajax-link hidden-md-up animated fadeInUpSmall" data-plugin="appear" data-animate="slide-bottom" data-repeat="false" m-type="nosysdata">
            <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn" data-plugin="ladda" data-style="slide-left" data-url="" data-page="1">
                <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
            </button>
        </div>
    </div>

</section>