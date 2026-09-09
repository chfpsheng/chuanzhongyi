/*#文件名称：index.js #米拓企业建站系统 #Copyright (C) 长沙米拓信息技术有限公司 (https://www.metinfo.cn). All rights reserved.*/
METUI_FUN['$uicss']=METUI['$uicss_x']={
	name: '$uicss',
	init: function(){

	},
	resize: function(res){
		if(METUI['$uicss'].hasClass('lr')){
			if(Breakpoints.is('lg')||Breakpoints.is('md')){
				var left_width=METUI['$uicss'].find('.foot-left').width();
				var right_width=METUI['$uicss'].find('.foot-right').width();
				var foot_width=METUI['$uicss'].width();
				if(left_width+right_width>foot_width){
					if(left_width>right_width){
						METUI['$uicss'].find('.foot-left').css('max-width',foot_width-right_width);
					}else{
						METUI['$uicss'].find('.foot-right').css('max-width',foot_width-left_width);
					}
				}
			}else{
				METUI['$uicss'].find('.foot-left,.foot-right').css('max-width',999999);
			}
		}
		if(!res) $(window).resize(function(){ METUI['$uicss_x'].resize(true); });
	},
	slide: function(str){
		switch (str){
			case 1:

			break;
			case 2:

			break;
			case 3:

			break;
		}
	},
    bg: function() {
            $('.$uicss_bottom[data-bg]').each(function(index, el) {
            var background = $(this).attr('data-bg'),
                hex = background.split('|')[0],
                hextwo = background.split('|')[1],
                opacity = background.split('|')[2],
                bgcolor = rgb2color(hex, opacity),
                bgcolortwo = rgb2color(hextwo, opacity),
                ifbotc = $('.$uicss_bottom').data('ifbotc');
                if(ifbotc){
                    $(this).css('background', bgcolor);
                }else{
                    $(this).css('background', bgcolortwo);
                }
        });

        function rgb2color(hex, opacity) {
            var reg = /^#([0-9a-fA-f]{3}|[0-9a-fA-f]{6})$/;
            var c = hex.toLowerCase();
            if (c && reg.test(c)) {
                if (c.length === 4) {
                    var a = '#';
                    for (var i = 1; i < 4; i++) {
                        a += c.slice(i, i + 1).concat(c.slice(i, i + 1));
                    }
                    c = a;
                }
                var b = [];
                for (var i = 1; i < 7; i += 2) {
                    b.push(parseInt('0x' + c.slice(i, i + 2)));
                }
                return "rgba(" + b.join(',') + ',' + opacity + ')';
            } else {
                return c
            }

        }

    },
	simplified: function(){
    	var isSimplified = true;
		METUI['$uicss'].find('.simplified').click(function() {
			if(isSimplified){
				$('body').s2t();
				isSimplified=false;
				$(this).attr('title',$(this).attr('title').replace('繁','简'));
				$(this).find('i').text('简');
			}else{
				$('body').t2s();
				isSimplified=true;
				$(this).attr('title',$(this).attr('title').replace('简','繁'));
				$(this).find('i').text('繁');
			}
		});
	}
}
var x=new metui(METUI_FUN['$uicss']);
