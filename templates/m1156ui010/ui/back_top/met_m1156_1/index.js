
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	height: $(window).height(),
	init: function(){
		window.setTimeout(function(){
			var number=METUI['$uicss'].attr('number')||1;
			if(METUI['slide']){
					METUI['slide'].on('TransitionEnd',function(swiper){
						if(-swiper.getWrapperTranslate()>=number*METUI['$uicss_x'].height){
							METUI['$uicss'].addClass('active');
						}else{
							METUI['$uicss'].removeClass('active');
						}
					});			
					METUI['$uicss'].click(function(){
						METUI['slide'].slideTo(0);
					});
			}else{
				$(window).scroll(function(){
					if($(window).scrollTop()>=number*METUI['$uicss_x'].height){
						METUI['$uicss'].addClass('active');
					}else{
						METUI['$uicss'].removeClass('active');
					}
				});
				METUI['$uicss'].click(function(){					
					$('html,body').animate({scrollTop:0});
				});
			}
		},2);
	},
	resize: function(res){
		METUI['$uicss_x'].height=$(window).height();
		if(!res) $(window).resize(function(){ METUI['$uicss_x'].resize(true); });
	},
	slide: function(str){
		
	}
}
var x=new metui(METUI_FUN['$uicss']);
