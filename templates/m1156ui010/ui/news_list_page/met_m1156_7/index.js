/*#文件名称：index.js #米拓企业建站系统 #Copyright (C) 长沙米拓信息技术有限公司 (https://www.metinfo.cn). All rights reserved.*/
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	init: function(){
		if($('.swiper-header').length==0){
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
				new Swiper('.news-headlines',{
					wrapperClass: 'news-wrapper',
					slideClass: 'news-slide',
					autoplay: 3500,
					loop: true,
					observer:true,
					observeParents:true,
					lazyLoadingClass: 'news-lazy',
					lazyLoading: true,
					lazyLoadingOnTransitionStart: true,
					prevButton: '.swiper-button-prev',
					nextButton: '.swiper-button-next',
					pagination: '.swiper-pagination',
					slidesPerView: 'auto'
				});

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
