/**
 * 中医师模块后台：所属医馆下拉框 模糊搜索
 * 使用 document 事件委托，兼容后台 SPA 异步载入的表单
 */
(function () {
	'use strict';

	if (window.metDoctorYiguanInit) {
		return;
	}
	window.metDoctorYiguanInit = 1;

	/**
	 * 首次使用时记录下拉框的完整选项，避免多次筛选后选项丢失
	 */
	function get_source_options(select) {
		if (!select.met_source_options) {
			var options = [];
			for (var i = 0; i < select.options.length; i++) {
				options.push({
					value: select.options[i].value,
					text: select.options[i].text
				});
			}
			select.met_source_options = options;
		}
		return select.met_source_options;
	}

	/**
	 * 按关键字筛选选项，始终保留“请选择”和当前选中项，防止提交时丢值
	 */
	function filter_options(select, keyword) {
		var source = get_source_options(select);
		var selected = select.value;
		var key = (keyword || '').replace(/^\s+|\s+$/g, '').toLowerCase();
		var i, item, option;

		for (i = select.options.length - 1; i >= 0; i--) {
			select.remove(i);
		}

		for (i = 0; i < source.length; i++) {
			item = source[i];
			if (key && item.value !== '' && item.value !== selected && item.text.toLowerCase().indexOf(key) === -1) {
				continue;
			}
			option = document.createElement('option');
			option.value = item.value;
			option.text = item.text;
			select.add(option, null);
		}

		select.value = selected;
		if (select.selectedIndex === -1 && select.options.length > 0) {
			select.selectedIndex = 0;
		}
	}

	/**
	 * 找到搜索框所在的外层容器
	 */
	function get_box(element) {
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
		var box = get_box(target);
		if (!box) {
			return;
		}
		var select = box.querySelector('[data-yiguan-select]');
		if (select) {
			filter_options(select, target.value);
		}
	}, true);
})();
