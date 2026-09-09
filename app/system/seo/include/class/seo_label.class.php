<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

class seo_label
{
    public $lang;
    public $str_list;

    public function __construct()
    {
        global $_M;
        $this->lang = $_M['lang'];
        $query = "SELECT * FROM {$_M['table']['label']} where lang='{$_M['lang']}' order BY char_length(oldwords) DESC";
        $result = DB::get_all($query);
        $str_list_temp = array();
        $str_list = array();
        foreach ($result as $list) {
            if (!$list['newwords']) {
                $list['newwords'] = $list['oldwords'];
            }
            if (!$list['newtitle']) {
                $list['newtitle'] = $list['newwords'];
            }
            $str_list_temp[0] = $list['oldwords'];
            if ($list['url']) {
                $str_list_temp[1] = "<a title=\"{$list['newtitle']}\" target='_blank' href='{$list['url']}' class='seolabel'>{$list['newwords']}</a>";
            } else {
                $str_list_temp[1] = $list['newwords'];
            }
            $str_list_temp[2] = $list['num'];
            $str_list[] = $str_list_temp;
        }

        $this->str_list = $str_list;
    }

    /**
     * 锚文本替换
     * @param $content
     * @return string
     */
    public function anchor_replace($content)
    {
        global $_M;
        $str = $this->str_list;
        foreach ($str as $k => $val) {
            $val[3] = html_entity_decode($val[0], ENT_QUOTES, 'UTF-8');
            $val[3] = str_replace(array('\\', '/', '.', '$', '^', '*', '(', ')', '-', '[' . ']' . '{', '}', '|', '?', '+'), array('\\\\', '\/', '\.', '\$', '\^', '\*', '\(', '\)', '\-', '\[' . '\]' . '\{', '\}', '\|', '\?', '\+'), $val[3]);
            if ($val[2] != 0) {
                $tmp1 = explode("<", $content);
                $num = $val[2];
                foreach ($tmp1 as $key => $item) {
                    $tmp2 = explode(">", $item);
                    if (sizeof($tmp2) > 1 && strlen($tmp2[1]) > 0) {
                        if (substr($tmp2[0], 0, 1) != "a" && substr($tmp2[0], 0, 1) != "A" && substr($tmp2[0], 0, 6) != 'script' && substr($tmp2[0], 0, 6) != 'SCRIPT') {
                            $valnum = substr_count($tmp2[1], $val[0]);
                            if ($num - $valnum >= 0) {
                                $num = $num - $valnum;
                            } else {
                                $valnum = $num;
                                $num = 0;
                            }
                            $tmp2[1] = preg_replace("/" . $val[3] . "/", $val[1], $tmp2[1], $valnum);
                            $tmp1[$key] = implode(">", $tmp2);
                        }
                    }
                }
                $content = implode("<", $tmp1);
            }
        }
        //$met_atitle = '';
        //$met_alt = '';
        $met_atitle = $_M['config']['met_atitle'];
        $met_alt = $_M['config']['met_alt'];

        $tmp1 = explode("<", $content);
        foreach ($tmp1 as $key => $item) {
            $tmp2 = explode(">", $item);
            if (substr($tmp2[0], 0, 1) == "a" || substr($tmp2[0], 0, 1) == "A") {
                $tmp2[0] = str_replace(array("title=''", "title=\"\""), '', $tmp2[0]);
                if (!strpos($tmp2[0], 'title')) {
                    $tmp2[0] .= " title=\"$met_atitle\"";
                }
                $tmp1[$key] = implode(">", $tmp2);
            }
            if (substr($tmp2[0], 0, 3) == "img" || substr($tmp2[0], 0, 3) == "IMG") {
                $tmp2[0] = str_replace(array("title=''", "title=\"\""), '', $tmp2[0]);
                $tmp2[0] = str_replace(array("alt=''", "alt=\"\""), '', $tmp2[0]);
                $tmp2[0] = trim($tmp2[0], " \t\n\r\0\x0B/");
                if (!strpos($tmp2[0], 'alt')) {
                    $tmp2[0] .= " alt=\"$met_alt\"";
                }
                if (!strpos($tmp2[0], 'title')) {
                    $tmp2[0] .= " title=\"$met_alt\"";
                }
                $tmp2[0] .= " /";
                $tmp1[$key] = implode(">", $tmp2);
            }
        }
        $content = implode("<", $tmp1);

        $content = contnets_replace($content);

        return $content;
    }

    /**
     * @param $lang
     * @return array
     */
    public function sitemaplist($lang)
    {
        global $_M;

        $_M['config']['sitemap'] = true;
        $cofnig_met_pseudo = $_M['config']['met_pseudo'];
        $cofnig_met_webhtm = $_M['config']['met_webhtm'];

        //根据不同语言获取url配置信息
        $get_webname = DB::get_one("select value from {$_M['table']['config']} where name='met_webname' and lang='{$lang}'");
        $met_webname = $get_webname['value'];

        $get_pseudo = DB::get_one("select value from {$_M['table']['config']} where name='met_pseudo' and lang='{$lang}'");
        $_M['config']['met_pseudo'] = $get_pseudo['value']?:0;

        $get_webhtm = DB::get_one("select value from {$_M['table']['config']} where name='met_webhtm' and lang='{$lang}'");
        $_M['config']['met_webhtm'] = $get_webhtm['value'] ?: 0;

        $url_type = $_M['class']['handle']->url_type('', 0);
        $_M['config']['met_pseudo'] = $cofnig_met_pseudo;
        $_M['config']['met_webhtm'] = $cofnig_met_webhtm;

        $met_langok = load::sys_class('label', 'new')->get('language')->get_lang();
        if ($met_langok[$lang]['link']) {
            $index_url = $met_langok[$lang]['link'];
        }else{
            $index_url = $met_langok[$lang]['met_weburl'];
            if ($lang == $_M['config']['met_index_type']) {
                $url_info = parse_url($index_url);
                $index_url = "{$url_info['scheme']}://{$url_info['host']}{$url_info['path']}";
            }
        }

        $sitemaplist[] = array(
            'updatetime' => date($_M['config']['met_listtime']),
            'title' => $met_webname,
            'url' => $index_url,
            'priority' => 1
        );
        //栏目URL
        $colunm = $_M['class']['column_label'];
        $colunm->lang = $lang;
        $colunm->column = array();
        $colunm->get_column($lang);
        $c = $colunm->get_all_list();
        $class1list = '';
        foreach ($c as $key => $val) {
            if ($val['display'] || $val['isshow'] = 0) {
                continue;
            }
            if ($val['module'] == 9) {
                continue;
            }
            //过滤外部模块
            if ($_M['config']['met_sitemap_not2'] == 1 && $val['out_url']) {
                continue;
            }
            //过滤不显示在导航的一级栏目
            if ($_M['config']['met_sitemap_not1']) {
                if ($val['classtype'] == 1 && !$val['nav']) {
                    continue;
                }
            }

            $class1list .= '-' . $val['id'] . '-';
            if ($val['module'] == 6) $job_flag = 1;
            if ($val['name']) {
                $sitemaplist[] = array(
                    'updatetime' => date($_M['config']['met_listtime']),
                    'title' => $val['name'],
                    'url' => $colunm->handle->get_content_url($val, $url_type),
                );
            }
        }

        //内容URL
        $module_array = array(
            'news' => array(
                'fields' => array('id', 'title', 'class1', 'class2', 'class3', 'lang', 'updatetime', 'addtime', 'links', 'access', 'filename', 'displaytype'),
                'title_field' => 'title'
            ),
            'product' => array(
                'fields' => array('id', 'title', 'class1', 'class2', 'class3', 'lang', 'updatetime', 'addtime', 'links', 'access', 'filename', 'displaytype'),
                'title_field' => 'title'
            ),
            'img' => array(
                'fields' => array('id', 'title', 'class1', 'class2', 'class3', 'lang', 'updatetime', 'addtime', 'links', 'access', 'filename'),
                'title_field' => 'title'
            ),
            'download' => array(
                'fields' => array('id', 'title', 'class1', 'class2', 'class3', 'lang', 'updatetime', 'addtime', 'links', 'access', 'filename', 'displaytype'),
                'title_field' => 'title'
            ),
            'job' => array(
                'fields' => array('id', 'position', 'class1', 'class2', 'class3', 'lang', 'updatetime', 'addtime', 'access', 'filename', 'displaytype'),
                'title_field' => 'position'
            )
        );

        $handle = load::mod_class('base/base_handle', 'new');

        foreach ($module_array as $mod => $config) {
            if ($mod == 'job' && !$job_flag) {
                continue;
            }

            $fields = implode(',', $config['fields']);
            $sql = "SELECT {$fields} FROM {$_M['table'][$mod]} WHERE lang = '{$lang}'";
            if ($mod != 'job') {
                $sql .= ' AND recycle = 0';
            }

            $handle->construct($mod);
            $results = DB::get_all($sql);

            foreach ($results as $val) {
                if (!$val['displaytype'] || ($_M['config']['met_sitemap_not2'] == 1 && $val['links'])) {
                    continue;
                }

                if ($mod != 'job' && strpos($class1list, '-' . $val['class1'] . '-') === false) {
                    continue;
                }

                $sitemaplist[] = array(
                    'updatetime' => $val['updatetime'],
                    'title' => $val[$config['title_field']],
                    'url' => $handle->get_content_url($val, $url_type),
                );
            }
        }
        return $sitemaplist;
    }

    /**
     * @return bool
     */
    public function site_map()
    {
        global $_M;
        $_M['form']['pageset'] = '';
        define('IS_SITEMAP', true);

        // 如果没有开启任何地图生成,直接返回
        if (!$_M['config']['met_sitemap_html'] && !$_M['config']['met_sitemap_xml'] && !$_M['config']['met_sitemap_txt']) {
            return true;
        }

        // 获取站点地图数据
        $sitemaplist = $this->get_sitemap_data();
        $met_sitemap_max = 100000;

        // 生成HTML地图
        if ($_M['config']['met_sitemap_html']) {
            $this->create_html_sitemap($sitemaplist, $met_sitemap_max);
        }

        // 生成XML地图
        if ($_M['config']['met_sitemap_xml']) {
            $this->create_xml_sitemap($sitemaplist, $met_sitemap_max);
        }

        // 生成TXT地图
        if ($_M['config']['met_sitemap_txt']) {
            $this->create_txt_sitemap($sitemaplist, $met_sitemap_max);
        }

        return true;
    }

    /**
     * 获取站点地图数据
     */
    private function get_sitemap_data()
    {
        global $_M;
        if ($_M['config']['met_sitemap_lang']) {
            $sitemaplist = array();
            $met_langok = load::sys_class('label', 'new')->get('language')->get_lang();
            foreach ($met_langok as $val) {
                $sitemaplist = array_merge((array)$sitemaplist, (array)$this->sitemaplist($val['mark']));
            }
        } else {
            $sitemaplist = $this->sitemaplist($_M['lang']);
        }
        return $sitemaplist;
    }

    /**
     * 生成HTML格式站点地图
     */
    private function create_html_sitemap($sitemaplist, $max_items)
    {
        global $_M;
        $html = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n";
        $html .= "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n";
        $html .= "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n";
        $html .= "<title>{$_M['config']['met_webname']}</title>\n</head>\n<body>\n<ul>\n";

        $count = 0;
        foreach ($sitemaplist as $val) {
            if (++$count > $max_items) break;
            $update_time = date("Y-m-d", strtotime($val['updatetime']));
            $html .= "<li><a href='{$val['url']}' title=\"{$val['title']}\" target='_blank'>{$val['title']}</a><span>{$update_time}</span></li>\n";
        }
        $html .= "</ul>\n</body>";

        $filename = $this->get_sitemap_filename('html');
        file_put_contents($filename, $html);
    }

    /**
     * 生成XML格式站点地图
     */
    private function create_xml_sitemap($sitemaplist, $max_items)
    {
        global $_M;
        $met_langok = load::sys_class('label', 'new')->get('language')->get_lang();

        // 按语言分组处理
        $lang_groups = [];
        foreach ($sitemaplist as $item) {
            $lang = $this->get_item_lang($item['url'], $met_langok);
            if(strstr($item['url'],'lang='.$lang)){
                $item['url'] = str_replace('&lang='.$lang,'',$item['url']);
            }
            $lang_groups[$lang][] = $item;
        }

        // 为每种语言生成单独的sitemap
        foreach ($met_langok as $lang_info) {
            if (!empty($lang_info['link']) && $lang_info['mark'] != $_M['config']['met_index_type']) {
                $lang = $lang_info['mark'];
                if (!empty($lang_groups[$lang])) {
                    $this->generate_single_xml($lang_groups[$lang], $max_items, $lang);
                }
            }
        }

        // 生成默认sitemap
        $default_items = [];
        foreach ($sitemaplist as $item) {
            $lang = $this->get_item_lang($item['url'], $met_langok);
            if (empty($met_langok[$lang]['link']) || $lang == $_M['config']['met_index_type']) {
                $default_items[] = $item;
            }
        }

        if (!empty($default_items)) {
            $this->generate_single_xml($default_items, $max_items);
        }
    }

    // 生成单个语言的sitemap文件
    private function generate_single_xml($items, $max_items, $lang_suffix = '')
    {
        global $_M;
        $xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
        $xml .= "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";

        $count = 0;
        foreach ($items as $val) {
            if (++$count > $max_items) break;

            $url = $this->escape_xml($val['url']);
            $update_time = date("Y-m-d", strtotime($val['updatetime']));
            $priority = $val['priority'] ?: '0.5';

            $xml .= "<url>\n";
            $xml .= "<loc>{$url}</loc>\n";
            $xml .= "<priority>{$priority}</priority>\n";
            $xml .= "<lastmod>{$update_time}</lastmod>\n";
            $xml .= "<changefreq>weekly</changefreq>\n";
            $xml .= "</url>\n";
        }

        // 添加标签页面
        if ($_M['config']['met_webhtm'] || $_M['config']['met_pseudo']) {
            $tags = $this->get_tags_data();
            foreach ($tags as $val) {
                $url = $this->escape_xml($val['url']);
                $xml .= "<url>\n";
                $xml .= "<loc>{$url}</loc>\n";
                $xml .= "<priority>0.5</priority>\n";
                $xml .= "<lastmod>" . date('Y-m-d') . "</lastmod>\n";
                $xml .= "<changefreq>weekly</changefreq>\n";
                $xml .= "</url>\n";
            }
        }

        $xml .= "</urlset>";

        $filename = 'sitemap' . ($lang_suffix ? '_' . $lang_suffix : '') . '.xml';
        file_put_contents(PATH_WEB . $filename, $xml);
    }

    // 获取URL对应的语言
    private function get_item_lang($url, $met_langok)
    {
        global $_M;
        foreach ($met_langok as $lang => $info) {
            if (!empty($info['link']) && strpos($url, $info['link']) === 0) {
                return $lang;
            }
        }
        return $_M['config']['met_index_type'];
    }

    /**
     * 生成TXT格式站点地图
     */
    private function create_txt_sitemap($sitemaplist, $max_items)
    {
        global $_M;
        $txt = '';

        $count = 0;
        foreach ($sitemaplist as $val) {
            if (++$count > $max_items) break;
            $txt .= str_replace(['..html', '..htm'], ['.html', '.htm'], $val['url']) . "\r\n";
        }

        if ($_M['config']['met_webhtm'] || $_M['config']['met_pseudo']) {
            $tags = $this->get_tags_data();
            foreach ($tags as $val) {
                $txt .= $val['url'] . "\r\n";
            }
        }

        if (stristr(PHP_OS, "WIN")) {
            $txt = @iconv("utf-8", "GBK", $txt);
        }

        $filename = $this->get_sitemap_filename('txt');
        file_put_contents($filename, $txt);
    }

    /**
     * 获取标签数据
     */
    private function get_tags_data()
    {
        global $_M;
        if ($_M['config']['met_sitemap_lang']) {
            $tags = array();
            $met_langok = load::sys_class('label', 'new')->get('language')->get_lang();
            foreach ($met_langok as $val) {
                $_M['class']['column_label']->get_column($val['mark']);
                $tags = array_merge((array)$tags, (array)load::sys_class('label', 'new')->get('tags')->get_tags_list(array(), $val['mark']));
            }
        } else {
            $tags = load::sys_class('label', 'new')->get('tags')->get_tags_list();
        }
        return $tags;
    }

    /**
     * 获取站点地图文件名
     */
    private function get_sitemap_filename($type)
    {
        global $_M;
        $filename = 'sitemap';
        if (!$_M['config']['met_sitemap_lang'] && $_M['lang'] != $_M['config']['met_index_type']) {
            $filename .= "_{$_M['lang']}";
        }
        return PATH_WEB . $filename . '.' . $type;
    }

    /**
     * XML特殊字符转义
     */
    private function escape_xml($str)
    {
        $str = str_replace(['../','&',"'",'"','>','<','..html','.htm'],
                          ['','&amp;','&apos;','&quot;','&gt;','&lt;','.html','.htm'],
                          $str);
        return $str;
    }

    /**
     * @param int $sitemaptype
     */
    function sitemap_robots($sitemaptype = 0)
    {
        global $_M;
        if (!$sitemaptype) {
            $sitemaptype = $_M['config']['met_sitemap_xml'] ? 'xml' : ($_M['config']['met_sitemap_txt'] ? 'txt' : 0);
        }
        $suffix = $sitemaptype;
        $met_weburl_de = $_M['url']['web_site'];
        $Sitemap = "Sitemap: {$met_weburl_de}sitemap.{$suffix}";

        if (file_exists(PATH_WEB . 'robots.txt')) {
            $robots = file_get_contents(PATH_WEB . 'robots.txt');
        } else {
            $robots = "User-agent: *\n";
            $robots .= "Disallow: /app/\n";
            $robots .= "Disallow: /admin/\n";
            $robots .= "Disallow: /cache/\n";
            $robots .= "Disallow: /config/\n";
            $robots .= "Disallow: /include/\n";
            $robots .= "Disallow: /public/\n";
            $robots .= "Disallow: /install/\n";
            $robots .= "Disallow: /templates/\n";
            $robots .= "Disallow: /upload/\n";
            $robots .= "Disallow: /member/\n";
            $robots .= "Disallow: /wap/templates/\n";
            $robots .= "Sitemap: ";
        }

        if ($suffix) {
            if (stripos($robots, 'Sitemap: ') === false) {
                $robots .= "\n{$Sitemap}";
            } else {
                $robots = preg_replace('/Sitemap:.*/', $Sitemap, $robots);
            }
        } else {
            $robots = preg_replace("/Sitemap:.*/", "", $robots);
        }
        $robots = str_replace("\n\n", "\n", $robots);
        return file_put_contents(PATH_WEB . 'robots.txt', $robots);
    }

    /**
     * @return bool|string
     */
    public function html404()
    {
        global $_M;
        $param = array(
            'm' => 'include',
            'c' => 'page404',
            'a' => 'dohtml',
            'lang' => $_M['config']['met_index_type'],
            'metinfonow' => $_M['config']['met_member_force'],
            'html_filename' => '404.html'
        );
        $param_str = http_build_query($param);
        $url = $_M['url']['web_site'] . "app/system/entrance.php?{$param_str}";
        buffer::clearConfig();
        buffer::clearTemp();

        $stream_opts = array(
            "ssl" => array(
                "verify_peer"=>false,
                "verify_peer_name"=>false,
            )
        );
        $res =  file_get_contents($url,false, stream_context_create($stream_opts));
        $res = json_decode($res, true);
        if ($res['suc'] == 1) {
            return true;
        }
        return false;

        /*$curl = load::sys_class('curl', 'new');
        $curl->set('host', $_M['url']['web_site']);
        $curl->set('file', 'app/system/entrance.php');
        $curl->set('ignore', 1);
        buffer::clearConfig();
        $curl->curl_post($param);
        return true;*/
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
?>
