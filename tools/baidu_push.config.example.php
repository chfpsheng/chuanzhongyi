<?php
/**
 * 百度主动推送（普通收录 - API 提交）配置示例
 *
 * 使用方法：复制为 baidu_push.config.php 并填入 token。
 * baidu_push.config.php 已被 tools/.gitignore 忽略，不会进版本库。
 *
 * token 获取位置：
 *   百度搜索资源平台 → 搜索服务 → 资源提交 → 普通收录 → API 提交
 *   页面上「推送接口地址」里的 token= 后面那串即是准入密钥
 */
return array(

    // 在搜索资源平台验证过的站点（带协议、不带结尾斜杠）
    'site'        => 'https://www.chuanzhongyi.com',

    // 准入密钥（必填）
    'token'       => 'CHANGE_ME_填入搜索资源平台的准入密钥',

    // 单次最多推送多少条（API 与手动提交共享当日配额，宁少勿多，超了会整批失败）
    'daily_limit' => 10,

    // 默认只推最近 N 天有更新的页面
    'days'        => 3,

    // 同一个 URL 多少天内不重复推送（避免浪费配额）
    'skip_days'   => 30,
);
