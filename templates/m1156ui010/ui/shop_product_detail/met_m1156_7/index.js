
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	init: function(){
		if($('.swiper-header').length==0){
			METUI['$uicss_x'].slide(1);
		}
		if(METUI['$uicss'].find('.met-showproduct').hasClass('pagetype2')){
			$(window).scroll(function(){
				if( METUI['$uicss'].find('.navbar.navbar-default').hasClass('navbar-fixed-top') ){
					METUI['$uicss'].find('.met-showproduct').addClass('top');
				}else{
					METUI['$uicss'].find('.met-showproduct').removeClass('top');
				}
			});
		}
	},
	scroll: function(res){
		if(METUI['$uicss'].find('.met-showproduct').hasClass('pagetype2')){
			if(res) clearTimeout(times);
			times=window.setTimeout(function(){
				var nav=METUI['$uicss'].find("nav.navbar.navbar-default");
				if(nav.attr('data-class')!=''){
					if(nav.hasClass("navbar-fixed-top")){
						$(nav.attr('data-class')).css('visibility','hidden').css('opacity',0);
					}else{
						$(nav.attr('data-class')).css('visibility','visible').css('opacity',1);
					}
				}
			},100);
		}
		if(!res) $(window).scroll(function(){ METUI['$uicss_x'].scroll(true); });
	},
	resize: function(res){
		
		if(METUI['$uicss'].find('.met-showproduct.pagetype2 nav.navbar').length>0){
			CTop=METUI['$uicss'].find('.met-showproduct.pagetype2 nav.navbar').height();
			METUI['$uicss'].find('.shownews-container.full').css('padding-top',CTop);
			METUI['$uicss'].find('.shownews-container.full .swiper-button-next,.shownews-container.full .swiper-button-prev').css('margin-top',CTop/2-22);
			
		}
		
		if(!res) $(window).resize(function(){ METUI['$uicss_x'].resize(true); });
	},
	slide: function(str){
		switch (str){
			case 1:
				if(!METUI['slide']){
					$('.$uicss_main')
						.css('background-image','url('+$('.$uicss_main').attr('data-background')+')')
						.removeAttr('data-background')
				}
				METUI['$uicss'].find('.shownews-slide img').each(function(index, element) {
					$(this).data('src',$(this).attr('data-src'));
				});
				shownews_container = new Swiper('.$uicss .shownews-container',{
					wrapperClass: 'shownews-wrapper',
					slideClass: 'shownews-slide',
					slideActiveClass: 'slick-current',
					observer: true,
					observeParents: true,
					keyboardControl: true,
					lazyLoading: true,
					lazyLoadingClass: 'shownews-lazy',
					lazyLoadingOnTransitionStart: true,
					watchSlidesProgress: true,
					watchSlidesVisibility: true,
					prevButton: '.$uicss .swiper-button-prev',
					nextButton: '.$uicss .swiper-button-next',
					onSlideChangeStart: function(swiper){
						METUI['$uicss'].find('.shownews-slide-small').removeClass('active').eq(swiper.activeIndex).addClass('active');
						METUI['$uicss'].find('.shownews-slide img').each(function(index, element) {
							if($(this).attr('src')!=$(this).data('src')){
								$(this).removeClass('swiper-lazy-loaded swiper-canvas');
								$(this).attr('data-src',$(this).data('src'));
							}				
						});
						that=METUI['$uicss'].find('.shownews-slide img').eq(swiper.activeIndex);
						that.attr('src',that.data('src'));
					}
				});
				var shownews_small_length=METUI['$uicss'].find('.shownews-container-small').length;
				if(shownews_small_length>0){
					METUI['$uicss'].find('.shownews-container-small').css(
						'max-width',METUI['$uicss'].find('.shownews-slide-small').length*95-15+'px'
					);
					shownews_container_small = new Swiper('.$uicss .shownews-container-small',{
						wrapperClass: 'shownews-wrapper-small',
						slideClass: 'shownews-slide-small',
						slidesPerView: 'auto',
						observer:true,
						observeParents:true,
						lazyLoading: true,
						lazyLoadingClass: 'shownews-lazy',
						lazyLoadingOnTransitionStart: true,
						keyboardControl: true,
						watchSlidesProgress: true,
						watchSlidesVisibility: true
					});
					shownews_container_small.on('tap',function(swiper){
						shownews_container.slideTo(swiper.clickedIndex);
						METUI['$uicss'].find('.shownews-slide-small').removeClass('active').eq(swiper.clickedIndex).addClass('active');
					});
				}
				
				
				METUI['$uicss'].find(".met-editor,.shownews-container").wrapInner("<div class='editorlightgallery'></div>");
				METUI['$uicss'].find(".met-editor,.shownews-container").each(function() {
					var img_gallery_open=1,
						this_editor=this;
					METUI['$uicss'].find("img",this).one('click',function() {
						if(img_gallery_open){
							METUI['$uicss'].find('img',this_editor).each(function() {
								if($(this).parent("a").length==0){
									var data_thumb=data_src = ($(this).attr("data-original")||$(this).attr("data-gallery"));
									$(this).wrap("<div class='lg-item-box' data-src='"+data_src+"' data-exthumbimage='"+data_thumb+"'></div>");
								}
							});
							METUI['$uicss'].find('.editorlightgallery',this_editor).galleryLoad();
							$(this).parent('.lg-item-box').trigger('click');
							img_gallery_open=0;
						}
					});
				});
				if(METUI['$uicss'].find('.met-showproduct.pagetype2 nav.navbar').length>0){
					METUI['$uicss'].find('.shownews-container.full').css('padding-top',METUI['$uicss'].find('.met-showproduct.pagetype2 nav.navbar').height());
				}
			break;
			case 2:
			
			break;
			case 3:
			
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
