/**
 * 中医师模块后台：「所属医馆」下拉框增加顶部搜索框。
 *
 * 适配 MetInfo 后台自动注入的 met-select 皮肤：
 *   - <select data-yiguan-select> 被包裹在 <div class="met-select"> 内；
 *   - 下拉菜单为 <div class="dropdown-menu">；
 *   - 每个选项为 <a class="dropdown-item" data-name="名称">名称</a>。
 *
 * met-select 的菜单 HTML 是 wrap 时一次性生成的静态结构，不会随原生 <select>
 * 的 option 变化而刷新。因此，传统的「下拉外置一个搜索框 + AJAX 改 option」方案
 * 在这里无效 —— 哪怕 <select> 的 option 被替换，下拉菜单里看到的还是旧快照。
 *
 * 本脚本改为：等 met-select 把 select 包好之后，把搜索框直接插入到下拉菜单顶部，
 * 输入时按 data-name（即显示文本）做大小写不敏感的子串过滤，通过 d-none 隐藏
 * 不匹配的 .dropdown-item。
 *
 * 加载方式：本文件位于 app/system/doctor/admin/templates/js/doctor.js，
 * 由 app/system/include/templates/admin/foot.php 自动加载到中医师列表页，
 * 通过 setInterval 持续扫描，确保弹窗 innerHTML 注入的表单也能被处理。
 */
(function () {
    'use strict';

    if (window.metYiguanSelectInit) {
        return;
    }
    window.metYiguanSelectInit = 1;

    // 医馆标题里可能带 HTML 实体（如 &middot;），data-name 是原始 HTML，
    // 而 textContent 是浏览器解码后的可见文本。两者都参与匹配，避免漏搜。
    function haystack(item) {
        var name = item.getAttribute('data-name') || '';
        var text = item.textContent || '';
        return (name + ' ' + text).toLowerCase();
    }

    function stopBubble(e) {
        e.stopPropagation();
    }

    function initOne(select) {
        if (!select || select.nodeType !== 1) return;
        // 已被 met-select 包装过的判断：父元素是 .met-select 且包含 .dropdown-menu
        var wrap = select.closest && select.closest('.met-select');
        if (!wrap) return;

        var menu = wrap.querySelector('.dropdown-menu');
        if (!menu) return;

        // 避免重复初始化（每次扫描都会进到这里）
        if (select.getAttribute('data-yiguan-search-inited') === '1') return;
        select.setAttribute('data-yiguan-search-inited', '1');

        // 构造搜索框。注意：input 没有 name 属性，不参与表单提交与 formValidation。
        var input = document.createElement('input');
        input.type = 'text';
        input.className = 'form-control form-control-sm mx-2 mt-2 mb-1';
        input.placeholder = '输入医馆名称关键字筛选';
        input.autocomplete = 'off';
        input.setAttribute('data-yiguan-search-input', '1');

        // Bootstrap dropdown 只在点击 .dropdown-item 时关闭，搜索框不是 .dropdown-item，
        // 理论上点击不会关闭。但为了避免某些情况下 dropdown 自动收起，做一次兜底。
        input.addEventListener('click', stopBubble);
        input.addEventListener('mousedown', stopBubble);
        input.addEventListener('keydown', function (e) {
            // 在表单内的输入框按回车会触发表单提交，必须阻止
            if (e.key === 'Enter') e.preventDefault();
            stopBubble(e);
        });

        menu.insertBefore(input, menu.firstChild);

        var items = menu.querySelectorAll('.dropdown-item');

        input.addEventListener('input', function () {
            var kw = (input.value || '').trim().toLowerCase();
            var current = select.value || '';
            for (var i = 0; i < items.length; i++) {
                var it = items[i];
                var dv = it.getAttribute('data-value');
                // 1) "请选择所属医馆"（value 为空）始终可见
                // 2) 当前已选项始终可见，避免编辑模式下被自己的关键字过滤掉
                if (dv === '' || dv === null || dv === current) {
                    it.classList.remove('d-none');
                    continue;
                }
                var match = kw === '' || haystack(it).indexOf(kw) >= 0;
                if (match) {
                    it.classList.remove('d-none');
                } else {
                    it.classList.add('d-none');
                }
            }
        });
    }

    function scan() {
        var nodes = document.querySelectorAll('select[data-yiguan-select]:not([data-yiguan-search-inited])');
        for (var i = 0; i < nodes.length; i++) {
            initOne(nodes[i]);
        }
    }

    // 持续扫描：met-select 在 select 第一次 mouseover 时才异步包好，
    // 而弹窗可能在页面打开很久之后才被点开，所以需要持续观察。
    setInterval(scan, 200);
    scan();
})();