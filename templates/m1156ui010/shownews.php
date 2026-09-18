<?php defined('IN_MET') or exit('No permission'); ?>
<?php
// 资讯详情页底部推荐中医馆：为资讯页补充指向核心内容（中医馆）的内链
$_news_rel = array();
if (!empty($data['id'])) {
    $_news_rel = DB::get_all("SELECT id,title,imgurl,description,region_city,region_district,class1,addtime,filename,links,access FROM " . $_M['table']['product'] . " WHERE lang='" . $_M['lang'] . "' AND recycle=0 AND displaytype!=-1 AND class1=104 ORDER BY updatetime DESC, id DESC LIMIT 6");
    foreach ((array)$_news_rel as $_nr_k => $_nr_v) {
        $_news_rel[$_nr_k]['original_addtime'] = $_nr_v['addtime'];
        $_news_rel[$_nr_k]['url'] = load::mod_class('product/product_handle', 'new')->get_content_url($_news_rel[$_nr_k]);
        $_news_rel[$_nr_k]['thumb'] = $_nr_v['imgurl'] ? str_replace('../', $_M['url']['web_site'], $_nr_v['imgurl']) : '';
        $_news_rel[$_nr_k]['area'] = trim($_nr_v['region_city'] . $_nr_v['region_district']);
    }
}
?>
<include file="head.php" page="shownews"/>
<ui name="location" style="met_m1156_7" id="29" />
<ui name="news_list_detail" style="met_m1156_7" id="30" />
<ui name="sidebar" style="met_m1156_7" id="31" />
<?php if ($_news_rel) { ?>
<section class="met-news-rel">
  <div class="container">
    <style type="text/css">
    .met-news-rel{padding:10px 0 40px 0;}
    .met-news-rel h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
    .met-news-rel ul{margin:0 -10px;padding:0;list-style:none;display:flex;flex-wrap:wrap;}
    .met-news-rel li{width:33.3333%;padding:0 10px;margin-bottom:16px;box-sizing:border-box;}
    .met-news-rel li a{display:block;border:1px solid #eee;border-radius:6px;overflow:hidden;text-decoration:none;color:#333;background:#fff;}
    .met-news-rel li a:hover{box-shadow:0 4px 12px rgba(0,0,0,.08);}
    .met-news-rel .thumb{height:130px;background:#f5f5f5 center/cover no-repeat;}
    .met-news-rel .body{padding:10px 12px;}
    .met-news-rel .name{font-size:15px;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
    .met-news-rel .area{margin-top:4px;color:#8a6d3b;font-size:13px;}
    @media (max-width:991px){.met-news-rel li{width:50%;}}
    @media (max-width:575px){.met-news-rel li{width:100%;}}
    </style>
    <h4>推荐中医馆</h4>
    <ul>
      <list data="$_news_rel" name="$rel">
      <li>
        <a href="{$rel.url}" title="{$rel.title}">
          <div class="thumb" <if value="$rel['thumb']">style="background-image:url({$rel.thumb});"</if>></div>
          <div class="body">
            <div class="name">{$rel.title}</div>
            <if value="$rel['area']"><div class="area">{$rel.area}</div></if>
          </div>
        </a>
      </li>
      </list>
    </ul>
  </div>
</section>
<?php } ?>
<include file="foot.php" />
