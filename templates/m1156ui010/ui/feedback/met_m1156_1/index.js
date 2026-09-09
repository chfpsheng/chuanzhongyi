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
					var background=$.trim(METUI['$uicss'].attr('data-background'));
					background && METUI['$uicss']
						.css('background-image','url('+background+')')
						.removeAttr('data-background');
				}
				METUI['$uicss'].find('.met-feedback .form-group').each(function(){
					var html=$(this).html();
					if(html.indexOf('input')>0&&html.indexOf('text')>0&&html.indexOf('placeholder')>0){
						$(this).addClass('ftype_input').html('<div>'+html+'</div>');
					}else if(html.indexOf('textarea')>0){
						$(this).addClass('ftype_textarea').html('<div>'+html+'</div>');
					}else if(html.indexOf('select')>0){
						$(this).addClass('ftype_select').html('<div>'+html+'</div>');
					}else if(html.indexOf('radio')>0){
						$(this).addClass('ftype_radio').html(html.replace('</label>','</label><div>')+'</div>');
					}else if(html.indexOf('checkbox')>0){
						$(this).addClass('ftype_checkbox').html(html.replace('</label>','</label><div>')+'</div>');
					}else if(html.indexOf('input-group-file')>0){
						$(this).addClass('ftype_upload').html(html.replace('</label>','</label><div>')+'</div>');
					}else if(html.indexOf('submit')>0){
						$(this).addClass('submint').removeClass('form-group').html(html); 
					}
				});
				METUI['$uicss'].find('.met-feedback #getcode').click(function(){
					$(this).attr('src',$(this).attr('src'));
				});	
			break;
			case 2:
			
			break;
			case 3:
			
			break;
		}
	}
}
var x=new metui(METUI_FUN['$uicss']);
