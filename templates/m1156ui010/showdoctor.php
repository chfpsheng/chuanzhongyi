<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 模板版本标记（改动本文件内容即可让前台模板编译缓存自动失效，无需后台“更新缓存”）
 * 2026-09-12：中医师详情页参照中医馆（产品）详情页改版
 *   结构：面包屑 + 左主区（标题/时间/大图/简介/参数/简介内容/上下篇）+ 右侧边栏
 *   样式：templates/m1156ui010/met_detail.css（自产品详情页编译样式提取，区块类名统一为 met-detail-*）
 *   说明：已移除「同馆医师」Tab 与「在线预约」按钮
 */
?>
<include file="head.php" page="showdoctor" />
<link rel="stylesheet" type="text/css" href="{$c.met_weburl}templates/m1156ui010/met_detail.css">
<section class="met-detail-loc_main met-content animsition">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 met-cons">
        <div class="met-detail-loc met-position pattern-show" m-type="nocontent">
          <div class="container">
            <div class="row">
              <ol class="breadcrumb m-b-0">
                <li>
                  <a href="{$c.index_url}" title="{$word.home}" {$g.urlnew}>
                    <i class="icon wb-home" aria-hidden="true"></i>
                    {$word.home}
                  </a>
                </li>
                <if value="$data['yiguan_name']">
                <li class="dropdown">
                  <a href="{$data.yiguan_url}" title="{$data.yiguan_name}">{$data.yiguan_name}</a>
                </li>
                </if>
                <li class="dropdown">
                  <a href="{$c.index_url}" title="{$data.title}">{$data.title}</a>
                </li>
              </ol>
            </div>
          </div>
        </div>
        <div class="met-detail-main page met-showproduct pagetype1" m-id="noset">
          <div class="met-showproduct-head">
            <div class="product-intro">
              <div class="product-text">
                <h1>{$data.title}</h1>
                <span class="t">
                  <i class="fa fa-calendar"></i> {$data.updatetime} &nbsp;
                  <i class="icon wb-eye" aria-hidden="true"></i> {$data.hits}
                </span>
                <if value="$data['imgurl']">
                <div class="shownews-container">
                  <div class="shownews-wrapper">
                    <div class="shownews-slide slick-current">
                      <img src="{$data.imgurl|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$data.imgurl}" alt="{$data.title}" style="display:block;width:60%;height:auto;margin:0 auto;" />
                    </div>
                  </div>
                </div>
                </if>
                <if value="$data['description']">
                <p class="description">{$data.description}</p>
                </if>
                <if value="$data['specialty_html']">
                <style type="text/css">
                .met-doctor-specialty{margin:14px 0 0 0;padding:12px 14px;background:#faf7f2;border-left:4px solid #8a6d3b;border-radius:4px;}
                .met-doctor-specialty h4{margin:0 0 8px 0;font-size:15px;font-weight:600;color:#8a6d3b;}
                .met-doctor-specialty .txt{font-size:14px;line-height:1.9;color:#555;}
                </style>
                <div class="met-doctor-specialty">
                  <h4>擅长领域</h4>
                  <div class="txt">{$data.specialty_html}</div>
                </div>
                </if>
                <if value="$data['yiguan_names']||$data['hospital']||$data['school']||$data['fee']">
                <ul class="para blocks-2">
                  <if value="$data['yiguan_names']">
                  <li>坐诊医馆 : {$data.yiguan_links_html}</li>
                  </if>
                  <if value="$data['hospital']">
                  <li>所属医院 : {$data.hospital}</li>
                  </if>
                  <if value="$data['school']">
                  <li>毕业院校 : {$data.school}</li>
                  </if>
                  <if value="$data['fee']">
                  <li>挂号费 : {$data.fee} 元</li>
                  </if>
                </ul>
                </if>
              </div>
            </div>
          </div>
          <div class="met-showproduct-body">
            <div class="no-space">
              <div class="product-content-body">
                <div class="product-detail">
                  <div class="container">
                    <div class="row">
                      <div class="panel-body">
                        <ul class="nav nav-tabs nav-tabs-line met-showproduct-navtabs affix-nav">
                          <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#doctor-content1">医师简介</a></li>
                        </ul>
                        <div class="tab-content">
                          <div id="doctor-content1" class="tab-pane met-editor clearfix animation-fade active">
                            <div class="editorlightgallery">{$data.content}</div>
                          </div>
                        </div>
                        <div class="showproduct-pager"><pagination /></div>
                        <if value="$data['faq_list']">
                        <style type="text/css">
                        .met-doctor-faq{margin:25px 0 0 0;padding:20px 0 0 0;border-top:1px solid #eee;}
                        .met-doctor-faq h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
                        .met-doctor-faq .faq-item{margin-bottom:14px;}
                        .met-doctor-faq .faq-item h5{font-size:15px;font-weight:600;margin:0 0 6px 0;}
                        .met-doctor-faq .faq-item p{margin:0;font-size:14px;line-height:1.8;color:#666;}
                        </style>
                        <div class="met-doctor-faq">
                          <h4>常见问题</h4>
                          <list data="$data['faq_list']" name="$faq">
                          <div class="faq-item">
                            <h5>{$faq.q}</h5>
                            <p>{$faq.a}</p>
                          </div>
                          </list>
                        </div>
                        </if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="met-detail-side col-lg-3 met-conx" m-id="noset">
        <div class="met-service">
          <h3>推荐医师</h3>
          <ul>
            <tag action="doctor.list" num="4">
            <li>
              <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                <span><img src="{$v.imgurl|thumb:300,200}" alt="{$v.title}"></span>
                <h6>{$v.title}</h6>
              </a>
            </li>
            </tag>
          </ul>
        </div>
        <div class="met-information">
          <h3>中医资讯</h3>
          <ul>
            <tag action="list" cid="101" num="4">
            <li>
              <h6><a href="{$v.url}" title="{$v.title}" {$g.urlnew}>{$v.title}</a></h6>
            </li>
            </tag>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>
<include file="foot.php" />
