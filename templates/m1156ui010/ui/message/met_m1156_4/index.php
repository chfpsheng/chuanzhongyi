<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss lazy" m-id="{$ui.mid}"
<if value='$ui["bgimg"] && !strstr($ui["bgimg"],$c["met_agents_img"])'>data-background="{$ui.bgimg}"</if>>
  <div class="met-message animsition">
    <div class="container">
      <div class="row">
        <tag action="message.list"></tag>
        <if value="$v['addtime']">
        <div class="col-lg-8">
          <div class="row">
            <div class="met-message-body message-list">
              <ul class="list-group list-group-dividered list-group-full met-page-ajax met-pager-ajax">
                <tag action="message.list">
                <li class="list-group-item">
                  <div class="media">
                    <div class="media-left">
                      <i class="icon wb-user-circle" aria-hidden="true"></i>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">
                        <small class="pull-right">{$v.addtime}</small> {$v.name}
                      </h4>
                      <p>{$v.content}</p>
                      <div class="content well margin-bottom-0">{$v.useinfo} {$v.met_fd_content}</div>
                    </div>
                  </div>
                </li>
                </tag>
              </ul>
              <div class="page-box" m-type="nosysdata"><pager /></div>
                <div class="met-pager-ajax-link hidden-md-up" m-type="nosysdata">
                  <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn"  data-page="1">
                    <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
                  </button>
                </div>
              </div>
          </div>
        </div>
        <div class="col-lg-4">
        <else/>
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
        </if>
          <div class="row">
            <div class="met-message-submit">
              <tag action='message.form'></tag>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>