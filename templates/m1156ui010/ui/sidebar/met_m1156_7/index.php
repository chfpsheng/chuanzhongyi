<?php defined('IN_MET') or exit('No permission'); ?> 
<?php include PATH_WEB . '/templates/m1156ui010/ui/sidebar/met_m1156_7/data.php'; ?>

<if value="$ui['ui_show']">

      <div class="$uicss col-lg-3 met-conx" m-id="{$ui.mid}" m-type="nocontent">

        <if value="$data['module'] eq 3">

        <div class="met-hot">

          <h3>热门推荐</h3>

          <ul>

            <if value="$_sidebar_hot">

            <list data="$_sidebar_hot" name="$v">

            <li>

              <a href="{$v.url}" title="{$v.title}" class="clearfix" {$g.urlnew}>

                <span class="img">
                  <if value="$v['imgurl']"><img class="imgloading" data-original="{$v.imgurl|thumb:80,80}" alt="{$v.title}">
                  <else/><img class="imgloading" src="/upload/202610/moren_400.jpeg" alt="{$v.title}"></if>
                </span>

                <h6>{$v.title}</h6>

              </a>

            </li>

            </list>

            </if>

          </ul>

        </div>

        </if>

        <if value="$ui['service_ok']">

        <div class="met-service">

          <h3>{$ui.service_name}</h3>

          <ul>

            <if value="$_sidebar_service">

            <list data="$_sidebar_service" name="$v">

            <li>

              <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>

                <span><img src="{$v.imgurl|thumb:$ui['service_width'],$ui['service_height']}" alt="{$v.title}"></span>

                <h6>{$v.title}</h6>

              </a>

            </li>

            </list>

            <else/>

            <tag action="list" cid="$ui['service_id']?$ui['service_id']:$data['classnow']" type="$ui['service_type']" num="$ui['service_num']">

            <li>

              <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>

                <span><img src="{$v.imgurl|thumb:$ui['service_width'],$ui['service_height']}" alt="{$v.title}"></span>

                <h6>{$v.title}</h6>

              </a>

            </li>

            </tag>

            </if>

          </ul>

        </div>  

        </if>

        <if value="$ui['information_ok']">

        <div class="met-information">

          <h3>{$ui.information_name}</h3>

          <ul>

            <tag action="list" cid="$ui['information_id']?$ui['information_id']:$data['classnow']" type="$ui['information_type']" num="$ui['information_num']">

            <li>

              <h6>

                <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>{$v.title}</a>

              </h6>

            </li>

            </tag>

          </ul>

        </div>

        </if>

      </div>

    </div>

  </div>

</section>

<elseif value="$_GET['pageset']" />

<section class="$uicss" m-id="{$ui.mid}" m-type="nocontent" 

  style="background:#263238;max-height:40px;text-align:center;color:#fff;line-height:40px;display:block;border-bottom:1px solid #888;">

  该栏目设置了侧边栏隐藏，可在"侧边栏配置"中设置显示（该文字仅"可视化"模式下可见）

</section>

</if>