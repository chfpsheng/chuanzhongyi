<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 模板版本标记（改动本文件内容即可让前台模板编译缓存自动失效，无需后台“更新缓存”）
 * 2026-10-11：详情页正文图片统一缩到容器宽度的 70% 并居中（.met-shaoer-editor img）。
 * 2026-10-11：详情页去掉「本活动已结束（…），以下为近期可报名的少儿中医活动」提示条，
 *            改在「活动时间」卡片上以警告色 #856404 显示，并在具体时间后追加「（已结束）」。
 * 2026-10-10：7~10 期补齐排期（start_time / end_time / location / region_city / region_district），
 *            详情页的「活动时间 / 活动地点 / 所属地区」卡片与 FAQ 随之有值；
 *            head.php 的 Course 结构化数据同步新增 hasCourseInstance（时间 + 地点）。
 *            注意：head.php 是被本页 <include> 内联进编译缓存的，只改 head.php 不会让本页重编译，
 *            故改动本文件内容以触发整页重编译。
 */
// 读取少儿中医（module=16）的参数值，用于详情页展示
$_shaoer_para = array();
if (!empty($data['id'])) {
    $_shaoer_para = load::mod_class('parameter/parameter_label', 'new')->get_parameter_contents(16, $data['id'], $data['class1'], $data['class2'], $data['class3']);
}
// 已结束时推荐 5 条尚未结束的少儿中医活动
$_shaoer_upcoming = array();
if (!empty($data['is_past']) && !empty($data['id'])) {
    $_shaoer_upcoming = DB::get_all("SELECT * FROM " . $_M['table']['shaoer'] . " WHERE lang='" . $_M['lang'] . "' AND recycle=0 AND displaytype!=-1 AND id<>" . intval($data['id']) . " AND (end_time='' OR end_time>=NOW()) ORDER BY start_time ASC, id DESC LIMIT 5");
    foreach ((array)$_shaoer_upcoming as $_sk => $_sv) {
        $_shaoer_upcoming[$_sk]['original_addtime'] = $_sv['addtime'];
        // 列表只显示到日，不显示时分秒
        $_shaoer_upcoming[$_sk]['start_date'] = $_sv['start_time'] ? date('Y-m-d', strtotime($_sv['start_time'])) : '';
        $_shaoer_upcoming[$_sk]['url'] = load::mod_class('shaoer/shaoer_handle', 'new')->get_content_url($_shaoer_upcoming[$_sk]);
    }
}
?>
<include file="head.php" page="showshaoer" />
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
                        <if value="$data['shaoer_time']">
                        <div class="detail-card">
                            <div class="detail-card-icon"><i class="fa fa-clock-o"></i></div>
                            <div class="detail-card-body">
                                <div class="detail-card-label">活动时间</div>
                                <if value="$data['is_past']">
                                <div class="detail-card-value" style="color:#856404;">{$data.shaoer_time}（已结束）</div>
                                <else/>
                                <div class="detail-card-value">{$data.shaoer_time}</div>
                                </if>
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
                        <if value="$data['region_text']">
                        <div class="detail-card">
                            <div class="detail-card-icon"><i class="fa fa-map-signs"></i></div>
                            <div class="detail-card-body">
                                <div class="detail-card-label">所属地区</div>
                                <div class="detail-card-value">{$data.region_text}</div>
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
                                <div class="detail-card-label">所属医馆</div>
                                <div class="detail-card-value"><a href="{$data.yiguan_url}" title="{$data.yiguan_name}">{$data.yiguan_name}</a></div>
                            </div>
                        </div>
                        </if>
                    </div>
                    <if value="$_shaoer_para">
                    <div class="met-detail-paras">
                        <list data="$_shaoer_para" name="$p">
                        <span class="detail-para"><b>{$p.name}</b>{$p.value}</span>
                        </list>
                    </div>
                    </if>
                    <if value="$data['taglist']">
                    <div class="met-detail-tags">
                        <i class="fa fa-tag"></i>
                        <list data="$data['taglist']" name="$tg">
                            <a href="{$tg.url}" title="{$tg.name}" class="detail-tag">{$tg.name}</a>
                        </list>
                    </div>
                    </if>
                </div>
                <style type="text/css">
                /* 正文图片统一缩到容器宽度的 70%，居中显示 */
                .met-shaoer-editor img{width:70%;height:auto;display:block;margin:14px auto;}
                </style>
                <div class="met-editor met-shaoer-editor lazyload clearfix">
                    <div class="editorlightgallery">{$data.content}</div>
                </div>

                <if value="$data['faq_list']">
                <style type="text/css">
                .met-shaoer-faq{margin:25px 0 0 0;padding:20px 0 0 0;border-top:1px solid #eee;}
                .met-shaoer-faq h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
                .met-shaoer-faq .faq-item{margin-bottom:14px;}
                .met-shaoer-faq .faq-item h5{font-size:15px;font-weight:600;margin:0 0 6px 0;}
                .met-shaoer-faq .faq-item p{margin:0;font-size:14px;line-height:1.8;color:#666;}
                </style>
                <div class="met-shaoer-faq">
                  <h4>常见问题</h4>
                  <list data="$data['faq_list']" name="$faq">
                  <div class="faq-item">
                    <h5>{$faq.q}</h5>
                    <p>{$faq.a}</p>
                  </div>
                  </list>
                </div>
                </if>

                <if value="$_shaoer_upcoming">
                <style type="text/css">
                .met-shaoer-upcoming{margin:25px 0 0 0;padding:20px 0 0 0;border-top:1px solid #eee;}
                .met-shaoer-upcoming h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
                .met-shaoer-upcoming ul{margin:0;padding:0;list-style:none;}
                .met-shaoer-upcoming li{padding:6px 0;font-size:14px;border-bottom:1px dashed #f0f0f0;}
                .met-shaoer-upcoming li a{color:#333;text-decoration:none;}
                .met-shaoer-upcoming li a:hover{color:#8a6d3b;}
                .met-shaoer-upcoming li span{float:right;color:#999;font-size:13px;}
                </style>
                <div class="met-shaoer-upcoming">
                  <h4>近期少儿中医活动</h4>
                  <ul>
                    <list data="$_shaoer_upcoming" name="$up">
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
