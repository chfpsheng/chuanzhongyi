<?php defined('IN_MET') or exit('No permission'); ?>   
<if value="!$ui['has']['location']">  
<section class="$uicss_main met-content animsition" 
  data-background="<if value='$ui["bgok"]'>{$ui.bgimg}</if>">
  <div class="container">
    <div class="row">
      <div class="<if value='$ui["has"]["sidebar"]'>col-lg-9<else/>col-lg-12</if> met-cons">
</if> 

        <div class="$uicss" m-id="{$ui.mid}">
          

          <div class="met-img">
            <ul class="blocks-100 blocks-xs-{$ui.xs} blocks-md-{$ui.md} blocks-lg-{$ui.lg} blocks-xlg-{$ui.xlg} met-page-ajax met-pager-ajax met-grid" id="met-grid" data-scale="{$scale}">
              <if value="$c['met_product_page'] && $data['sub']">
              <tag action="category" cid="$data['classnow']" type="son">
              <li class="parent-slide shown page1">
                <a href="{$m.url}" title="{$m.name}" {$m.urlnew}>
                  <span><img data-original="{$m.columnimg|thumb:$c['met_productimg_x'],$c['met_productimg_y']}" alt="{$m.name}"></span>
                  <if value="($ui['listtype'] eq 1 && $data['index_num'] neq 2 && $data['index_num'] neq 3) || $data['index_num'] eq 1">
                  <h4 class="on">{$m.name}</h4>
                  <elseif value="($ui['listtype'] eq 2 && $data['index_num'] neq 1 && $data['index_num'] neq 3) || $data['index_num'] eq 2" />
                  <h5><em>{$m.name}</em></h5>                  
                  <elseif value="($ui['listtype'] eq 3 && $data['index_num'] neq 2 && $data['index_num'] neq 1) || $data['index_num'] eq 3" />
                  <h4>{$m.name}</h4> 
                  <b>{$m.namemark}</b>
                  <p>{$m.description|str_replace:"\n",'<br>',@@}</p>
                  </if>
                </a>
              </li>
              </tag>
              <else/>
              <tag action="product.list">
              <li class="parent-slide shown page1">
                <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                  <span><img data-original="{$v.imgurl|thumb:$c['met_productimg_x'],$c['met_productimg_y']}" alt="{$v.img_alt}"></span>
                  <if value="($ui['listtype'] eq 1 && $data['index_num'] neq 2 && $data['index_num'] neq 3) || $data['index_num'] eq 1">
                  <h4 class="on">
                    {$v.title}
                    <if value="$v['price_str']">
                    <strong class="price">{$v.price_str}</strong>
                    </if>
                  </h4>
                  <elseif value="($ui['listtype'] eq 2 && $data['index_num'] neq 1 && $data['index_num'] neq 3) || $data['index_num'] eq 2" />
                  <h5>
                    <em>{$v.title}</em>
                    <if value="$v['price_str']">
                    <strong class="price">{$v.price_str}</strong>
                    </if>
                  </h5>
                  <elseif value="($ui['listtype'] eq 3 && $data['index_num'] neq 2 && $data['index_num'] neq 1) || $data['index_num'] eq 3" />
                  <h4>{$v.title}</h4>
                  <if value="$v['price_str']">
                  <strong class="price">{$v.price_str}</strong>
                  </if>
                  <b>                
                    <list data="$v['para']" name="$t"> 
                    <font>{$t.name} : {$t.value}</font>
                    </list>
                  </b>
                  <p>{$v.description|str_replace:"\n",'<br>',@@}</p>
                  <dl>
                    <dt>{$word.Detail}</dt>
                    <dd><i class="icon wb-eye" aria-hidden="true"></i> {$v.hits}</dd>
                  </dl>
                  </if>
                </a>
              </li>
              </tag>
              </if>
            </ul>
          </div>
          <if value="!($c['met_product_page'] && $data['sub'])">
          <div class="met-pager-ajax-link hidden-md-up" m-type="nosysdata">
            <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn"  data-page="1">
              <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
            </button>
          </div>
          <div class="page-box" m-type="nosysdata"><pager /></div>
          </if>
<div class="product-list-head">
            <h1 class="product-list-title">成都中医馆名录</h1>
            <p class="product-list-intro">成都中医馆名录汇集成都各区特色中医馆、针灸馆与名老中医坐诊信息，涵盖擅长项目、门诊地址、交通与医保情况，帮助市民就近选择可信赖的中医就医机构。无论您想调理体质、针灸推拿，还是寻访名老中医问诊，都可按地区与擅长方向筛选。</p>
          </div>

          <div class="product-list-faq">
            <h2>成都中医馆常见问题</h2>
            <dl>
              <dt>成都中医馆怎么选？</dt>
              <dd>建议先结合自身需求（如针灸、推拿、内科调理）锁定擅长项目，再关注医师资质、出诊时间与是否支持医保。本名录每家馆均标注了擅长方向与联系方式，便于提前电话确认。</dd>
              <dt>成都看中医去哪家比较好？</dt>
              <dd>成都中医馆众多，口碑与擅长各有侧重。可优先选择有固定名老中医坐诊、资质齐全、评价透明的机构；名录中的相关标签可作为参考。</dd>
              <dt>成都中医馆支持医保吗？</dt>
              <dd>部分中医馆已接入医保定点，具体以各机构公示为准。本名录尽量在每家馆信息中标注医保情况，就诊前建议电话核实。</dd>
            </dl>
          </div>

          <script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "成都中医馆怎么选？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "建议先结合自身需求（如针灸、推拿、内科调理）锁定擅长项目，再关注医师资质、出诊时间与是否支持医保。本名录每家馆均标注了擅长方向与联系方式，便于提前电话确认。"
      }
    },
    {
      "@type": "Question",
      "name": "成都看中医去哪家比较好？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "成都中医馆众多，口碑与擅长各有侧重。可优先选择有固定名老中医坐诊、资质齐全、评价透明的机构；名录中的相关标签可作为参考。"
      }
    },
    {
      "@type": "Question",
      "name": "成都中医馆支持医保吗？",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "部分中医馆已接入医保定点，具体以各机构公示为准。本名录尽量在每家馆信息中标注医保情况，就诊前建议电话核实。"
      }
    }
  ]
}
          </script>

          <script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {"@type":"ListItem","position":1,"name":"首页","item":"{$c.met_weburl}"},
    {"@type":"ListItem","position":2,"name":"成都中医馆名录","item":"{$data.url}"}
  ]
}
          </script>

          <script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "成都中医馆名录",
  "url": "{$data.url}",
  "areaServed": "成都"
}
          </script>

		</div>
      </div>
      
<if value="!$ui['has']['sidebar']">
    </div>
  </div>
</section>
</if>