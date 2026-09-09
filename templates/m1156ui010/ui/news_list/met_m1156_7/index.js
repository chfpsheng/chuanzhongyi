
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
					METUI['$uicss']
						.css('background-image','url('+METUI['$uicss'].attr('data-background')+')')
						.removeAttr('data-background');
				} 
				
				if(METUI['$uicss'].find('.info-slide').length>0){
					METUI['$uicss_info']=new Swiper('.$uicss .info-box',{
						wrapperClass: 'info-wraper',
						slideClass: 'info-slide',
						slidesPerView: 'auto',
						autoplay : 4000,
						simulateTouch: METUI['$uicss'].find('.info-slide').length>2?true:false,
						watchSlidesProgress : true,
						watchSlidesVisibility : true,
						observer:true,
						observeParents:true
					});
				} 
				 
				METUI['$uicss'].addClass('active');
			break;
			case 2:
				if(METUI['$uicss_info']) METUI['$uicss_info'].init();
				METUI['$uicss'].addClass('active');
			break;
			case 3:
				if(METUI['$uicss_info']) METUI['$uicss_info'].destroy(false);
				METUI['$uicss'].removeClass('active');
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
