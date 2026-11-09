<?php defined('IN_MET') or exit('No permission'); ?>
<?php
/**
 * 院内制剂 · 列表页模板（yuanneizhiji）
 * ------------------------------------------------------------------
 * 渲染方式：院内制剂复用「产品模块」，本页由 app/system/product/web/product.class.php
 *           按栏目目录名 yuanneizhiji 分支调用；数据走通用标签 tag action="list"，
 *           拉取当前栏目（院内制剂）下的产品条目。
 *           制剂条目即产品，功能主治/规格/价格等放在「产品参数设置」里。
 *
 * 头像比例固定竖版 800x1000（data-scale 高x宽 = 1000x800），避免头部被裁。
 */
?>
<include file="head.php" page="yuanneizhiji"/>
<style type="text/css">
/* 修复：主题给 .met-cons 浮动(float:right)使内容不占流高度，页脚(position:relative,深色,
   高达2356px)被提上来盖住整个内容区——卡片其实一直在，只是被页脚压在下面。
   取消浮动让内容把页脚推下去，并抬高绘制层级双保险 */
.met-cons{position:relative;z-index:1;float:none;background:#fafafa;}
.yz-list-head{margin:0 0 14px 0;}
.yz-list-head h1{font-size:24px;color:#333;margin:0;font-weight:600;}
.yz-banner{margin:0 0 18px 0;padding:12px 16px;background:#faf7f2;border:1px solid #efe6d6;border-left:4px solid #8a6d3b;border-radius:4px;color:#7a5c2e;font-size:14px;line-height:1.8;}
/* 自包含卡片栅格：不依赖主题产品列表 CSS，避免卡片被主题样式隐藏/压成细条/变深色 */
.yz-grid{display:flex;flex-wrap:wrap;margin:0 -12px;padding:0;list-style:none;}
.yz-card{flex:0 0 calc(33.333% - 24px);margin:12px;background:#fff;border:1px solid #eee;border-radius:6px;overflow:hidden;box-shadow:0 1px 3px rgba(0,0,0,.06);}
.yz-card a{display:block;text-decoration:none;color:#333;}
.yz-card .pic{display:block;background:#f3f3f3;aspect-ratio:1/1;overflow:hidden;width:80%;height:auto;margin:10px auto 0;}
.yz-card img{display:block;width:100%;height:100%;object-fit:cover;}
.yz-card h4{margin:12px 14px 0;font-size:16px;color:#333;font-weight:600;}
.yz-card .desc{margin:6px 14px 14px;font-size:13px;color:#888;line-height:1.6;max-height:40px;overflow:hidden;}
@media(max-width:768px){.yz-card{flex:0 0 calc(50% - 24px);}}
@media(max-width:480px){.yz-card{flex:0 0 calc(100% - 24px);}}
/* 分页：与产品列表页(product_list_page)保持一致，靠右 */
.page-box{text-align:right;margin:20px 0;clear:both;}
.met_pager{margin:0;text-align:right;}
.met_pager .PageText,.met_pager input{display:none;}
.met_pager a,.met_pager span{display:inline-block;padding:0 10px;margin:1px;font-size:16px;min-width:40px;height:40px;line-height:40px;text-align:center;background:#ffffff;color:#333333;transition:.3s;-moz-transition:.3s;-ms-transition:.3s;-o-transition:.3s;-webkit-transition:.3s;}
.met_pager span{cursor:no-drop;}
.met_pager a:hover,.met_pager a.Ahover,.met_pager span:hover{background:#73C4E3;background:#73C4E3;color:#ffffff;text-decoration:none;}
</style>
<script src="{$c.met_weburl}templates/m1156ui010/yz_fix.js?v=3"></script>
<div class="col-lg-12 met-cons">
    <div class="product-list-head yz-list-head">
        <h1 class="product-list-title">{$data.name}</h1>
    </div>
    <div class="yz-banner">院内制剂（医院自制药）仅限配制医院内部凭处方使用，不得在市场上或网上对外销售；本页仅作科普，不提供购买、代购或在线下单服务，需到院就诊由医生开具。</div>
    <ul class="yz-grid">
        <tag action="product.list" cid="144" num="12">
        <li class="yz-card">
            <a href="/yuanneizhiji/showproduct.php?id={$v.id}" title="{$v.title}" {$g.urlnew}>
                <span class="pic"><img src="{$v.imgurl|thumb:640,800}" alt="{$v.title}"></span>
                <h4>{$v.title}</h4>
                <if value="$v['description']"><p class="desc">{$v.description}</p></if>
            </a>
        </li>
        </tag>
    </ul>
    <div class="page-box" m-type="nosysdata"><pager /></div>
</div>
<include file="foot.php" />
