<?php defined('IN_MET') or exit('No permission'); ?>
<include file="head.php" page="doctor" />
<include file="met_list_style.php" />
<section class="met-card-list met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="product-list-head">
                    <h1 class="product-list-title">{$data.name}</h1>
                </div>
                <div class="met-img" m-id="noset">
                    <!-- 头像裁切固定为竖版 800x1000：中医师为自定义模块，后台“列表页缩略图尺寸”无入口可改 -->
                    <ul class="blocks-100 blocks-xs-2 blocks-md-2 blocks-lg-3 blocks-xlg-3 met-page-ajax met-pager-ajax met-grid" id="met-grid" data-scale="1000x800">
                        <tag action="doctor.list" num="$c['met_doctor_list']">
                        <li class="parent-slide shown page1">
                            <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                                <span><img src="{$v.imgurl|thumb:800,1000}" alt="{$v.title}"></span>
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
