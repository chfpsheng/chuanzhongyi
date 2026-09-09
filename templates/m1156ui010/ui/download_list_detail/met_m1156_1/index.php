<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss lazy" m-id="{$ui.mid}"
<if value="$ui['bgimg'] && !strstr($ui['bgimg'],$c['met_agents_img'])">data-background="{$ui.bgimg}"</if>>
  <if value="$ui['locationok']">
  <div class="location-box">
    <div class="container not">
      <div class="row">
        <ul>
          <li>
            <i class="icon wb-home"></i>
            <span>{$ui.location}</span>
            <a href="{$c.index_url}" title="{$word.home}">{$word.home}</a>
          </li>
          <location>
          <if value="$v['name']">
          <li>
            <a href="{$v.url}" title="{$v.name}" class='{$v.class}'>{$v.name}</a>
          </li>
          </if>
          </location>
        </ul>
      </div>
    </div>
  </div>
  </if>
  <div class="met-download animsition">
    <div class="container">
      <div class="row">
        <div class="col-lg-9 met-download-body">
          <div class="row">
            <div class="met-download-header">
              <h1>{$data.title}</h1>
              <div class="info">
                <span><i class="fa fa-clock-o"></i> {$data.updatetime}</span>
                <if value="$data['issue']">
                <span><i class="fa fa-user-plus"></i> {$data.issue}</span>
                </if>
                <span><i class="icon wb-eye margin-right-5" aria-hidden="true"></i> {$data.hits}</span>
              </div>
            </div>
            <div class="paralist">
              <if value="$data['para']">
              <dl class="dl-horizontal clearfix">
                <list data="$data['para']" name="$val">
                <dt>{$val.name} :</dt>
                <dd>{$val.value}</dd>
                </list>
              </dl>
              </if>
              <if value="$ui['downloadword']">
              <a class="btn btn-outline btn-primary btn-squared met-download-btn" target="_blank"
                href="{$data.downloadurl}" title="{$data.title}">{$ui.downloadword}</a>
              </if>
            </div>
            <div class="met-editor lazyload clearfix">{$data.content}</div>
            <if value="$data['taglist']">
            <div class="tag-box">
              <span>{$data.tagname}</span>
              <list data="$data['taglist']" name="$tag">
              <a href="{$tag.url}" title="{$tag.name}">{$tag.name}</a>
              </list>
            </div>
            </if>
            <div class="met-shownews-footer"><pagination /></div>
          </div>
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
  </div>
</section>