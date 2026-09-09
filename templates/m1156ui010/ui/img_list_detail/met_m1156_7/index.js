METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	init: function(){
		if($('.swiper-header').length==0 || METUI['$uicss'].prev('[class*="location_met"]').length>0){
			METUI['$uicss_x'].slide(1);
		}		
	},
	resize: function(res){
		
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

	
				var met_prevArrow='<button type="button" class="slick-prev"><i class="icon wb-chevron-left vertical-align-middle"></button>',
					met_nextArrow='<button type="button" class="slick-next"><i class="icon wb-chevron-right vertical-align-middle"></i></button>';	
					
				var met_img_carousel='#met-imgs-carousel',
					met_img_carousel_slide=met_img_carousel+' .slick-slide';
					
				if($(met_img_carousel_slide).length>1){
					var slickdots=met_img_carousel+' ul.slick-dots',
						slickdots_div=met_img_carousel+' ul.slick-dots div',
						slickdots_li=met_img_carousel+' ul.slick-dots li',
						showpro_index=0;
					//生成缩略图
					$(met_img_carousel).on('init', function(event, slick){
						var met_img_carousel_slide_true=met_img_carousel_slide+':not(.slick-cloned)';
						for (var i = 0; i < $(met_img_carousel_slide_true).length; i++) {
							var thumbsrc=$(met_img_carousel_slide_true+':eq('+i+')').data('exthumbimage'),
								thumbalt=$(met_img_carousel_slide_true+':eq('+i+') img').attr('alt'),
								showpro_thumb='<img src="'+thumbsrc+'" alt="'+thumbalt+'" />';
							$(slickdots_li).eq(i).html(showpro_thumb);
						}
						$(slickdots).wrapInner('<div></div>');
						$(slickdots_div).width($(slickdots_li).length*74-10);
					})
					//开始轮播
					var slick_swipe=true,
						slick_fade=false;
						
					$(met_img_carousel).slick({
						dots: true,
						speed: 500,
						fade:slick_fade,
						swipe:slick_swipe,
						lazyloadPrevNext:true,
						prevArrow:met_prevArrow,
						nextArrow:met_nextArrow,
					})
					$(met_img_carousel).on('beforeChange', function(event, slick, currentSlide, nextSlide) {
						paginationScroll(nextSlide);
						showpro_index=nextSlide;
					});
					
					
					//缩略图滚动
					function paginationScroll(index){
						var slickdots_w = $(slickdots).width(),
							slickdots_div_w = $(slickdots_div).width(),
							deviation = parseInt(index * 74- slickdots_w / 2 +32);
						if (slickdots_div_w > slickdots_w) {
							var translateX = deviation > 0 ? -deviation : 0;
							if (deviation + slickdots_w >= slickdots_div_w) translateX = -parseInt(slickdots_div_w - slickdots_w);
							if($('html').hasClass('no-csstransitions')){
								$(slickdots_div).stop().animate({left:translateX},500);// IE9兼容
							}else{
								$(slickdots_div).css({transform: 'translateX(' + translateX + 'px)'});
							}
						}
					}
				}

							
				
				METUI['$uicss'].addClass('active');
			break;
			case 2:
				METUI['$uicss'].addClass('active');
			break;
			case 3:
				METUI['$uicss'].removeClass('active');
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
