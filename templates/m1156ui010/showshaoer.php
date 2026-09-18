<?php defined('IN_MET') or exit('No permission'); ?>
<?php
// 读取少儿中医（module=16）的参数值，用于详情页展示
$_shaoer_para = array();
if (!empty($data['id'])) {
    $_shaoer_para = load::mod_class('parameter/parameter_label', 'new')->get_parameter_contents(16, $data['id'], $data['class1'], $data['class2'], $data['class3']);
}
?>
<include file="head.php" page="showshaoer" />
<section class="met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="met-shownews-header">
                    <h1>{$data.title}</h1>
                    <div class="info">
                        <span><i class="fa fa-calendar"></i>{$data.updatetime}</span>
                        <span><i class="icon wb-eye"></i>{$data.hits}</span>
                        <if value="$data['shaoer_time']">
                        <span><i class="fa fa-clock-o"></i>活动时间：{$data.shaoer_time}</span>
                        </if>
                        <if value="$data['location']">
                        <span><i class="fa fa-map-marker"></i>活动地点：{$data.location}</span>
                        </if>
                        <if value="$data['region_text']">
                        <span><i class="fa fa-map-signs"></i>所属地区：{$data.region_text}</span>
                        </if>
                        <span><i class="fa fa-ticket"></i>是否免费：{$data.is_free_text}</span>
                        <if value="$data['yiguan_url']">
                        <span><i class="fa fa-hospital-o"></i>所属医馆：<a href="{$data.yiguan_url}" title="{$data.yiguan_name}">{$data.yiguan_name}</a></span>
                        </if>
                        <if value="$data['taglist']">
                        <span><i class="fa fa-tag"></i>
                            <list data="$data['taglist']" name="$tg"><a href="{$tg.url}" title="{$tg.name}">{$tg.name}</a> </list>
                        </span>
                        </if>
                    </div>
                    <if value="$_shaoer_para">
                    <div class="info" style="margin-top:8px;">
                        <list data="$_shaoer_para" name="$p">
                        <span><i class="fa fa-tag"></i>{$p.name}：{$p.value}</span>
                        </list>
                    </div>
                    </if>
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
