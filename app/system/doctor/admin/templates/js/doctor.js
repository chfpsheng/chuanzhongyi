/**
 * 中医师模块后台：所属医馆下拉框 AJAX 搜索
 * - 后台地址：data-yiguan-url 必填
 * - 搜索框：data-yiguan-search
 * - 下拉框：data-yiguan-select
 * - 外层容器：data-yiguan-box
 * 使用 document 事件委托，兼容后台 SPA 异步载入的表单
 */
(function () {
	'use strict';

	if (window.metDoctorYiguanInit) {
		return;
	}
	window.metDoctorYiguanInit = 1;

	var DEBOUNCE_MS = 300;

	/**
	 * 首次使用时缓存下拉框的初始选项，便于恢复"当前选中"项的显示文本
	 */
	function cache_source_options(select) {
		if (select.met_source_options) {
			return select.met_source_options;
		}
		var options = [];
		for (var i = 0; i < select.options.length; i++) {
			options.push({
				value: select.options[i].value,
				text: select.options[i].text
			});
		}
		select.met_source_options = options;
		return options;
	}

	function find_cached_text(select, value) {
		if (!value) {
			return '';
		}
		var opts = select.met_source_options || [];
		for (var i = 0; i < opts.length; i++) {
			if (opts[i].value === value) {
				return opts[i].text;
			}
		}
		return '';
	}

	function clear_options(select) {
		while (select.options.length > 0) {
			select.remove(0);
		}
	}

	function append_option(select, value, text) {
		var opt = document.createElement('option');
		opt.value = value;
		opt.text = text;
		select.add(opt);
	}

	/**
	 * 用 AJAX 结果重建下拉框，并始终保留当前选中医馆（即使不在新结果里）
	 */
	function render_options(select, items, currentValue) {
		cache_source_options(select);
		clear_options(select);
		append_option(select, '', '请选择所属医馆');

		var seen = { '': 1 };
		if (currentValue) {
			seen[currentValue] = 1;
		}

		if (items && items.length) {
			for (var i = 0; i < items.length; i++) {
				var v = String(items[i].id);
				if (seen[v]) {
					continue;
				}
				seen[v] = 1;
				append_option(select, v, items[i].name || ('#' + v));
			}
		}

		// 当前选中的医馆若不在新结果中，回填到列表末尾（保留表单提交值）
		if (currentValue && !seen[currentValue]) {
			var cachedText = find_cached_text(select, currentValue);
			append_option(select, currentValue, cachedText || ('#' + currentValue));
		}

		select.value = currentValue || '';
	}

	/**
	 * 向服务端请求医馆数据并更新下拉框
	 */
	function search_yiguan(select, keyword, url) {
		var currentValue = select.value;
		var sep = url.indexOf('?') >= 0 ? '&' : '?';
		var fullUrl = url + sep + 'keyword=' + encodeURIComponent(keyword || '');

		var xhr = new XMLHttpRequest();
		xhr.open('GET', fullUrl, true);
		xhr.onreadystatechange = function () {
			if (xhr.readyState !== 4) {
				return;
			}
			if (xhr.status !== 200) {
				if (window.console && window.console.warn) {
					window.console.warn('metDoctorYiguan AJAX 失败', xhr.status);
				}
				return;
			}
			var data;
			try {
				data = JSON.parse(xhr.responseText);
			} catch (e) {
				return;
			}
			render_options(select, data, currentValue);
		};
		xhr.send();
	}

	function find_container(element) {
		if (element.closest) {
			return element.closest('[data-yiguan-box]');
		}
		var node = element.parentNode;
		while (node && node.nodeType === 1) {
			if (node.getAttribute('data-yiguan-box') !== null) {
				return node;
			}
			node = node.parentNode;
		}
		return null;
	}

	document.addEventListener('input', function (event) {
		var target = event.target;
		if (!target || !target.getAttribute || target.getAttribute('data-yiguan-search') === null) {
			return;
		}
		var box = find_container(target);
		if (!box) {
			return;
		}
		var select = box.querySelector('[data-yiguan-select]');
		var url = box.getAttribute('data-yiguan-url') || '';
		if (!select || !url) {
			return;
		}

		// 防抖：300ms 内连续输入只发一次请求
		if (select._metTimer) {
			clearTimeout(select._metTimer);
		}
		select._metTimer = setTimeout(function () {
			search_yiguan(select, target.value, url);
		}, DEBOUNCE_MS);
	}, true);
})();