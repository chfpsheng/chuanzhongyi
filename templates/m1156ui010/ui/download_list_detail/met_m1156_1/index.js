/*#文件名称：index.js #米拓企业建站系统 #Copyright (C) 长沙米拓信息技术有限公司 (https://www.metinfo.cn). All rights reserved.*/
/*#index.js#米拓企业建站系统 #Copyright (C) 长沙米拓信息技术有限公司 (http://www.metinfo.cn). All rights reserved.*/
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
					var background=$.trim(METUI['$uicss'].attr('data-background'));
					background && METUI['$uicss']
						.css('background-image','url('+background+')')
						.removeAttr('data-background');
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
