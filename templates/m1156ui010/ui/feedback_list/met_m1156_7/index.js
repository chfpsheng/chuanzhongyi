/*#文件名称：index.js #米拓企业建站系统 #Copyright (C) 长沙米拓信息技术有限公司 (http://www.metinfo.cn). All rights reserved.*/
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss', 
	init: function() {
		$('.$uicss .feedback-form .form-group').each(function() {
			if($(this).find('input[name="code"]').length){
				$(this).prepend(`<label>${$(this).find('input[name="code"]').attr('placeholder')}</label>`)
			}
			if($(this).data('name')){
				$(this).prepend(`<label>${$(this).data('name')}</label>`)
			}
		})
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