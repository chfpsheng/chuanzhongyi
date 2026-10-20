<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 模板版本标记（改动本文件内容即可让前台模板编译缓存自动失效，无需后台“更新缓存”）
 * 2026-10-10：head.php 的中医活动结构化数据改为「有 start_time 才输出 Event，否则输出 Article」，
 *            修掉活动综述类内容产出缺 startDate 的无效 Event。head.php 经 <include> 内联进本页
 *            编译缓存，只改 head.php 不会让本页重编译，故改动本文件内容以触发整页重编译。
 */
// 已结束活动时，取 5 条尚未结束的近期活动做推荐（保留本页收录，同时导流到可报名活动）
$_act_upcoming = array();
if (!empty($data['is_past']) && !empty($data['id'])) {
    $_act_upcoming = DB::get_all("SELECT * FROM " . $_M['table']['activity'] . " WHERE lang='" . $_M['lang'] . "' AND recycle=0 AND displaytype!=-1 AND id<>" . intval($data['id']) . " AND (end_time='' OR end_time>=NOW()) ORDER BY start_time ASC, id DESC LIMIT 5");
    foreach ((array)$_act_upcoming as $_act_k => $_act_v) {
        $_act_upcoming[$_act_k]['original_addtime'] = $_act_v['addtime'];
        // 列表只显示到日，不显示时分秒
        $_act_upcoming[$_act_k]['start_date'] = $_act_v['start_time'] ? date('Y-m-d', strtotime($_act_v['start_time'])) : '';
        $_act_upcoming[$_act_k]['url'] = load::mod_class('activity/activity_handle', 'new')->get_content_url($_act_upcoming[$_act_k]);
    }
}
?>
<include file="head.php" page="showactivity" />
<link rel="stylesheet" type="text/css" href="{$c.met_weburl}templates/m1156ui010/met_detail.css">
<section class="met-content animsition">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 met-cons">
                <div class="met-shownews-header">
                    <h1>{$data.title}</h1>
                    <div class="met-detail-subinfo">
                        <span><i class="fa fa-calendar"></i>发布于 {$data.updatetime}</span>
                        <span><i class="fa fa-eye"></i>{$data.hits} 次浏览</span>
                    </div>
                    <div class="met-detail-cards">
                        <if value="$data['activity_time']">
                        <div class="detail-card">
                            <div class="detail-card-icon"><i class="fa fa-clock-o"></i></div>
                            <div class="detail-card-body">
                                <div class="detail-card-label">活动时间</div>
                                <div class="detail-card-value">{$data.activity_time}</div>
                            </div>
                        </div>
                        </if>
                        <if value="$data['location']">
                        <div class="detail-card">
                            <div class="detail-card-icon"><i class="fa fa-map-marker"></i></div>
                            <div class="detail-card-body">
                                <div class="detail-card-label">活动地点</div>
                                <div class="detail-card-value">{$data.location}</div>
                            </div>
                        </div>
                        </if>
                        <div class="detail-card">
                            <div class="detail-card-icon"><i class="fa fa-ticket"></i></div>
                            <div class="detail-card-body">
                                <div class="detail-card-label">参与费用</div>
                                <div class="detail-card-value">{$data.is_free_text}</div>
                            </div>
                        </div>
                        <if value="$data['yiguan_url']">
                        <div class="detail-card">
                            <div class="detail-card-icon"><i class="fa fa-hospital-o"></i></div>
                            <div class="detail-card-body">
                                <div class="detail-card-label">主办医馆</div>
                                <div class="detail-card-value"><a href="{$data.yiguan_url}" title="{$data.yiguan_name}">{$data.yiguan_name}</a></div>
                            </div>
                        </div>
                        </if>
                    </div>
                    <if value="$data['taglist']">
                    <div class="met-detail-tags">
                        <i class="fa fa-tag"></i>
                        <list data="$data['taglist']" name="$tg">
                            <a href="{$tg.url}" title="{$tg.name}" class="detail-tag">{$tg.name}</a>
                        </list>
                    </div>
                    </if>
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
                      <span><if value="$up['start_date']">{$up.start_date}</if></span>
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
