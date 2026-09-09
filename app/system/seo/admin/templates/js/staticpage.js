/* 米拓企业建站系统 Copyright (C) 长沙米拓信息技术有限公司 (https://www.metinfo.cn). All rights reserved. */
(function () {
	var that = $.extend(true, {}, admin_module);
	TEMPLOADFUN[that.hash] = ()=>{
		M.ajax({
			url: M.url.admin + "?n=html&c=html&a=doGetSetup",
			success: function (result) {
				let data = (that.data = result.data);
				Object.keys(data).map(item => {
					if (item === "met_webhtm") {
						that.obj.find('[name="met_webhtm"]').removeAttr("checked");
						that.obj.find(`#met_webhtm-${data[item]}`)
							.attr("checked", true)
							.prop({
								checked: true
							});
						met_webhtm_change(data[item],1);
						return;
					}
					if (item === "met_html_auto") {
						that.obj.find('[name="met_html_auto"]').removeAttr("checked");
						that.obj.find(`#met_html_auto-${data[item]}`)
							.attr("checked", true)
							.prop({
								checked: true
							});
						return;
					}
					if (item === "met_htmlistname") {
						that.obj.find('[name="met_htmlistname"]').removeAttr("checked");
						that.obj.find(`#met_htmlistname-${data[item]}`)
							.attr("checked", true)
							.prop({
								checked: true
							});
						return;
					}

					if (item === "met_htmpagename") {
						that.obj.find('[name="met_htmpagename"]').removeAttr("checked");
						that.obj.find(`#met_htmpagename-${data[item]}`)
							.attr("checked", true)
							.prop({
								checked: true
							});
						return;
					}
					if (item === "met_htmtype") {
						that.obj.find('[name="met_htmtype"]').removeAttr("checked");
						that.obj.find(`#met_htmtype-${data[item]}`)
							.attr("checked", true)
							.prop({
								checked: true
							});
						return;
					}
					if (item === "met_htmway") {
						that.obj.find('[name="met_htmway"]').removeAttr("checked");
						that.obj.find(`#met_htmway-${data[item]}`)
							.attr("checked", true)
							.prop({
								checked: true
							});
						return;
					}
					if (item === "met_listhtmltype") {
						that.obj.find('[name="met_listhtmltype"]').removeAttr("checked");
						that.obj.find(`#met_listhtmltype-${data[item]}`)
							.attr("checked", true)
							.prop({
								checked: true
							});
						return;
					}
				});
			}
		});
	};

	function FormSubmit() {
		M.load(["form", "formValidation", "alertify"], function () {
			const form = that.obj.find(".static-form");
			const order = form.attr("data-validate_order");
			formSaveCallback(order, {
				true_fun: function (result) {
                    if(result.data.callback_url) {//开启html自动更新
                        M.ajax({
                            url:  result.data.callback_url,
							no_error_msg:1,
                        });
                    }
					const met_webhtm = form.find('[name="met_webhtm"]:checked').val();
					let value = {};
					form.serializeArray().map(item => {
						if (item.name !== "submit_type") value[item.name] = item.value;
					});
					const res = compare(value, that.data);
					const isHtmlway = res.length == 1 && res[0] === "met_htmway";
					if (met_webhtm !== "0") {
						!isHtmlway &&
							alertify
							.okBtn(METLANG.confirm)
							.cancelBtn(METLANG.cancel)
							.confirm(METLANG.seotips12, function (e) {
								that.obj.find(".met_webhtm .btn").click();
								setTimeout(() => {
									$(".staticpage-html-modal .html-link:first").click();
								}, 800);
							});
						that.obj.find(".met_webhtm").removeClass("hide");
					} else {
						that.obj.find(".met_webhtm").addClass("hide");
						if (that.data.met_webhtm === "0") {
							return;
						}
						alertify
							.okBtn(METLANG.confirm)
							.cancelBtn(METLANG.cancel)
							.confirm(METLANG.seotips11, function (e) {
								$.ajax({
									url: M.url.admin + "?n=html&c=html&a=doDelHtml",
									type: "GET",
									dataType: "json"
								});
							});
					}
				}
			});
		});
	}

	function getHtml(modal) {
		M.ajax({
				url: M.url.admin + "?n=html&c=html&a=doGetHtml"
			},
			function (result) {
				let data = result.data;
				let html = "";
				data.map((item, index) => {
					html +=`<dl>
						<dt>
							<label class="form-control-label">${item.name}</label>
						</dt>
						<dd>
							${
							item.content
								? `<a data-url="${item.content.url}" tabindex=${index} class="html-link" data-name="${item.name}">${item.content.name}</a>`
								: ""
							}
							${
							item.column
								? `<a data-url="${item.column.url}" tabindex=${index} class="html-link" data-name="${item.name}">${item.column.name}</a>`
								: ""
							}
						</dd>
					</dl>`;
				});
				that.modalHtml = html;
				modal.find(".met-html").append(that.modalHtml);
				createHtml(modal);
			}
		);
	}
	M.component.modal_options[".staticpage-html-modal"] = {
	    modalFullheight:1,
		callback: function () {
			const modal = $(".staticpage-html-modal");
			getHtml(modal);
		}
	};

	function createHtml(modal) {
		// HTML转义函数，防止XSS
		var escapeHtml = function(str) {
			if (!str) return '';
			var div = document.createElement('div');
			div.textContent = String(str);
			return div.innerHTML;
		};
		modal.find(".html-link").click(function () {
		    var name = $(this).text(),
				title = $(this).data("name"),
				$html_loading = modal.find(".html-loading"),
				html_loading_h = $html_loading.outerHeight(),
				url = $(this).data("url"),
				handle=(other_url)=>{
					// 初始化：进度条 + 统计 + 列表
					$html_loading.html(
        				`<div class="html-progress" style="margin-bottom:15px;">
							<div class="progress-stats" style="font-size:14px;margin-bottom:8px;">
								总数：<span class="p-total">0</span> |
								已完成：<span class="p-done">0</span> (<span class="p-percent">0%</span>) |
								成功：<span class="p-suc" style="color:green;">0</span> |
								失败：<span class="p-err" style="color:red;">0</span>
							</div>
							<div class="progress-bar" style="height:20px;background:#eee;border-radius:10px;overflow:hidden;">
								<div class="progress-fill" style="height:100%;width:0%;background:#5cb85c;transition:width 0.3s;"></div>
							</div>
							<div class="progress-current" style="font-size:12px;color:#999;margin-top:5px;">等待开始...</div>
						</div>
						<div class="html-list"></div>
						<p style="font-size:16px;" class="createing mb-0">${name}${METLANG.ing}...</p>`
        			);
					M.ajax({
							url: other_url||url
						},
						function (result) {
							var $html_list = $html_loading.find('.html-list'),
								$progress = $html_loading.find('.html-progress'),
								// 实时更新进度（每次轮询都调用，不管是否满足条件）
								updateProgress = (res) => {
									var total = res.total || 0;
									var suc_num = res.suc_num || 0;
									var err_num = res.err_num || 0;
									var done = suc_num + err_num;
									var percent = total > 0 ? (done / total * 100).toFixed(1) : 0;
									$progress.find('.p-total').text(total);
									$progress.find('.p-done').text(done);
									$progress.find('.p-percent').text(percent + '%');
									$progress.find('.p-suc').text(suc_num);
									$progress.find('.p-err').text(err_num);
									$progress.find('.progress-fill').css('width', percent + '%');
									// 有失败时进度条变橙色
									if (err_num > 0) {
										$progress.find('.progress-fill').css('background', '#f0ad4e');
									}
									// 当前正在生成的页面
									if (res.current && res.current.length > 0) {
										var currentText = res.current.map(function(item){ return item.filename; }).join('、');
										$progress.find('.progress-current').text('正在生成：' + currentText);
									} else if (res.status == 1) {
										$progress.find('.progress-current').text('生成完成');
									}
									// 渲染失败记录（最多50条，成功记录不逐条渲染避免上万条DOM卡死浏览器）
									if (res.err && res.err.length > 0) {
										var errHtml = res.err.map(function(item) {
											var safe_filename = escapeHtml(item.filename);
											var safe_errmsg = item.error_msg ? escapeHtml(item.error_msg) : '';
											var err_msg = safe_errmsg ? ' <span style="color:#999;font-size:12px;">' + safe_errmsg + '</span>' : '';
											return '<p style="color:red">' + safe_filename + ' ' + METLANG.html_createfail_v6 + err_msg + '</p>';
										}).join('');
										$html_list.html(errHtml);
									}
								},
								loop_load=()=>{
									setTimeout(()=>{
										M.ajax({
											url:result.data.check_url,
											success:(res)=>{
												// 每次轮询都更新进度（关键修复：之前有条件判断导致进度不显示）
												updateProgress(res);
												if(res.status==1){
													$html_loading.find(".createing").html(`${title}${METLANG.static_page_success}
													<br><span class='text-success'>${METLANG.physicalgenok}${res.suc_num}${METLANG.page}</span>
													<br><span class='text-danger'>${METLANG.html_createfail_v6}${res.err_num}${METLANG.page}${res.err_num?` <button type="button" class='btn btn-primary html-link-reset-fail'>重新生成</button>`:''}</span>`);
													res.err_num && $html_loading.find('.html-link-reset-fail').click(function () {
														handle(result.data.retry_url);
													});
												}else{
													loop_load();
												}
												var scrolltop = $html_list.outerHeight() - html_loading_h+120;
												scrolltop && $html_loading.scrollTop(scrolltop);
											}
										});
									},1000);
								}
							M.ajax({
								url:result.data.callback_url,
								no_error_msg:1
							});
							loop_load();
						}
					);
				};
			handle();
		});
	}

	function compare(obj1, obj2) {
		let arr = [];
		for (let key in obj1) {
			if (obj2[key] !== obj1[key]) {
				arr.push(key);
			}
		}
		return arr;
	}
	// 混合模式查看伪静态规则
	function met_webhtm_change(value,met_webhtm){
		met_webhtm && that.obj.find(".met_webhtm")[`${value>0?'remove':'add'}Class`]('hide');
		that.obj.find('[data-toggle="modal"][data-target=".staticpage-rules-modal"]')[`${value==3?'remove':'add'}Class`]('hide');
		if(value==3){
			that.obj.find('input[type="radio"][name="met_htmpagename"][value="3"]').attr('data-old_value',that.obj.find('input[type="radio"][name="met_htmpagename"]:checked').val()).click();
		}else{
			that.obj.find(`input[type="radio"][name="met_htmpagename"][value="${that.obj.find('input[type="radio"][name="met_htmpagename"][value="3"]').attr('data-old_value')}"]`).click();
		}
	}
	that.obj.find('input[type="radio"][name="met_webhtm"]').change(function(){
		met_webhtm_change($(this).val());
	});
	M.component.modal_options['.staticpage-rules-modal']={
		modalRefresh:'one',
		modalFullheight:1,
		modalSize:'lg',
		modalTitle:METLANG.pseudo_static,
		modalFooterok:0,
		callback:(key)=>{
		  if(!$('.modal-body pre',key).length) $.ajax({
			url: that.own_name + 'c=pseudo_static&a=doSavePseudoStatic&pseudo_download=1',
			type: 'POST',
			dataType: 'json',
			data: {
			  pseudo_download: 1
			},
			success: function(result) {
			  let data = result.data
			  $('.modal-body',key).html(`<pre class='mb-0'>${data}</pre>`);
			}
		  });
		}
	};
	FormSubmit();
})();
