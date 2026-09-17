<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="activity" />
<include file="met_list_style.php" />
<section class="met-card-list met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="met-img" m-id="noset">
                    <ul class="blocks-100 blocks-xs-2 blocks-md-2 blocks-lg-3 blocks-xlg-3 met-page-ajax met-pager-ajax met-grid" id="met-grid" data-scale="{$c.met_activityimg_y}x{$c.met_activityimg_x}">
                        <tag action="activity.list" num="$c['met_activity_list']">
                        <li class="parent-slide shown page1">
                            <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                                <span><img src="{$v.imgurl|thumb:$c['met_activityimg_x'],$c['met_activityimg_y']}" alt="{$v.title}"></span>
                                <h4 class="on">{$v.title}</h4>
                            </a>
                        </li>
                        </tag>
                    </ul>
                </div>
                <div class="page-box" m-type="nosysdata"><pager /></div>
            </div>
        </div>
    </div>
</section>
<include file="foot.php" />
