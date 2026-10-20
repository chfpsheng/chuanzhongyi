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
<?php
// 分享二维码：生成当前医师页绝对地址的 QR 图片，缓存到 upload/202610/qr-doctor-<id>.png（无公众号也能扫码分享）
$_qr_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$_qr_id  = isset($data['id']) ? intval($data['id']) : 0;
$_qr_rel = '';
if ($_qr_id) {
    $_qr_abs = PATH_WEB . 'upload/202610/qr-doctor-' . $_qr_id . '.png';
    if (!file_exists($_qr_abs)) {
        include_once PATH_WEB . 'app/system/include/class/phpqrcode/phpqrcode.php';
        if (!is_dir(dirname($_qr_abs))) { @mkdir(dirname($_qr_abs), 0777, true); }
        if (class_exists('QRcode')) {
            QRcode::png($_qr_url, $_qr_abs, QR_ECLEVEL_L, 6, 2);
        }
    }
    if (file_exists($_qr_abs)) {
        $_qr_rel = '../upload/202610/qr-doctor-' . $_qr_id . '.png';
    }
}
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
                      <img src="{$data.imgurl|thumb:$c['met_doctordetail_x'],$c['met_doctordetail_y']}" data-gallery="{$data.imgurl}" alt="{$data.title}" style="display:block;width:60%;height:auto;margin:0 auto;" />
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
                <if value="$data['taglist']">
                <style type="text/css">
                .met-doctor-tags{margin:14px 0 0 0;font-size:14px;line-height:1.9;}
                .met-doctor-tags strong{color:#8a6d3b;margin-right:4px;}
                .met-doctor-tags a,.met-doctor-tags i{display:inline-block;margin:0 8px 8px 0;padding:2px 12px;border-radius:14px;font-style:normal;transition:.3s;}
                .met-doctor-tags a{background:#faf7f2;border:1px solid #e8dcc8;color:#8a6d3b;}
                .met-doctor-tags a:hover{background:#8a6d3b;border-color:#8a6d3b;color:#ffffff;}
                .met-doctor-tags i{background:#f5f5f5;border:1px solid #eeeeee;color:#888888;}
                </style>
                <div class="met-doctor-tags">
                  <strong>标签：</strong>
                  <list data="$data['taglist']" name="$doctag">
                  <if value="$doctag['url']">
                  <a href="{$doctag.url}" title="{$doctag.name}">{$doctag.name}</a>
                  <else/>
                  <i>{$doctag.name}</i>
                  </if>
                  </list>
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
        <!-- 分享中医师：二维码 + 复制链接 + 微信内引导（无公众号也可用） -->
        <style type="text/css">
        .met-doctor-share{margin:24px 0 0 0;padding:18px 20px;background:#faf7f2;border:1px solid #efe6d6;border-radius:6px;}
        .met-doctor-share h4{margin:0 0 14px 0;font-size:16px;color:#8a6d3b;border-left:4px solid #8a6d3b;padding-left:10px;}
        .met-doctor-share .share-row{display:flex;align-items:center;gap:20px;flex-wrap:wrap;}
        .met-doctor-share .qr{flex:0 0 auto;}
        .met-doctor-share .qr img{width:120px;height:120px;border:1px solid #e3d6bf;background:#fff;display:block;}
        .met-doctor-share .tips{flex:1 1 240px;font-size:14px;line-height:1.9;color:#555;}
        .met-doctor-share .tips .tip-web{display:none;color:#c0392b;font-weight:600;}
        .met-doctor-share .btn-copy{display:inline-block;margin-top:8px;padding:7px 18px;background:#8a6d3b;color:#fff;border:0;border-radius:4px;cursor:pointer;font-size:14px;}
        .met-doctor-share .btn-copy:hover{background:#73592f;}
        .met-doctor-share #copyTip{margin-left:10px;color:#2e7d32;font-size:13px;}
        </style>
        <div class="met-doctor-share">
          <h4>分享中医师</h4>
          <div class="share-row">
            <?php if ($_qr_rel) { ?>
            <div class="qr"><img src="<?php echo $_qr_rel; ?>" alt="医师页二维码"></div>
            <?php } ?>
            <div class="tips">
              <p class="tip-web">微信内打开：点击右上角 ··· → 分享给朋友 / 朋友圈</p>
              <p class="tip-out">手机扫描上方二维码打开，或复制链接分享给好友。</p>
              <button type="button" id="copyLinkBtn" class="btn-copy">复制链接</button><span id="copyTip"></span>
            </div>
          </div>
        </div>
        <script>
        (function(){
          var ua = navigator.userAgent || '';
          var isWX = /MicroMessenger/i.test(ua);
          var tw = document.querySelector('.met-doctor-share .tip-web');
          var to = document.querySelector('.met-doctor-share .tip-out');
          var qr = document.querySelector('.met-doctor-share .qr');
          if (isWX) { if (to) to.style.display = 'none'; if (qr) qr.style.display = 'none'; }
          else { if (tw) tw.style.display = 'none'; }
          var btn = document.getElementById('copyLinkBtn');
          if (!btn) return;
          btn.addEventListener('click', function () {
            var url = location.href;
            var done = function () { var t = document.getElementById('copyTip'); if (t) t.textContent = '已复制链接'; };
            var fail = function () { var t = document.getElementById('copyTip'); if (t) t.textContent = '复制失败，请手动复制'; };
            var legacy = function () {
              try {
                var ta = document.createElement('textarea'); ta.value = url;
                ta.style.position = 'fixed'; ta.style.top = '-9999px';
                document.body.appendChild(ta); ta.focus(); ta.select();
                var ok = document.execCommand('copy'); document.body.removeChild(ta);
                ok ? done() : fail();
              } catch (e) { fail(); }
            };
            if (navigator.clipboard && navigator.clipboard.writeText) {
              navigator.clipboard.writeText(url).then(done, legacy);
            } else { legacy(); }
          });
        })();
        </script>
      </div>
      <div class="met-detail-side col-lg-3 met-conx" m-id="noset">
        <div class="met-service">
          <h3>推荐中医师</h3>
          <ul>
            <tag action="doctor.list" num="4">
            <li>
              <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                <span><img src="{$v.imgurl|thumb:300,300}" alt="{$v.title}"></span>
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
