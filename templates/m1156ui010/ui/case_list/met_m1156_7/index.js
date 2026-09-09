
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
				
				if(METUI['$uicss'].find('.parent-slide').length>0){
					METUI['$uicss_parent']=new Swiper('.$uicss .parent-box',{
						wrapperClass: 'parent-wraper',
						slideClass: 'parent-slide',
						slidesPerView: 'auto',
						autoplay : 3800, 
						lazyLoading: true,
						lazyLoadingInPrevNext: true, 
						lazyLoadingClass: 'parent-lazy', 
						watchSlidesProgress : true,
						watchSlidesVisibility : true,
						observer:true,
						observeParents:true
					});
				} 
				 
				METUI['$uicss'].addClass('active');
			break;
			case 2:
				if(METUI['$uicss_parent']) METUI['$uicss_parent'].init();
				METUI['$uicss'].addClass('active');
			break;
			case 3:
				if(METUI['$uicss_parent']) METUI['$uicss_parent'].destroy(false);
				METUI['$uicss'].removeClass('active');
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
