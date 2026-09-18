<?php defined('IN_MET') or exit('No permission'); ?>
<?php
// 已结束活动时，取 5 条尚未结束的近期活动做推荐（保留本页收录，同时导流到可报名活动）
$_act_upcoming = array();
if (!empty($data['is_past']) && !empty($data['id'])) {
    $_act_upcoming = DB::get_all("SELECT * FROM " . $_M['table']['activity'] . " WHERE lang='" . $_M['lang'] . "' AND recycle=0 AND displaytype!=-1 AND id<>" . intval($data['id']) . " AND (end_time='' OR end_time>=NOW()) ORDER BY start_time ASC, id DESC LIMIT 5");
    foreach ((array)$_act_upcoming as $_act_k => $_act_v) {
        $_act_upcoming[$_act_k]['original_addtime'] = $_act_v['addtime'];
        $_act_upcoming[$_act_k]['url'] = load::mod_class('activity/activity_handle', 'new')->get_content_url($_act_upcoming[$_act_k]);
    }
}
?>
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
                    <if value="$data['is_past']">
                    <div class="alert alert-warning" style="margin-top:12px;">
                        <i class="fa fa-info-circle"></i> 本活动已结束（{$data.status_text}），以下为近期可报名的活动。
                    </div>
                    </if>
                </div>
                <div class="met-editor lazyload clearfix">
                    <div class="editorlightgallery">{$data.content}</div>
                </div>

                <if value="$data['faq_list']">
                <style type="text/css">
                .met-act-faq{margin:25px 0 0 0;padding:20px 0 0 0;border-top:1px solid #eee;}
                .met-act-faq h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
                .met-act-faq .faq-item{margin-bottom:14px;}
                .met-act-faq .faq-item h5{font-size:15px;font-weight:600;margin:0 0 6px 0;}
                .met-act-faq .faq-item p{margin:0;font-size:14px;line-height:1.8;color:#666;}
                </style>
                <div class="met-act-faq">
                  <h4>常见问题</h4>
                  <list data="$data['faq_list']" name="$faq">
                  <div class="faq-item">
                    <h5>{$faq.q}</h5>
                    <p>{$faq.a}</p>
                  </div>
                  </list>
                </div>
                </if>

                <if value="$_act_upcoming">
                <style type="text/css">
                .met-act-upcoming{margin:25px 0 0 0;padding:20px 0 0 0;border-top:1px solid #eee;}
                .met-act-upcoming h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
                .met-act-upcoming ul{margin:0;padding:0;list-style:none;}
                .met-act-upcoming li{padding:6px 0;font-size:14px;border-bottom:1px dashed #f0f0f0;}
                .met-act-upcoming li a{color:#333;text-decoration:none;}
                .met-act-upcoming li a:hover{color:#8a6d3b;}
                .met-act-upcoming li span{float:right;color:#999;font-size:13px;}
                </style>
                <div class="met-act-upcoming">
                  <h4>近期活动</h4>
                  <ul>
                    <list data="$_act_upcoming" name="$up">
                    <li>
                      <a href="{$up.url}" title="{$up.title}">{$up.title}</a>
                      <span><if value="$up['start_time']">{$up.start_time}</if></span>
                    </li>
                    </list>
                  </ul>
                </div>
                </if>

                <div class="met-shownews-footer"><pagination /></div>
            </div>
        </div>
    </div>
</section>
<include file="foot.php" />
