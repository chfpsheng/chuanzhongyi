<?php defined('IN_MET') or exit('No permission'); ?>

<?php
/**
 * 中医馆（产品）详情页：隐藏系统自动追加的「在线询价」按钮（2026-10-13）
 * 系统在链接型参数（type=10）列表 $data['para_url'] 末尾追加询价项，该项目的 id 固定为 0；
 * 后台真实维护的链接型参数（如「官网」id=196）其 id 均大于 0，
 * 故按 id 过滤即可只隐藏「在线询价」、保留官网等真实按钮；
 * 过滤后若已无按钮，下方标准模式与时尚模式两处 para_url 区块会整体不输出。
 */
if (!empty($data['para_url']) && is_array($data['para_url'])) {

    $data['para_url'] = array_values(array_filter($data['para_url'], function ($item) {

        return !is_array($item) || !empty($item['id']);

    }));

}
?>

<if value="!$ui['has']['location']">  

<section class="$uicss_main met-content animsition lazy" 

  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">

  <div class="container">

    <div class="row">

      <div class="<if value='$ui["has"]["sidebar"]'>col-lg-9<else/>col-lg-12</if> met-cons" role="main">

</if> 

        <div class="$uicss page met-showproduct pagetype{$ui.pagetype}" m-id="{$ui.mid}">

		  <if value="$ui['pagetype'] eq 1">

          <div class="met-showproduct-head"> 

            <div class="product-intro">

              <div class="product-text">

                <h1>{$data.title}</h1>

                <span class="t">

                  <if value="$ui['dateok']">

                  <i class="fa fa-calendar"></i> {$data.updatetime} &nbsp;

                  <i class="icon wb-eye" aria-hidden="true"></i> {$data.hits}

                  </if>

                </span>

<if value="$data['imgurl']">
                <div class="shownews-container" id="met-imgs-slick">

                  <div class="shownews-wrapper">

                    <list data="$data['displayimgs']" name="$val">

                    <div class="shownews-slide <if value='$val["_first"]'>slick-current</if>">

                      <img class="shownews-lazy" <if value='$val["_first"]'>src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}"</if> data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$data.img_alt}" />

                    </div>

                    </list>

                  </div>

                  <div class="swiper-button-next swiper-button-white"></div>

                  <div class="swiper-button-prev swiper-button-white"></div>

                </div>

                <if value="$val['_index'] gt 0">

                <div class="shownews-container-small">

                  <div class="shownews-wrapper-small">

                    <list data="$data['displayimgs']" name="$val">

                    <div class="shownews-slide-small <if value='$val["_first"]'>active</if>">

                      <img class="shownews-lazy" src="{$c['met_agents_img']|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$data.img_alt}" />

                    </div>

                    </list>

                  </div>

                </div>

                </if>
</if>
<if value="!$data['imgurl']">
                <div class="default-clinic-cover" style="text-align:center;padding:16px 0;">
                  <img src="/upload/202610/moren.jpeg" alt="{$data.title}" style="width:100%;max-width:560px;height:auto;display:inline-block;" />
                </div>
</if>

                <if value="$data['description']">

                <p class="description">{$data.description}</p>

                </if>

                <if value="$data['specialty_text'] || $data['visit_time'] || $data['booking'] || $data['insurance_ok'] gt -1">
                <style type="text/css">
                .clinic-meta{margin:14px 0 0 0;padding:0;list-style:none;}
                .clinic-meta li{padding:5px 0;font-size:14px;line-height:1.7;color:#555;border-bottom:1px dashed #f0f0f0;}
                .clinic-meta li:last-child{border-bottom:none;}
                .clinic-meta li strong{color:#333;font-weight:600;margin-right:6px;}
                .clinic-meta li em{font-style:normal;display:inline-block;margin:0 6px 0 0;padding:1px 8px;background:#f7f3ec;color:#8a6d3b;border-radius:3px;font-size:13px;}
                </style>
                <ul class="clinic-meta">
                    <if value="$data['specialty_list']">
                    <li><strong>擅长项目：</strong>
                        <list data="$data['specialty_list']" name="$sp"><em>{$sp}</em></list>
                    </li>
                    </if>
                    <if value="$data['visit_time']">
                    <li><strong>出诊时间：</strong>{$data.visit_time}</li>
                    </if>
                    <?php // 医保情况由「参数管理 → 支持医保」统一维护并在参数列表中展示，这里不再重复输出 ?>                    <if value="$data['booking']">
                    <li><strong>预约方式：</strong>{$data.booking}</li>
                    </if>
                </ul>
                </if>

                <if value="$data['para'] && $ui['paranum'] lt count($data['para'])">

                <ul class="para blocks-2">

                  <list data="$data['para']" name="$val">

                  <if value="!($val['_index'] lt $ui['paranum'])">

                  <li>{$val.name} : {$val.value}</li>

                  </if>

                  </list>

                </ul>

                </if>

                <if value="$data['para_url']">

                <div class='para-button-link'>

                    <list data="$data['para_url']" name="$para_url" num='100'>

                    <if value="$para_url['value']">

                    <?php
                    // 站外链接（如「官网」）加 rel="nofollow"；站内链接不加
                    $_pu_href = (string)$para_url['value'];
                    $_pu_rel  = (stripos($_pu_href, 'http') === 0 && strpos($_pu_href, $_M['url']['web_site']) !== 0) ? ' rel="nofollow"' : '';
                    ?>
                    <a href="{$para_url.value}" class="linkbox btn btn-danger m-r-15" target="_blank"<?php echo $_pu_rel; ?>>{$para_url.name}</a>

                    </if>

                    </list>

                </div>

                </if> 

              </div>

            </div> 

          </div>

          <div class="met-showproduct-body"> 

            <div class="no-space">

              <div class="product-content-body">

                <div class=" product-detail <if value='!$ui["hitsok"]'>m-r-0 m-b-0</if>">

                  <div class="container">

                    <div class="row">

                      <div class="panel-body">

                      <?php
                      //中医馆详情页：读取属于当前医馆的中医师（每行4个，每页12条即最多3行）
                      $met_dpage = isset($_M['form']['dpage']) ? intval($_M['form']['dpage']) : (isset($_GET['dpage']) ? intval($_GET['dpage']) : 0);
                      $met_doctor_list = array('list' => array(), 'total' => 0, 'pages' => 0, 'page' => 1);
                      if ($data['id']) {
                      $met_doctor_list = load::mod_class('doctor/doctor_label', 'new')->get_list_by_yiguan($data['id'], $met_dpage > 0 ? $met_dpage : 1, 12);
                      }
                      // 双向关联：本医馆的近期活动与少儿中医课程（各取 6 条）
                      $met_rel_activity = array();
                      $met_rel_shaoer = array();
                      if ($data['id']) {
                          $met_rel_id = intval($data['id']);
                          $met_rel_activity = DB::get_all("SELECT * FROM " . $_M['table']['activity'] . " WHERE lang='" . $_M['lang'] . "' AND recycle=0 AND displaytype!=-1 AND yiguan='" . $met_rel_id . "' ORDER BY start_time DESC, id DESC LIMIT 6");
                          foreach ((array)$met_rel_activity as $_rel_k => $_rel_v) {
                              $met_rel_activity[$_rel_k]['original_addtime'] = $_rel_v['addtime'];
                              $met_rel_activity[$_rel_k]['start_date'] = $_rel_v['start_time'] ? date('Y-m-d', strtotime($_rel_v['start_time'])) : '';
                              $met_rel_activity[$_rel_k]['url'] = load::mod_class('activity/activity_handle', 'new')->get_content_url($met_rel_activity[$_rel_k]);
                          }
                          $met_rel_shaoer = DB::get_all("SELECT * FROM " . $_M['table']['shaoer'] . " WHERE lang='" . $_M['lang'] . "' AND recycle=0 AND displaytype!=-1 AND yiguan='" . $met_rel_id . "' ORDER BY start_time DESC, id DESC LIMIT 6");
                          foreach ((array)$met_rel_shaoer as $_rel_k => $_rel_v) {
                              $met_rel_shaoer[$_rel_k]['original_addtime'] = $_rel_v['addtime'];
                              $met_rel_shaoer[$_rel_k]['start_date'] = $_rel_v['start_time'] ? date('Y-m-d', strtotime($_rel_v['start_time'])) : '';
                              $met_rel_shaoer[$_rel_k]['url'] = load::mod_class('shaoer/shaoer_handle', 'new')->get_content_url($met_rel_shaoer[$_rel_k]);
                          }
                      }
                      ?>

                      <ul class="nav nav-tabs nav-tabs-line met-showproduct-navtabs affix-nav">

                        <list data="$data['contents']" name="$s">

                        <if value="$s['content']">

                        <li class="nav-item"><a class="nav-link <if value='$s["_first"]'>active</if>" data-toggle="tab" href="#product-content{$s._index}" data-get="product-details">{$s.title}</a></li>

                        </if>

                        </list>

                        <if value="$met_doctor_list['total']">

                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product-content-doctor">中医师</a></li>

                        </if>

                      </ul>

                        <div class="tab-content">

                          <list data="$data['contents']" name="$s"> 

                          <div id="product-content{$s._index}" class="tab-pane met-editor lazyload clearfix animation-fade 

                          	<if value="$s['_first']">active</if>

                            <if value='$_GET["pageset"]'>

                            editable-click" met-id="{$data.id}" met-table="product" met-field="content{$s._index}"

                            <else/>"</if>

                            >

                            <div>{$s.content|preg_replace:'/(<img[^>]*)src(=[^>]*>)/', '\\1class="imgloading" data-original\\2',@@}</div>

                          </div> 

                          </list>

                          <if value="$met_doctor_list['total']">

                          <div id="product-content-doctor" class="tab-pane animation-fade">

                            <style type="text/css">
                            .met-yiguan-doctors-list{margin:0 -10px; padding:0; list-style:none;}
                            .met-yiguan-doctors-list:after{display:block; clear:both; content:'';}
                            .met-yiguan-doctors-list li{float:left; width:25%; padding:0 10px 20px 10px; box-sizing:border-box; text-align:center;}
                            .met-yiguan-doctors-list li a.img{display:block;}
                            .met-yiguan-doctors-list li a.img img{width:100%; display:block; border-radius:4px;}
                            .met-yiguan-doctors-list li h4{margin:12px 0 5px 0; font-size:16px; font-weight:400; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
                            .met-yiguan-doctors-list li h4 a{display:block;}
                            .met-yiguan-doctors-list li p.info{margin:0; font-size:13px; color:#999;}
                            .met-yiguan-doctors-list li p.info span{margin:0 5px; display:inline-block;}
                            .met-yiguan-doctors-pager .pagination{display:flex; justify-content:center; margin:0;}
                            .met-yiguan-doctors-pager .page-item{margin:10px 3px 0 3px;}
                            @media (max-width:767px){.met-yiguan-doctors-list li{width:50%;}}
                            </style>

                            <ul class="met-yiguan-doctors-list">

                              <list data="$met_doctor_list['list']" name="$met_doctor">

                              <li>

                                <a class="img" href="{$met_doctor.url}" title="{$met_doctor.title}">

                                  <if value="$met_doctor['imgurl']">

                                  <img src="{$met_doctor.imgurl|thumb:400,250}" alt="{$met_doctor.title}">

                                  </if>

                                </a>

                                <h4><a href="{$met_doctor.url}" title="{$met_doctor.title}">{$met_doctor.title}</a></h4>

                                <p class="info">

                                  <if value="$met_doctor['hospital']">

                                  <span><i class="fa fa-building-o"></i>{$met_doctor.hospital}</span>

                                  </if>

                                  <if value="$met_doctor['fee']">

                                  <span><i class="fa fa-money"></i>挂号费 {$met_doctor.fee} 元</span>

                                  </if>

                                </p>

                              </li>

                              </list>

                            </ul>

                            <?php
                            if ($met_doctor_list['pages'] > 1) {
                                //分页链接：保留当前地址的其它参数，仅替换 dpage
                                $met_page_url = preg_replace('/([?&])dpage=\d+/', '', $_SERVER['REQUEST_URI']);
                                $met_page_url = str_replace('?&', '?', $met_page_url);
                                $met_page_url .= strpos($met_page_url, '?') === false ? '?' : '&';
                            ?>
                            <div class="met-yiguan-doctors-pager">
                              <ul class="pagination">
                                <?php for ($met_page_i = 1; $met_page_i <= $met_doctor_list['pages']; $met_page_i++) { ?>
                                <li class="page-item<?php echo $met_page_i == $met_doctor_list['page'] ? ' active' : ''; ?>">
                                  <a class="page-link" href="<?php echo htmlspecialchars($met_page_url . 'dpage=' . $met_page_i, ENT_QUOTES, 'UTF-8'); ?>"><?php echo $met_page_i; ?></a>
                                </li>
                                <?php } ?>
                              </ul>
                            </div>
                            <?php } ?>

                            <?php if ($met_dpage > 0) { ?>

                            <script>
                            jQuery(function ($) {
                                var $doctorTab = $('ul.met-showproduct-navtabs a[href="#product-content-doctor"]');
                                if ($doctorTab.length > 0)
                                {
                                    $doctorTab.tab('show');
                                }
                            });
                            </script>

                            <?php } ?>

                          </div>

                          </if>

                          <if value="$ui['tag_ok']">

                          <div class="tag">

                            <span>{$data.tagname}</span>

                            <list data="$data['taglist']" name="$tag" num="$ui['tag_num']">

                            <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>

                            </list>

                          </div>

                          </if>

                        </div>

                        <if value="$data['taglist']">

                        <div class="tag-box">

                          <span>{$word.tagweb} : </span>

                          <list data="$data['taglist']" name="$tag">

                            <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>

                          </list>

                        </div>

                        </if>

                        <?php if ($met_rel_activity || $met_rel_shaoer) { ?>
                        <style type="text/css">
                        .met-yiguan-rel{margin:25px 0 0 0;padding:20px 0 0 0;border-top:1px solid #eee;}
                        .met-yiguan-rel h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
                        .met-yiguan-rel ul{margin:0;padding:0;list-style:none;}
                        .met-yiguan-rel li{padding:6px 0;font-size:14px;border-bottom:1px dashed #f0f0f0;}
                        .met-yiguan-rel li a{color:#333;text-decoration:none;}
                        .met-yiguan-rel li a:hover{color:#8a6d3b;}
                        .met-yiguan-rel li span{float:right;color:#999;font-size:13px;}
                        </style>
                        <?php } ?>

                        <if value="$met_rel_activity">
                        <div class="met-yiguan-rel">
                          <h4>本院近期活动</h4>
                          <ul>
                            <list data="$met_rel_activity" name="$rel">
                            <li>
                              <a href="{$rel.url}" title="{$rel.title}">{$rel.title}</a>
                              <span><if value="$rel['start_date']">{$rel.start_date}</if></span>
                            </li>
                            </list>
                          </ul>
                        </div>
                        </if>

                        <if value="$met_rel_shaoer">
                        <div class="met-yiguan-rel">
                          <h4>本院少儿中医课程</h4>
                          <ul>
                            <list data="$met_rel_shaoer" name="$rel">
                            <li>
                              <a href="{$rel.url}" title="{$rel.title}">{$rel.title}</a>
                              <span><if value="$rel['start_date']">{$rel.start_date}</if></span>
                            </li>
                            </list>
                          </ul>
                        </div>
                        </if>

                        <if value="$data['faq_list']">
                        <style type="text/css">
                        .met-yiguan-faq{margin:25px 0 0 0;padding:20px 0 0 0;border-top:1px solid #eee;}
                        .met-yiguan-faq h4{font-size:17px;margin:0 0 12px 0;padding-left:10px;border-left:4px solid #8a6d3b;}
                        .met-yiguan-faq .faq-item{margin-bottom:14px;}
                        .met-yiguan-faq .faq-item h5{font-size:15px;font-weight:600;margin:0 0 6px 0;}
                        .met-yiguan-faq .faq-item p{margin:0;font-size:14px;line-height:1.8;color:#666;}
                        </style>
                        <div class="met-yiguan-faq">
                          <h4>常见问题</h4>
                          <list data="$data['faq_list']" name="$faq">
                          <div class="faq-item">
                            <h5>{$faq.q}</h5>
                            <p>{$faq.a}</p>
                          </div>
                          </list>
                        </div>
                        </if>

                        <div class="showproduct-pager"><pagination /></div>

                      </div>

                    </div>

                  </div>

                </div>

              </div>

            </div> 

          </div>

          <if value="0">

          <div class="met-showproduct-foot">

            <div class="panel product-hot">

              <div class="container">

                <div class="row">

                  <div class="panel-body">

                    <h4 class="example-title">{$ui.hitsname}</h4>

                    <ul class="blocks-2 blocks-sm-3 blocks-lg-3" data-scale='{$v["displayimgs"][0]["x"]}x{$v["displayimgs"][0]["y"]}'>

                      <?php $cls=$ui['hitsid']?$ui['hitsid']:$data['classnow']; ?>

                      <tag action="list" type="$ui['hitstype']" cid="$cls" num="$ui['hitsnumber']">

                      <li>

                        <a href="{$v.url}" title="{$v.title}" class="img" {$g.urlnew}>

                          <img class="imgloading" data-original="{$v.imgurl|thumb:$c['met_productimg_x'],$c['met_productimg_y']}">

                        </a>

                        <a href="{$v.url}" title="{$v.title}" class="txt" {$g.urlnew}>{$v.title}</a>

                      </li>

                      </tag>

                    </ul>

                  </div>

                </div>

              </div>

            </div>

          </div> 

          </if>

          <elseif value="$ui['pagetype'] eq 2"/> 

          <div class="page met-showproduct pagetype{$ui.pagetype} animsition" id="content-1"> 

            <nav class="navbar navbar-default" role="navigation" data-class="{$ui.fixedclass}">

              <div class="container not">

                <ul class="nav navbar-toolbar pull-xs-right shop-btn-body">

                  <if value="$data['para_url']">

                  <list data="$data['para_url']" name="$para_url" num='100'>

                  <li class="m-r-10">

                    <div class="h-50 vertical-align">

                      <div class="vertical-align-middle">

                        <if value="$para_url['value']">

                        <?php
                        // 站外链接（如「官网」）加 rel="nofollow"；站内链接不加
                        $_pu_href = (string)$para_url['value'];
                        $_pu_rel  = (stripos($_pu_href, 'http') === 0 && strpos($_pu_href, $_M['url']['web_site']) !== 0) ? ' rel="nofollow"' : '';
                        ?>
                        <a href="{$para_url.value}" class="linkbox btn btn-danger" target="_blank"<?php echo $_pu_rel; ?>>{$para_url.name}</a>

                        </if>

                      </div>

                    </div>

                  </li>

                  </list>

                  </if> 

                </ul>  

                <div class="head-nav">

                  <div class="navbar-header">

                    <button type="button" class="navbar-toggle collapsed" data-target="#navbar-showproduct-pagetype2" data-toggle="collapse">

                      <span class="sr-only">Toggle navigation</span>

                      <i class="icon wb-chevron-down" aria-hidden="true"></i>

                    </button>

                    <h1 class="navbar-brand">{$data.title}</h1>

                  </div>

                  <div class="collapse navbar-collapse navbar-collapse-toolbar" id="navbar-showproduct-pagetype2">

                    <ul class="nav navbar-toolbar navbar-right met-showproduct-navtabs">

                      <list data="$data['contents']" name="$s">

                      <if value="$s['content']">

                      <li class="nav-item"><a class='nav-link' href="#content{$s._index}" data-get="product-details">{$s.title}</a></li>

                      </if>

                      </list>

                      <if value="$data['para'] && $ui['paranum'] lt count($data['para'])">

                      <li class="nav-item"><a class='nav-link' href="#contenti">{$ui.specpara}</a></li>

                      </if>

                    </ul>

                  </div>

                </div>

              </div>

            </nav>

            <div class="shownews-container full" id="met-imgs-slick">

              <div class="shownews-wrapper">

                <list data="$data['displayimgs']" name="$val">

                <div class="shownews-slide <if value='$val["_first"]'>slick-current</if>">

                  <img class="shownews-lazy" data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$data.img_alt}" />

                </div>

                </list>

              </div>

              <div class="swiper-button-next swiper-button-white"></div>

              <div class="swiper-button-prev swiper-button-white"></div>

            </div>

            <if value="$val['_index'] gt 1">

            <div class="shownews-container-small">

              <div class="shownews-wrapper-small">

                <list data="$data['displayimgs']" name="$val">

                <div class="shownews-slide-small <if value='$val["_first"]'>active</if>">

                  <img class="shownews-lazy" data-src="{$val.img|thumb:$c['met_productdetail_x'],$c['met_productdetail_y']}" data-gallery="{$val.img}" alt="{$data.img_alt}" />

                </div>

                </list>

              </div>

            </div>

            </if>

            <list data="$data['contents']" name="$s">

            <if value="$s['content']">

            <div class="content content{$s._index}" id="content{$s._index}">

              <div class="container">

                <div class="row">

                  <div class="met-editor lazyload clearfix">

                    {$s.content|preg_replace:'/(<img[^>]*)src(=[^>]*>)/', '\\1class="imgloading" data-original\\2',@@}

                    <if value="$data['taglist']&&$s['_last']">

                    <div class="tag-box">

                      <span>{$word.tagweb} : </span>

                      <list data="$data['taglist']" name="$tag">

                        <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>

                      </list>

                    </div>

                    </if>

                  </div>

                </div>

              </div>

            </div>

            </if>

            </list>

            <if value="$data['para'] && $ui['paranum'] lt count($data['para'])">

            <div class="content contenti" id="contenti">

              <div class="container">      

                <ul class="product-para paralist blocks-100 blocks-md-2 blocks-lg-3 blocks-xxl-2">

                  <list data="$data['para']" name="$s">

                  <if value="!($s['_index'] lt $ui['paranum'])">

                  <li class="p-x-0 m-b-15"><span>{$s.name}：</span> {$s.value}</li>

                  </if>

                  </list>

                </ul>

              </div>

            </div>

            </if>

            <div class="product-org-intro">
              <h3>{$data.title} 机构概况</h3>
              <p>{$data.title}是位于<list data="$data['para']" name="$s"><if value="$s['name'] eq '地点'">{$s.value}</if></list>的中医诊疗机构，<if value="$data['specialty_list']">以<list data="$data['specialty_list']" name="$sp">{$sp}</list>等中医特色项目见长，</if>提供针灸、推拿、艾灸、拔罐及中医内科等诊疗与调理服务。{$data.description}</p>
              <ul class="org-meta">
                <li><span>地址：</span><list data="$data['para']" name="$s"><if value="$s['name'] eq '地点'">{$s.value}</if></list></li>
                <li><span>电话：</span><list data="$data['para']" name="$s"><if value="$s['name'] eq '电话'">{$s.value}</if></list></li>
                <li><span>成立时间：</span><list data="$data['para']" name="$s"><if value="$s['name'] eq '成立时间'">{$s.value}</if></list></li>
                <li><span>医保：</span><list data="$data['para']" name="$s"><if value="$s['name'] eq '医保'">{$s.value}</if></list></li>
                <li><span>官网：</span><list data="$data['para']" name="$s"><if value="$s['name'] eq '官网'"><a href="{$s.value}" target="_blank" rel="nofollow">{$s.value}</a></if></list></li>
                <li><span>收费：</span>具体项目与价目以医馆现场公示为准，就诊前可电话咨询确认。</li>
              </ul>
            </div>

            <div class="product-detail-faq">
              <h2>{$data.title} 常见问题</h2>
              <dl>
                <dt>{$data.title} 地址在哪里？怎么去？</dt>
                <dd>本馆详细地址见页面上方信息，建议出行前电话确认营业与出诊时间，可导航前往。</dd>
                <dt>{$data.title} 支持医保吗？</dt>
                <dd>是否支持医保以本馆现场公示为准，就诊前建议先电话核实，避免跑空。</dd>
                <dt>{$data.title} 怎么预约挂号？</dt>
                <dd>可通过页面提供的官网或电话联系本馆，部分馆支持到馆挂号；具体预约方式以本馆安排为准。</dd>
                <dt>{$data.title} 擅长 / 主治什么？</dt>
                <dd><if value="$data['specialty_list']">本馆擅长<list data="$data['specialty_list']" name="$sp">{$sp}</list>等中医特色项目，</if>具体诊疗范围以医馆实际出诊科目为准，建议就诊前电话确认当日可看的病种与坐诊医师。</dd>
                <dt>{$data.title} 怎么收费？有价目表吗？</dt>
                <dd>中医馆多为按项目收费（挂号、针灸、推拿、饮片等），具体价目以医馆现场公示为准；部分项目可走医保或门诊统筹，报销比例各馆不同，建议就诊前电话咨询。</dd>
                <dt>{$data.title} 口碑怎么样？值得去吗？</dt>
                <dd>选中医馆可重点看医师资质、是否有名老中医坐诊、擅长方向是否匹配您的诉求，以及评价与收费是否透明。本馆的地址、电话、医保与擅长信息已在页面标注，便于您提前核对与电话确认。</dd>
              </dl>
            </div>

            <script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "{$data.title} 地址在哪里？怎么去？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "本馆详细地址见页面上方信息，建议出行前电话确认营业与出诊时间，可导航前往。"
      }
    },
    {
      "@type": "Question",
      "name": "{$data.title} 支持医保吗？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "是否支持医保以本馆现场公示为准，就诊前建议先电话核实，避免跑空。"
      }
    },
    {
      "@type": "Question",
      "name": "{$data.title} 怎么预约挂号？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "可通过页面提供的官网或电话联系本馆，部分馆支持到馆挂号；具体预约方式以本馆安排为准。"
      }
    },
    {
      "@type": "Question",
      "name": "{$data.title} 擅长 / 主治什么？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "本馆以针灸、推拿、艾灸、拔罐及中医内科调理为特色，具体诊疗范围以医馆实际出诊科目为准，建议就诊前电话确认当日可看的病种与坐诊医师。"
      }
    },
    {
      "@type": "Question",
      "name": "{$data.title} 怎么收费？有价目表吗？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "中医馆多为按项目收费（挂号、针灸、推拿、饮片等），具体价目以医馆现场公示为准；部分项目可走医保或门诊统筹，报销比例各馆不同，建议就诊前电话咨询。"
      }
    },
    {
      "@type": "Question",
      "name": "{$data.title} 口碑怎么样？值得去吗？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "选择中医馆可重点看医师资质、是否有名老中医坐诊、擅长方向是否匹配诉求，以及评价与收费是否透明。本馆的地址、电话、医保与擅长信息已在页面标注，便于提前核对与电话确认。"
      }
    }
  ]
}
            </script>

            <script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": ["MedicalOrganization","LocalBusiness"],
  "name": "{$data.title}",
  "url": "{$data.url}",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "成都",
    "streetAddress": "<list data='$data[para]' name='$s'><if value="$s[name] eq '地点'">{$s.value}</if></list>"
  },
  "telephone": "<list data='$data[para]' name='$s'><if value="$s[name] eq '电话'">{$s.value}</if></list>"
}
            </script>

          </div> 

          </if>

        </div>

      </div>

<if value="!$ui['has']['sidebar']">

    </div>

  </div>

</section>

</if>