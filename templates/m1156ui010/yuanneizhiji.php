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
.yz-list-head{margin:0 0 14px 0;}
.yz-banner{margin:0 0 18px 0;padding:12px 16px;background:#faf7f2;border:1px solid #efe6d6;border-left:4px solid #8a6d3b;border-radius:4px;color:#7a5c2e;font-size:14px;line-height:1.8;}
.yz-card .desc{margin:6px 0 0 0;font-size:13px;color:#888;line-height:1.6;height:38px;overflow:hidden;}
</style>
<script>
history.scrollRestoration = 'manual';
/* —— 滚动探针（临时）：记录是谁在滚动页面，定位后移除 —— */
(function () {
  var ws = window.scrollTo;
  window.scrollTo = function () { console.log('[SCROLL] scrollTo', [].slice.call(arguments), new Error().stack); return ws.apply(this, arguments); };
  var wsb = window.scrollBy;
  window.scrollBy = function () { console.log('[SCROLL] scrollBy', [].slice.call(arguments), new Error().stack); return wsb.apply(this, arguments); };
  var sv = Element.prototype.scrollIntoView;
  Element.prototype.scrollIntoView = function () { console.log('[SCROLL] scrollIntoView', this.tagName, this.className, new Error().stack); return sv.apply(this, arguments); };
  var fo = HTMLElement.prototype.focus;
  HTMLElement.prototype.focus = function () { console.log('[SCROLL] focus', this.tagName, this.className, new Error().stack); return fo.apply(this, arguments); };
})();
/* —— 临时兜底：加载后 2 秒内强制回顶（用户一滚动即让位），定位后移除 —— */
(function () {
  var stop = false;
  ['wheel', 'touchmove', 'keydown'].forEach(function (t) {
    window.addEventListener(t, function () { stop = true; }, { passive: true, once: true });
  });
  var start = Date.now();
  var iv = setInterval(function () {
    if (stop || Date.now() - start > 2000) { clearInterval(iv); return; }
    if (window.scrollY !== 0) { window.scrollTo(0, 0); }
  }, 100);
})();
window.addEventListener('load', function () {
  setTimeout(function () { if (!location.hash) { window.scrollTo(0, 0); } }, 50);
});
</script>
<div class="col-lg-12 met-cons">
    <div class="product-list-head yz-list-head">
        <h1 class="product-list-title">{$data.name}</h1>
    </div>
    <div class="yz-banner">院内制剂（医院自制药）仅限配制医院内部凭处方使用，不得在市场上或网上对外销售；本页仅作科普，不提供购买、代购或在线下单服务，需到院就诊由医生开具。</div>
    <div class="met-img" m-id="noset">
        <ul class="blocks-100 blocks-xs-2 blocks-md-2 blocks-lg-3 blocks-xlg-3 met-grid" id="met-grid" data-scale="1000x800">
            <tag action="list" cid="144" num="12">
            <li class="parent-slide shown page1 yz-card">
                <a href="/product/showproduct.php?lang=cn&id={$v.id}" title="{$v.title}" {$g.urlnew}>
                    <span><img src="{$v.imgurl|thumb:800,1000}" alt="{$v.title}"></span>
                    <h4>{$v.title}</h4>
                    <if value="$v['description']"><p class="desc">{$v.description}</p></if>
                </a>
            </li>
            </tag>
        </ul>
    </div>
</div>
<include file="foot.php" />
