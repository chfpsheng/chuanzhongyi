<?php
/**
 * 内容入库接口配置示例
 *
 * 使用方法：把本文件复制为 api_add_news.config.php，至少修改 token 一项。
 * api_add_news.config.php 已被 tools/.gitignore 忽略，不会提交到版本库。
 */
return array(

    // ================= 鉴权 =================

    // 接口令牌（必填）：调用方必须原样带上，建议 32 位以上随机串
    // 生成方式：php -r "echo bin2hex(random_bytes(24));"
    'token'          => 'CHANGE_ME_请替换成随机的长字符串',

    // IP 白名单：留空 array() = 不限来源（靠 token 鉴权）
    // 建议收紧：填上允许调用的来源 IP，例如 array('127.0.0.1', '203.0.113.5')
    'ip_allow'       => array(),

    // ================= 写入目标（白名单，防止写错栏目）=================

    'class1'         => 101,                     // 默认一级栏目：中医资讯
    'class2'         => 106,                     // 默认二级栏目：中医养生
    'allowed_class1' => array(101),              // 允许写入的一级栏目 id
    'allowed_class2' => array(0, 106, 107),      // 允许写入的二级栏目 id（0 = 只挂一级栏目）
    'lang'           => 'cn',
    'issue'          => 'laoyang',               // 归属账号（与后台既有内容保持一致）

    // ================= 草稿策略 =================

    // displaytype：MetInfo 原生「待审核」——不进前台列表、不进站点地图、不进站内搜索，
    //              但知道 id 仍可直链打开（MetInfo 自身就是这样设计的）
    // recycle    ：直接进回收站——前台连直链也打不开，但后台需先去回收站「还原」再编辑
    'draft_mode'     => 'displaytype',

    // ================= 其它 =================

    'admin_dir'      => 'admin',                 // 后台目录名（若改过名字请同步修改）
    'web_url'        => 'https://www.chuanzhongyi.com',  // 站点地址，用于拼后台编辑链接
    'rate_per_hour'  => 60,                      // 每小时最多写入篇数（防失控）
    'max_content_kb' => 200,                     // 单篇正文大小上限（KB）

    // ================= 可选：显式指定数据库 =================
    // 不填则自动读取站点 config/config_db.php，一般无需填写。
    // 换服务器、或 config_db.php 读不到时，可以在这里兜底：
    // 'con_db_host' => 'my2419845328.xincache1.cn',
    // 'con_db_port' => '3306',
    // 'con_db_id'   => 'my2419845328',
    // 'con_db_pass' => '********',
    // 'con_db_name' => 'my2419845328',
    // 'tablepre'    => 'met_',
);
