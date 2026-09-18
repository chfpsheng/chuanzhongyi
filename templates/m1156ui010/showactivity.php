<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="showactivity" />
<section class="met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="met-shownews-header">
                    <h1>{$data.title}</h1>
                    <div class="info">
                        <span><i class="fa fa-calendar"></i>{$data.updatetime}</span>
                        <span><i class="icon wb-eye"></i>{$data.hits}</span>
                        <if value="$data['activity_time']">
                        <span><i class="fa fa-clock-o"></i>活动时间：{$data.activity_time}</span>
                        </if>
                        <if value="$data['location']">
                        <span><i class="fa fa-map-marker"></i>活动地点：{$data.location}</span>
                        </if>
                        <span><i class="fa fa-ticket"></i>是否免费：{$data.is_free_text}</span>
                        <if value="$data['yiguan_url']">
                        <span><i class="fa fa-hospital-o"></i>主办医馆：<a href="{$data.yiguan_url}" title="{$data.yiguan_name}">{$data.yiguan_name}</a></span>
                        </if>
                        <if value="$data['taglist']">
                        <span><i class="fa fa-tag"></i>
                            <list data="$data['taglist']" name="$tg"><a href="{$tg.url}" title="{$tg.name}">{$tg.name}</a> </list>
                        </span>
                        </if>
                    </div>
                </div>
                <div class="met-editor lazyload clearfix">
                    <div class="editorlightgallery">{$data.content}</div>
                </div>
                <div class="met-shownews-footer"><pagination /></div>
            </div>
        </div>
    </div>
</section>
<include file="foot.php" />
