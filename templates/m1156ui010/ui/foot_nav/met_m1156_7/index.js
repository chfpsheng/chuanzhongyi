
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	IE9: navigator.userAgent.indexOf('MSIE 9.0')>0,
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
				METUI['$uicss_foot_nav']=new Swiper('.$uicss .foot-nav',{
					wrapperClass: 'foot-nav-wraper',
					slideClass: 'foot-nav-slide',
					slidesPerView: this.IE9?6:'auto',
					autoplay: 3010,
					watchSlidesProgress : true,
					watchSlidesVisibility : true,
					observer:true,
					observeParents:true
				});
			break;
			case 2: 
				if(METUI['$uicss_foot_nav']) METUI['$uicss_foot_nav'].init();
			break;
			case 3: 
				if(METUI['$uicss_foot_nav']) METUI['$uicss_foot_nav'].destroy(false);
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
