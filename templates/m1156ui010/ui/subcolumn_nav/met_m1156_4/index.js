
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	IE9: navigator.userAgent.indexOf('MSIE 9.0')>0,
	init: function(){
		if($('.swiper-header').length==0){
			METUI['$uicss_x'].slide(1);
		}
	},
	resize: function(res){
		if(METUI['$uicss'].hasClass('center')){
			var column_width=0;
			METUI['$uicss'].find('.column-nav').removeAttr('style');
			METUI['$uicss'].find('.column-li').each(function(){
				column_width+=$(this).outerWidth();
			});
			METUI['$uicss'].find('.column-nav').css('max-width',column_width);
		}
		if(!res) $(window).resize(function(){ METUI['$uicss_x'].resize(true); });
	},
	slide: function(str){
		switch (str){
			case 1:
			    if(METUI['$uicss'].find('.column-li').length<=1){
					METUI['$uicss'].hide();
				}
				METUI['$uicss_column']=new Swiper('.column-nav',{
					initialSlide : METUI['$uicss'].find('.column-li.active').index(),
					wrapperClass : 'column-ul',
					slideClass : 'column-li',
					freeMode : true,
					slidesPerView : 'auto',
					freeModeSticky : true,
					onlyExternal:M.device_type=='d',
					preventClicks: false,
					onReachEnd: function(swiper){
						METUI['$uicss'].find('.column-nav').addClass('active');
					},
					onTouchStart : function(swiper,even){
						METUI['$uicss'].find('.column-hover ul').removeClass('active');
					}
				});
				if(METUI['$uicss'].find('.column-hover').length>0){
					var navtime='';
					METUI['$uicss'].find('.column-li').mouseover(function(){
						if(Breakpoints.is('lg')){
							clearTimeout(navtime);
							var nowleft=$(this).offset().left;
							var navul=METUI['$uicss'].find('.column-hover ul').removeClass('active').eq($(this).index());
							navul.css('left',nowleft-(navul.width()-$(this).width())/2).addClass('active');
						}
					}).click(function(){
						if(!Breakpoints.is('lg')){
							clearTimeout(navtime);
							var nowleft=$(this).offset().left;
							var navul=METUI['$uicss'].find('.column-hover ul').removeClass('active').eq($(this).index());
							navul.css('left',nowleft-(navul.width()-$(this).width())/2).addClass('active');
						}
					});
					METUI['$uicss'].mouseleave(function(){
						clearTimeout(navtime);
						navtime=window.setTimeout(function(){
							METUI['$uicss'].find('.column-hover ul').removeClass('active');
						},200);
					});
					METUI['$uicss'].find('.column-hover ul').mouseenter(function(){
						clearTimeout(navtime);
					});
					METUI['$uicss'].find('.column-li a').click(function(e){
						if(!Breakpoints.is('lg')&&$(this).parent().hasClass('navs')){
							e.preventDefault();
						}
					});
				}
				METUI['$uicss'].addClass('active');
			break;
			case 2:
				if(METUI['$uicss_column']) METUI['$uicss_column'].init();
				METUI['$uicss'].addClass('active');
			break;
			case 3:
				if(METUI['$uicss_column']) METUI['$uicss_column'].destroy(false);
				METUI['$uicss'].removeClass('active');
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
