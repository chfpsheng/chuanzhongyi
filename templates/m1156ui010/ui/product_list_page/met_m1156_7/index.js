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
				METUI['$uicss'].find("img[data-original]").lazyload({
					load: function(){
						METUI['$uicss_x'].view();
					}
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
	},
	view: function(){
		window.setTimeout(function(){
			new AnimOnScroll( document.getElementById('met-grid'),{
				minDuration:0.4,
				maxDuration:0.7,
				viewportFactor:0.2
			});
		},400);
	}
}
var x=new metui(METUI_FUN['$uicss']);

function metAnimOnScroll(obj){
	window.setTimeout(function(){
		$('.$uicss img[data-original]').each(function(index, element) {
			$(this).attr('src',$(this).attr('data-original')).parents('li').css('opacity',1);
		});
		new AnimOnScroll( document.getElementById('met-grid'),{
			minDuration:0.4,
			maxDuration:0.7,
			viewportFactor:0.2
		});
	},400);
}