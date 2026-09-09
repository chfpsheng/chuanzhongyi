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
				
			break;
			case 2:
			
			break;
			case 3:
			
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
