<?php defined('IN_MET') or exit('No permission'); ?>
<section class="$uicss <if value='$ui["fixed"]'>fixed</if>" m-id="{$ui.mid}" m-type="head_nav">
<if value="$ui['top_ok']">
<header role="heading">
  <div class="head-box">
    <div class="container">
      <div class="head-left">
        <div class="head-left-wrapper">
          <div class="head-left-slide">
            {$c.met_seo}
            <font>
            <tag action="category" type="son" cid="$ui['icon_id']">
            <hr>
            <a <if value="$m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img']))">href="javascript:void(0);" data-id="{$m.id}"<else/>href="{$m.url}" rel="nofollow" target="_blank"</if>>
              <i class="{$m.icon}"></i>
            </a>
            </tag>
            </font>
          </div>
        </div>
      </div>
      <div class="head-left-img">
        <tag action="category" type="son" cid="$ui['icon_id']">
          <if value="$_GET['pageset']||($m['columnimg']&&!strstr($m['columnimg'],str_replace('../','',$c['met_agents_img'])))">
          <img id="{$m.id}" src="{$m.columnimg}" alt="{$m.name}">
          </if>
        </tag>
      </div>
      <div class="head-right">
        <div class="head-other">
          <b>{$ui.right_more}<i class="caret"></i></b>
          <span>
          <tag action="category" type="son" cid="$ui['right_id']">
          <if value="!$m['_first']"><hr /></if>
          <a href="{$m.url}" title="{$m.name}" {$m.urlnew}><i class="{$m.icon}"></i>{$m.name}</a>
          </tag>
          </span>
        </div>
      </div>
    </div>
  </div>
</header>
</if>
<nav class=" navbar navbar-default met-nav " role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle hamburger hamburger-close collapsed"
				data-target="#navbar-default-collapse" data-toggle="collapse">
      <span class="sr-only">&nbsp;</span>
      <span class="hamburger-bar"></span>
      </button>
      <a href="{$c.index_url}" class="navbar-brand navbar-logo vertical-align" title="{$c.met_webname}">
        <if value="$data['classnow'] eq 10001">
            <h1 hidden>{$c.met_webname}</h1>
            <else/>
            <h3 hidden>{$c.met_webname}</h3>
        </if>
        <if value="($data['classnow'] neq 10001&&!$data['id'])||$data['module'] eq 1">
            <h1 hidden>{$data.name}</h1>
            <if value="$data['classtype'] neq 1">
                <tag action="category" type="current" cid="$data['class1']">
                    <h2 hidden>{$m.name}</h2>
                </tag>
            </if>
            <else/>
            <if value="!$data['id']&&$data['classnow'] neq 10001">
                <h1 hidden>{$data.name}</h1>
            </if>
        </if>
        <div class="vertical-align-middle">
          <img src="{$c.met_logo}" alt="{$c.met_logo_keyword}" class="hidden-sm-down">
          <img src="{$c.met_mobile_logo}" alt="{$c.met_logo_keyword}" class="hidden-md-up">
        </div>
      </a>
    </div>
    <div class="navbar-right vertical-align m-r-0 met-lang">
        <if value="$c['met_ch_lang'] && $ui['s2t_ok']">
                <li class="met-langlist met-s2t nav-item vertical-align nav-item" m-id="lang" m-type="lang">
                <div class="inline-block link">
                    <if value="$data['lang'] eq cn">
                    <button type="button" class="btn btn-outline btn-default btn-squared btn-lang btn-cntotc" data-tolang='tc'>繁体</button>
                    <elseif value="$data['lang'] eq tc"/>
                    <button type="button" class="btn btn-outline btn-default btn-squared btn-lang btn-cntotc"  data-tolang='cn'>简体</button>
                    </if>
                </div>
            	</li>
        </if>
        <lang></lang>
        <if value="$c['met_lang_mark'] && $sub gt 1 && $ui['lang_ok']">
              <li class="met-langlist nav-item vertical-align" m-id='lang' m-type='lang'>
                  <div class="inline-block dropdown ">
                      <lang>
                      <if value="($sub gt 2)?($data['lang'] eq $v['mark']):$data['lang'] neq $v['mark']">
                      <if value="$sub gt 2">
                      <button type="button" data-toggle="dropdown" class="btn btn-outline btn-default btn-squared dropdown-toggle btn-lang">
                      <else/>
                      <a href="{$v.met_weburl}" title="{$v.name}" <if value="$v['newwindows']">target="_blank"</if> class="btn btn-outline btn-default btn-squared btn-lang">
                      </if>
                          <img src="{$v.flag}" alt="{$v.name}" style="max-width:100%;">
                          <span >{$v.name}</span>
                       <if value="$sub gt 2"></button><else/></a></if>
                      </if>
                      </lang>
                      <if value="$sub gt 2">
                      <div class="dropdown-menu dropdown-menu-right animate animate-reverse" id="met-langlist-dropdown" role="menu">
                          <lang>
                          <if value="$data['lang'] neq $v['mark']">
                          <a href="{$v.met_weburl}" title="{$v.name}" class='dropdown-item' <if value="$v['newwindows']">target="_blank"</if>>
                              <img src="{$v.flag}" alt="{$v.name}" style="max-width:100%;">
                              {$v.name}
                          </a>
                          </if>
                          </lang>
                      </div>
                      </if>
                  </div>
              </li>
        </if>
    </div>
    <div class="collapse navbar-collapse navbar-collapse-toolbar" id="navbar-default-collapse">
      <if value="$ui['user_ok']">
      <if value="$user">
      <if value="$c['shopv2_open']">
          <ul class="navbar-nav navbar-right vertical-align p-l-0 m-b-0 met-head-user met-head-shop" m-id="member" m-type="member">
              <li class="dropdown">
                  <a
                      href="javascript:;"
                      class="navbar-avatar dropdown-toggle"
                      data-toggle="dropdown"
                      aria-expanded="false"
                  >
                  <span class="avatar avatar-online m-r-5"><img src="{$user.head}" alt="{$user.username}"/></span>
                      {$user.username}
                  </a>
                  <ul class="dropdown-menu dropdown-menu-right animate" role="menu">
                      <tag action="app_column" name="$v">
                       <li role="presentation">
                          <a href="{$v.url}" class="dropdown-item" {$v.target}><i class="icon wb-settings" aria-hidden="true"></i> {$v.title}</a>
                      </li>
                      </tag>
                      <li class="divider" role="presentation"></li>
                      <li role="presentation">
                          <a href="{$url.shop_member_login_out}" class="dropdown-item" role="menuitem"><i class="icon wb-power" aria-hidden="true"></i> {$word.app_shop_out}</a>
                      </li>
                  </ul>
              </li>
              <li class="dropdown shop_cart">
                  <a
                      href="javascript:void(0)"
                      title="{$word.app_shop_cart}"
                      data-toggle="dropdown"
                      aria-expanded="false"
                      data-animation="slide-bottom10"
                      role="button"
                  >
                      <i class="icon wb-shopping-cart" aria-hidden="true"></i>
                      {$word.app_shop_cart}
                      <span class="badge badge-danger up hide topcart-goodnum"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media topcartremove" role="menu">
                      <li class="dropdown-menu-header">
                          <h5>{$word.app_shop_cart}</h5>
                          <span class="label label-round label-danger">{$word.app_shop_intotal} <span class="topcart-goodnum"></span> {$word.app_shop_piece}{$word.app_shop_commodity}</span>
                      </li>
                      <li class="list-group dropdown-scrollable" role="presentation">
                          <div data-role="container">
                              <div data-role="content" id="topcart-body"></div>
                          </div>
                      </li>
                      <li class="dropdown-menu-footer" role="presentation">
                          <div class="dropdown-menu-footer-btn">
                              <a href="{$url.shop_cart}" class="btn btn-squared btn-danger margin-bottom-5 margin-right-10">{$word.app_shop_gosettlement}</a>
                          </div>
                          <span class="red-600 font-size-18 topcarttotal"></span>
                      </li>
                  </ul>
              </li>
          </ul>
          <else/>
          <ul class="navbar-nav navbar-right vertical-align p-l-0 m-b-0 met-head-user" m-id="member" m-type="member">
              <li class="dropdown">
                  <a
                      href="javascript:;"
                      class="navbar-avatar dropdown-toggle"
                      data-toggle="dropdown"
                      aria-expanded="false"
                  >
                  <span class="avatar avatar-online m-r-5"><img src="{$user.head}" alt="{$user.username}"/></span>
                      {$user.username}
                  </a>
                  <ul class="dropdown-menu dropdown-menu-right animate">
                      <li role="presentation">
                          <a href="{$c.met_weburl}member/basic.php?lang={$_M['lang']}" class="dropdown-item" title='{$word.memberIndex9}' role="menuitem"><i class="icon wb-user" aria-hidden="true"></i> {$word.memberIndex9}</a>
                      </li>
                      <li role="presentation">
                          <a href="{$c.met_weburl}member/basic.php?lang={$_M['lang']}&a=dosafety" class="dropdown-item" title='{$word.accsafe}' role="menuitem"><i class="icon wb-lock" aria-hidden="true"></i> {$word.accsafe}</a>
                      </li>
                      <li class="divider" role="presentation"></li>
                      <li role="presentation">
                          <a href="{$c.met_weburl}member/login.php?lang={$_M['lang']}&a=dologout" class="dropdown-item" role="menuitem"><i class="icon wb-power" aria-hidden="true"></i> {$word.memberIndex10}</a>
                      </li>
                  </ul>
              </li>
          </ul>
      </if>
      <else/>
      <div class="navbar-nav navbar-right vertical-align met-nav-login">
        <div class="vertical-align-middle m-r-10">
             <a href="{$_M['url']['site']}member/register_include.php?lang={$_M['lang']}" class="btn btn-squared btn-success">{$word.register}</a>
        </div>
        <div class="vertical-align-middle">
              <a href="{$_M['url']['site']}member/login.php?lang={$_M['lang']}" class="btn btn-squared btn-primary btn-outline">{$word.login}</a>
        </div>
      </div>
      </if>
      </if>
      <if value="$ui['search_ok']">
      <div class="navbar-right search-box <if value='($sub gt 1 && $ui["lang_ok"]) && $ui["user_ok"]'>go</if>">
        <div class="search-button">
          <i class="wb-search"></i>
        </div>
        <div class="search-form">
          <tag action="search.global"></tag>
          <!-- <form method="get" action="{$c.index_url}search/search.php?lang={$_M['lang']}">
            <input type="hidden" name='class1' value="{$data.class1}">
            <input type="hidden" name='class2' value="{$data.class2}">
            <input type="hidden" name='class3' value="{$data.class3}">
            <input type="hidden" name='search' value="search">
            <input type="hidden" name='order' value="com">
            <input type="text" name="searchword" placeholder="{$ui.search}">
            <button type="submit" class="input-search-btn"><i class="icon wb-search" aria-hidden="true"></i></button>
          </form> -->
        </div>
      </div>
      </if>
      <ul class="nav navbar-nav navbar-right navlist">
        <li class="nav-item m-r-20">
          <a href="{$c.index_url}" title="{$word.home}" class="link <if value="$data['classnow'] eq 10001">active</if>">{$word.home}</a>
        </li>
        <tag action="category" type="head" class="active">
        <if value="$m['sub']&&$m['module']!=6&&$m['module']!=7&&$ui['nav2_ok']&&!in_array(strip_tags($m['name']),explode('|',strip_tags($ui['nav2_hide'])))">
        <li class="nav-item dropdown m-r-20">
          <a class="dropdown-toggle link {$m.class}" href="{$m.url}" title="{$m.name}" {$m.urlnew}
			data-hover="dropdown" data-toggle="dropdown"><if value="$m['_name']">{$m._name}<else/>{$m.name}</if></a>
          <ul class="two-menu dropdown-menu dropdown-menu-right bullet">
            <if value="!($m['module'] eq 1 && !$m['isshow'])">
            <li class="nav-parent visible-xs">
              <a class="dropdown-submenu nav-parent hidden-lg-up <if value='!$data["class2"]'>{$m.class}</if>" href="{$m.url}" title="{$ui.all}" {$m.urlnew}>
             	<if value="$m['module'] neq 1">{$ui.nav2_all}<else/><if value="$m['_name']">{$m._name}<else/>{$m.name}</if></if>
              </a>
            </li>
            </if>
            <tag action="category" cid="$m['id']" type="son" class="active">
            <if value="$m['sub']">
			<li class="dropdown-submenu">
              <a href="{$m.url}" class="{$m.class}" title="{$m.name}" {$m.urlnew}><if value="$m['_name']">{$m._name}<else/>{$m.name}</if></a>
              <ul class="dropdown-menu animate">
                <if value="!($m['module'] eq 1 && !$m['isshow'])">
                <li class="nav-parent visible-xs">
                  <a class="<if value='!$data["class3"]'>{$m.class}</if>" href="{$m.url}" title="{$ui.all}" {$m.urlnew}>
                    <if value="$m['module'] neq 1">{$ui.nav2_all}<else/><if value="$m['_name']">{$m._name}<else/>{$m.name}</if></if>
                  </a>
                </li>
                </if>
                <tag action="category" cid="$m['id']" type="son" class="active">
                <li><a href="{$m.url}" class="{$m.class}" title="{$m.name}" {$m.urlnew}><if value="$m['_name']">{$m._name}<else/>{$m.name}</if></a></li>
			    </tag>
              </ul>
			</li>
            <else/>
            <li>
              <a href="{$m.url}" class="{$m.class}" title="{$m.name}" {$m.urlnew}><if value="$m['_name']">{$m._name}<else/>{$m.name}</if></a>
            </li>
            </if>
            </tag>
          </ul>
        </li>
        <else/>
        <li class="nav-item m-r-20">
          <a class="link {$m.class}" href="{$m.url}" title="{$m.name}" {$m.urlnew}><if value="$m['_name']">{$m._name}<else/>{$m.name}</if></a>
        </li>
        </if>
        </tag>
      </ul>
    </div>
  </div>
</nav>
</section>