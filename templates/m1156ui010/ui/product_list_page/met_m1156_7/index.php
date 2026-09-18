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
		</div>
      </div>
      
<if value="!$ui['has']['sidebar']">
    </div>
  </div>
</section>
</if>