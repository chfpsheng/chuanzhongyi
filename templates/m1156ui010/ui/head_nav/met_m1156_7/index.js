METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	init: function(e){
		$('body').addClass('nav-header');

		function head_width(res){
			$('.head-left').css('max-width',$('.head-box .container').width()-$('.head-right').width());
			if(!res) $(window).resize(function(){
				win_width=$(window).width();
				head_width(true);
			});
		}
		head_width();
		new Swiper('.head-left',{
			wrapperClass: 'head-left-wrapper',
			slideClass: 'head-left-slide',
			slidesPerView : 'auto',
			simulateTouch : false,
			freeMode : true,
			freeModeSticky : true,
			mousewheelControl: true,
			mousewheelSensitivity: 1,
			observer:true,
			observeParents:true
		});

		$('.head-left-slide font a[data-id]').hover(function(){
			$('.head-box .head-left-img').find('img').removeClass('active');
			$('.head-box .head-left-img').find('#'+$(this).attr('data-id')).addClass('active');
			$('.head-box .head-left-img').addClass('active').css('left',$(this).position().left+5);
		},function(){
			$('.head-box .head-left-img').find('img').removeClass('active');
			$('.head-box .head-left-img').removeClass('active');
		});

		$('.head-other b').click(function(){
			if($('.head-other').hasClass('active')){
				$('.head-other').removeClass('active');
			}else{
				$('.head-other').addClass('active');
			}
		}).mouseout(function(){
			if($('.head-other').hasClass('active')){
				$('.head-other').removeClass('active');
			}
		});

		$('.met-categories ul>li>ul').each(function(){
			$(this).parent('li').addClass('has').click(function(){
				if(!$(this).hasClass('active')){
					$(this).addClass('active');
				}else{
					$(this).removeClass('active');
				}
			});
		});


		var Site=window.Site;
		$(function(){
			Site.run();

			var wh = $(window).height();

			$('.met-nav .dropdown a.link').click(function(){
				if(!Breakpoints.is('xs') && $(this).data("hover")) window.location.href = $(this).attr('href');
			});

			if($(".navbar-fixed-top").length){
				$(window).scroll(function (){
					if($(".navbar-fixed-top").offset().top>1){
						$(".navbar-fixed-top").addClass("navbar-shadow");
					}else{
						$(".navbar-fixed-top").removeClass("navbar-shadow");
					}
				});
			}

			Breakpoints.on('sm md',{
				enter: function(){
					setTimeout(function(){
						$('.met-nav .nav>li>.dropdown-menu').each(function() {
							if($(this).parent('li').offset().left < $(window).width()/2-$(this).parent('li').width()/2){
								$(this).removeClass('dropdown-menu-right').addClass('dropdown-menu-left');
							}
							if($(this).parent('li').offset().left > $(window).width()/2-$(this).parent('li').width()/2){
								$('.dropdown-submenu',this).addClass('dropdown-menu-left');
							}
						});
					},0)
				}
			});

				setTimeout(function(){
					$('.met-nav .nav>li').each(function() {
						if($('.dropdown-submenu',this).length) $(this).addClass('openallsub');
					})
				},0)

			Breakpoints.on('sm md lg',{
				enter: function(){
					$(".navlist .dropdown-submenu").hover(function(){
						$(this).parent('.dropdown-menu').addClass('overflow-visible');
					},function(){
						$(this).parent('.dropdown-menu').removeClass('overflow-visible');
					});
				}
			})

			var $navlist=$('.met-nav .navlist'),
				nav_langlist=function(){
					$navlist.removeClass('flex');
					if(!Breakpoints.is('xs') && $navlist.position().top>20){
						$('body').addClass('met-navflex');
						$navlist.addClass('flex');
						if($('.$uicss').hasClass('fixed')){
							$('body').css('padding-top',$('.$uicss').height());
							window.setTimeout(function(){
								$('body').css('padding-top',$('.$uicss').height());
							},1000);
						}
						if($('body').hasClass('met-navfixed')) $('body').addClass('met-navfixed-langlist');
					}else{
						$('body').removeClass('met-navflex');
						$navlist.removeClass('flex');
						if($('body').hasClass('met-navfixed')) $('body').removeClass('met-navfixed-langlist');
					}
				};
			nav_langlist();
			$(window).resize(function() {
				nav_langlist();
			});




		})

		if($('.$uicss').hasClass('fixed')){
			var ti='';
			$('body').css('padding-top',$('.$uicss').height());
			$(window).resize(function() {
				clearTimeout(ti);
				ti=window.setTimeout(function(){
					$('body').css('padding-top',$('.$uicss').height());
				},200);
			});

			if($('.$uicss .head-box').length>0){
				$(window).scroll(function(){
					if($(window).scrollTop()>40){
						$('.$uicss.fixed').addClass('scroll');
					}else{
						$('.$uicss.fixed').removeClass('scroll');
					}
				});
			}


			if(!Breakpoints.is('xs')){

				!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof exports?module.exports=a:a(jQuery)}(function(a){function b(b){var g=b||window.event,h=i.call(arguments,1),j=0,l=0,m=0,n=0,o=0,p=0;if(b=a.event.fix(g),b.type="mousewheel","detail"in g&&(m=-1*g.detail),"wheelDelta"in g&&(m=g.wheelDelta),"wheelDeltaY"in g&&(m=g.wheelDeltaY),"wheelDeltaX"in g&&(l=-1*g.wheelDeltaX),"axis"in g&&g.axis===g.HORIZONTAL_AXIS&&(l=-1*m,m=0),j=0===m?l:m,"deltaY"in g&&(m=-1*g.deltaY,j=m),"deltaX"in g&&(l=g.deltaX,0===m&&(j=-1*l)),0!==m||0!==l){if(1===g.deltaMode){var q=a.data(this,"mousewheel-line-height");j*=q,m*=q,l*=q}else if(2===g.deltaMode){var r=a.data(this,"mousewheel-page-height");j*=r,m*=r,l*=r}if(n=Math.max(Math.abs(m),Math.abs(l)),(!f||f>n)&&(f=n,d(g,n)&&(f/=40)),d(g,n)&&(j/=40,l/=40,m/=40),j=Math[j>=1?"floor":"ceil"](j/f),l=Math[l>=1?"floor":"ceil"](l/f),m=Math[m>=1?"floor":"ceil"](m/f),k.settings.normalizeOffset&&this.getBoundingClientRect){var s=this.getBoundingClientRect();o=b.clientX-s.left,p=b.clientY-s.top}return b.deltaX=l,b.deltaY=m,b.deltaFactor=f,b.offsetX=o,b.offsetY=p,b.deltaMode=0,h.unshift(b,j,l,m),e&&clearTimeout(e),e=setTimeout(c,200),(a.event.dispatch||a.event.handle).apply(this,h)}}function c(){f=null}function d(a,b){return k.settings.adjustOldDeltas&&"mousewheel"===a.type&&b%120===0}var e,f,g=["wheel","mousewheel","DOMMouseScroll","MozMousePixelScroll"],h="onwheel"in document||document.documentMode>=9?["wheel"]:["mousewheel","DomMouseScroll","MozMousePixelScroll"],i=Array.prototype.slice;if(a.event.fixHooks)for(var j=g.length;j;)a.event.fixHooks[g[--j]]=a.event.mouseHooks;var k=a.event.special.mousewheel={version:"3.1.12",setup:function(){if(this.addEventListener)for(var c=h.length;c;)this.addEventListener(h[--c],b,!1);else this.onmousewheel=b;a.data(this,"mousewheel-line-height",k.getLineHeight(this)),a.data(this,"mousewheel-page-height",k.getPageHeight(this))},teardown:function(){if(this.removeEventListener)for(var c=h.length;c;)this.removeEventListener(h[--c],b,!1);else this.onmousewheel=null;a.removeData(this,"mousewheel-line-height"),a.removeData(this,"mousewheel-page-height")},getLineHeight:function(b){var c=a(b),d=c["offsetParent"in a.fn?"offsetParent":"parent"]();return d.length||(d=a("body")),parseInt(d.css("fontSize"),10)||parseInt(c.css("fontSize"),10)||16},getPageHeight:function(b){return a(b).height()},settings:{adjustOldDeltas:!0,normalizeOffset:!0}};a.fn.extend({mousewheel:function(a){return a?this.bind("mousewheel",a):this.trigger("mousewheel")},unmousewheel:function(a){return this.unbind("mousewheel",a)}})});

				$('.$uicss .met-nav .dropdown-menu').mousewheel(function(event, delta) {
					var dir = delta > 0 ? 'Up' : 'Down';
					mt = $(this).css('margin-top').replace('px','')*1;
					tp = 40;
					if (dir == 'Up') {
						$(this).css('margin-top',mt+tp);
					} else {
						$(this).css('margin-top',mt-tp);
					}
					return false;
				}).mouseleave(function(){
					$(this).css('margin-top',0);
				});
			}


		}
	},
	simplified: function(){
        var b=METUI['$uicss'].find('.btn-cntotc');
        b.on('click', function(event) {
             var lang=$(this).attr('data-tolang');
			 if (lang=='tc') {
				$('body').s2t();
				$(this).attr('data-tolang', 'cn');
				$(this).text('简体');
			 } else if(lang=='cn') {
				$('body').t2s();
				$(this).attr('data-tolang', 'tc');
				$(this).text('繁體');
			 }
		});
	}
}
var x=new metui(METUI_FUN['$uicss']);