<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="activity" />
<section class="met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="met-news-list news-lists" m-id="noset">
                    <ul class="met-page-ajax met-pager-ajax" data-scale='{$c.met_activityimg_y}x{$c.met_activityimg_x}'>
                        <tag action="activity.list" num="$c['met_activity_list']">
                        <li>
                            <if value="$v['imgurl']">
                            <a class="img" href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                                <img src="{$v.imgurl|thumb:$c['met_activityimg_x'],$c['met_activityimg_y']}" alt="{$v.title}">
                            </a>
                            </if>
                            <h4>
                                <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>{$v.title}</a>
                            </h4>
                            <p class="info">
                                <span><i class="fa fa-calendar"></i>{$v.updatetime}</span>
                                <span><i class="icon wb-eye"></i>{$v.hits}</span>
                            </p>
                            <p class="des">{$v.description}</p>
                        </li>
                        </tag>
                    </ul>
                    <div class="page-box" m-type="nosysdata"><pager /></div>
                </div>
            </div>
        </div>
    </div>
</section>
<include file="foot.php" />
