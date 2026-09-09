
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	init: function(){
		if($('.swiper-header').length==0){
			METUI['$uicss_x'].slide(1);
		}
		METUI['$uicss'].find('font[color]').each(function(){
			$(this).css('color',$(this).attr('color'));
		});
	},
	resize: function(res){
		if(Breakpoints.is('lg')){
			METUI['$uicss'].find('.banner-slide ul li.pc img[data-src]').each(function(){
				$(this).attr('src',$(this).attr('data-src'));
				$(this).removeAttr('data-src');
			});
		}else if(Breakpoints.is('xs')){
			METUI['$uicss'].find('.banner-slide ul li.phone img[data-src]').each(function(){
				$(this).attr('src',$(this).attr('data-src'));
				$(this).removeAttr('data-src');
			});
		}else{
			METUI['$uicss'].find('.banner-slide ul li.pad img[data-src]').each(function(){
				$(this).attr('src',$(this).attr('data-src'));
				$(this).removeAttr('data-src');
			});
		}
		if(METUI['$uicss'].hasClass('full')) METUI['$uicss'].height($(window).height());
		if(!res) $(window).resize(function(){ METUI['$uicss_x'].resize(true); });
	},
	slide: function(str){
		switch (str){
			case 1:
				if(METUI['$uicss'].find('.banner-slide').length>1){
					METUI['$uicss_banner']=new Swiper('.$uicss .banner-container',{
						wrapperClass: 'banner-wrapper',
						slideClass: 'banner-slide',
						slidesPerView: 1,
						simulateTouch: false,
						speed: 500,
						loop: true,
						autoplay: 5500,
						autoplayDisableOnInteraction: true,
						autoHeight: !METUI['$uicss'].hasClass('full'),
						lazyLoading: true,
						lazyLoadingClass: 'banner-lazy',
						lazyLoadingInPrevNext: true,
						observer:true,
						observeParents:true,
						watchSlidesProgress : true,
						watchSlidesVisibility : true,
						paginationElement: 'i',
						paginationClickable: true,
						pagination: '.$uicss .banner-pagination',			
						prevButton: '.$uicss .banner-controls.left',
						nextButton: '.$uicss .banner-controls.right',
						onLazyImageReady: function(swiper){
							swiper.update();
						}
					});
				}else{
					METUI['$uicss']
						.find('.banner-slide')
						.addClass('swiper-slide-active')
						.find('li.banner-lazy')
						.css('background-image','url('+METUI['$uicss'].find('li.banner-lazy').attr('data-background')+')')
						.find('img.banner-lazy')
						.attr('src',METUI['$uicss'].find('img.banner-lazy').attr('data-src'));
				}
				if(!METUI['slide']&&METUI['$uicss_banner']){
					var play=false;
					$(window).scroll(function(){
						var wnHeg=$(window).height();
						var scTop=$(window).scrollTop();
						var uiHeg=METUI['$uicss'].height();
						var uiTop=METUI['$uicss'].offset().top;
						if((uiTop-wnHeg<scTop)&&(uiTop+uiHeg>scTop)){
							if(play==false){
								play=true;
								METUI['$uicss_banner'].startAutoplay();
							}
						}else{
							if(play==true){
								play=false;
								METUI['$uicss_banner'].stopAutoplay();
							}
						}
					});
				}
			break;
			case 2:
				if(METUI['$uicss_banner']) METUI['$uicss_banner'].stopAutoplay();
			break;
			case 3:
				if(METUI['$uicss_banner']) METUI['$uicss_banner'].startAutoplay();
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);