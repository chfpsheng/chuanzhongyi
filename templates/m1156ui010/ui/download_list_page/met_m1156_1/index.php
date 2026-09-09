<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss lazy" m-id="{$ui.mid}"
<if value="$ui['bgimg'] && !strstr($ui['bgimg'],$c['met_agents_img'])">data-background="{$ui.bgimg}"</if>>
  <div class="met-download animsition">
    <div class="container">
      <div class="row">
		<div class="col-lg-9 met-download-body">
          <div class="row">
			<div class="met-download-list">
              <ul class="list-group list-group-dividered list-group-full met-page-ajax met-pager-ajax"
              	data-scale="{$c.met_newsimg_y}x{$c.met_newsimg_x}">
              <tag action="download.list">
                <li class="list-group-item">
                  <div class="media">
                    <div class="media-left">
                      <a href="{$v.url}" title="{$v.title}" {$v.urlnew}><i class="icon fa-file-archive-o" aria-hidden="true"></i></a>
                    </div>
                    <div class="media-body">
                      <div class="pull-right">
                        <a class="btn btn-outline btn-primary btn-squared" href="{$v.downloadurl}" title="{$v.title}" target="_blank">{$ui.downword}</a>
                      </div>
                      <h4 class="media-heading">
                        <a class="name" href="{$v.url}" title="{$v.title}" {$v.urlnew}>{$v._title}</a>
                      </h4>
                      <small>
                        <i class="fa fa-files-o m-l-10"></i> {$v.filesize}Kb
                        <i class="fa fa-clock-o m-l-10"></i> {$v.updatetime}
                      </small>
                    </div>
                  </div>
                </li>
              </tag>
              </ul>
            </div>
          </div>
        </div>
        <div class="met-pager-ajax-link hidden-md-up" m-type="nosysdata">
          <button type="button" class="btn btn-primary btn-block btn-squared ladda-button" id="met-pager-btn"  data-page="1">
            <i class="icon wb-chevron-down m-r-5" aria-hidden="true"></i>
          </button>
        </div>
        <div class="col-lg-3">
          <div class="row">
            <div class="met-news-bar">
              <div class="sidenews-lists">
                <h3><span>{$ui.barlisttitle}</span></h3>
                <ul>
                  <tag action="list" type="$ui['barlisttype']" cid="$ui['barlistid']" num="$ui['barlistnum']">
                    <li>
                      <a href="{$v.url}" title="{$v.title}" {$g.urlnew}>
                        <if value="$v['downloadurl']">
                        <i class="img-icon fa fa-file-archive-o"></i>
                        <else/>
                        <img class="imgloading" data-original="{$v.imgurl|thumb:145,123}">
                        </if>
                        <b>{$v.title}</b>
                        <p>{$v.updatetime}</p>
                      </a>
                    </li>
                  </tag>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="page-box" m-type="nosysdata"><pager /></div>
  </div>
</section>