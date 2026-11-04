<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 院内制剂 · 详情页模板（showyuanneizhiji）
 * ------------------------------------------------------------------
 * 渲染方式：同 yuanneizhiji.php，由 product.class.php 按目录名 yuanneizhiji 分支调用。
 *           当前条目是「产品」，标准字段：{$data.title} {$data.imgurl}
 *           {$data.description} {$data.content} {$data.updatetime} {$data.hits}。
 *           扩展信息（功能主治/用法用量/规格/所属医院/价格/可否外购）放在「产品参数设置」，
 *           详情页遍历 {$data.para} 渲染，且仅显示已填写（非空）的参数，
 *           因此不会与中医馆的产品参数互相串显。
 */
?>
<include file="head.php" page="showyuanneizhiji"/>
<link rel="stylesheet" type="text/css" href="{$c.met_weburl}templates/m1156ui010/met_detail.css">
<style type="text/css">
.yz-detail-banner{margin:0 0 18px 0;padding:12px 16px;background:#faf7f2;border:1px solid #efe6d6;border-left:4px solid #8a6d3b;border-radius:4px;color:#7a5c2e;font-size:14px;line-height:1.8;}
.yz-archive{margin:18px 0 0 0;padding:16px 18px;background:#faf7f2;border:1px solid #efe6d6;border-radius:6px;}
.yz-archive h4{margin:0 0 12px 0;font-size:16px;color:#8a6d3b;border-left:4px solid #8a6d3b;padding-left:10px;}
.yz-archive ul{margin:0;padding:0;list-style:none;}
.yz-archive li{display:flex;padding:7px 0;border-bottom:1px dashed #e6dcc8;font-size:14px;line-height:1.7;}
.yz-archive li:last-child{border-bottom:0;}
.yz-archive .k{flex:0 0 110px;color:#8a6d3b;font-weight:600;}
.yz-archive .v{flex:1 1 auto;color:#555;}
</style>
<section class="met-detail-loc_main met-content animsition">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 met-cons">
        <div class="met-detail-loc met-position pattern-show" m-type="nocontent">
          <div class="container">
            <div class="row">
              <ol class="breadcrumb m-b-0">
                <li><a href="{$c.index_url}" title="{$word.home}" {$g.urlnew}><i class="icon wb-home" aria-hidden="true"></i> {$word.home}</a></li>
                <li><a href="{$c.index_url}" title="{$data.title}">{$data.title}</a></li>
              </ol>
            </div>
          </div>
        </div>
        <div class="met-detail-main page met-showproduct pagetype1" m-id="noset">
          <div class="met-showproduct-head">
            <div class="product-intro">
              <div class="product-text">
                <h1>{$data.title}</h1>
                <span class="t"><i class="fa fa-calendar"></i> {$data.updatetime} &nbsp;<i class="icon wb-eye" aria-hidden="true"></i> {$data.hits}</span>
                <if value="$data['imgurl']">
                <div class="shownews-container">
                  <div class="shownews-wrapper">
                    <div class="shownews-slide slick-current">
                      <img src="{$data.imgurl|thumb:800,1000}" data-gallery="{$data.imgurl}" alt="{$data.title}" style="display:block;width:60%;height:auto;margin:0 auto;" />
                    </div>
                  </div>
                </div>
                </if>
                <if value="$data['description']"><p class="description">{$data.description}</p></if>
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
                        <!-- 制剂档案：遍历产品参数，仅显示已填写项（避免与中医馆参数串显） -->
                        <if value="$data['para'] && is_array($data['para'])">
                        <div class="yz-archive">
                          <h4>制剂档案</h4>
                          <ul>
                            <list data="$data['para']" name="$p">
                            <if value="$p['value']">
                            <li><span class="k">{$p.name}</span><span class="v">{$p.value}</span></li>
                            </if>
                            </list>
                          </ul>
                        </div>
                        </if>
                        <ul class="nav nav-tabs nav-tabs-line met-showproduct-navtabs affix-nav">
                          <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#yz-content1">制剂简介</a></li>
                        </ul>
                        <div class="tab-content">
                          <div id="yz-content1" class="tab-pane met-editor clearfix animation-fade active">
                            <div class="editorlightgallery">{$data.content}</div>
                          </div>
                        </div>
                        <div class="yz-detail-banner">合规声明：院内制剂仅限配制医院内部凭处方使用，不得对外销售或代购。如需使用，请前往对应医院就诊，由医生评估后开具处方。本页面仅作科普，不构成任何用药建议。</div>
                        <div class="showproduct-pager"><pagination /></div>
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
          <h3>相关院内制剂</h3>
          <ul>
            <tag action="list" cid="144" num="4">
            <li>
              <a href="/product/showproduct.php?lang=cn&id={$v.id}" title="{$v.title}" {$g.urlnew}>
                <span><img src="{$v.imgurl|thumb:300,300}" alt="{$v.title}"></span>
                <h6>{$v.title}</h6>
              </a>
            </li>
            </tag>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>
<include file="foot.php" />
