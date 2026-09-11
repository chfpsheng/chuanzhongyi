<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="showdoctor" />
<section class="met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="met-shownews-header">
                    <h1>{$data.title}</h1>
                    <div class="info">
                        <span><i class="fa fa-calendar"></i>{$data.updatetime}</span>
                        <span><i class="icon wb-eye"></i>{$data.hits}</span>
                        <if value="$data['yiguan_name']">
                        <span><i class="fa fa-hospital-o"></i>所属医馆：<a href="{$data.yiguan_url}" title="{$data.yiguan_name}">{$data.yiguan_name}</a></span>
                        </if>
                        <if value="$data['hospital']">
                        <span><i class="fa fa-building-o"></i>所属医院：{$data.hospital}</span>
                        </if>
                        <if value="$data['fee']">
                        <span><i class="fa fa-money"></i>挂号费：{$data.fee}元</span>
                        </if>
                        <if value="$data['school']">
                        <span><i class="fa fa-graduation-cap"></i>毕业院校：{$data.school}</span>
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
