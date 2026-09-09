<?php
# MetInfo Enterprise Content Management System
# Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

load::sys_func('file.func.php');
load::sys_class('common');

/**
 * 上传文件类
 * @param string $savepath		路径,为上传文件夹（upload）下的路径
 * @param string $format		允许上传文件后缀,如zip|jpg|txt,用竖线隔开,设置的格式不能超过网站设置中的格式
 * @param string $maxsize		限制上传文件大小,单位是M,设置的大小不能超过网站设置中的大小
 * @param string $is_rename		是否重命名,1：重命名，0：不重命名
 * @param string $ext			后缀
 * 以上路径变量都必须是绝对路径，如果不使用类的set方法
 */
class upfile extends common
{
    public $error;
    public $savepath;
    public $format;
    public $maxsize;
    public $is_rename;
    protected $ext;
    protected $not_allowed;
    public $savename;

    public function __construct()
    {
        parent::__construct();
        global $_M;
        $query = "SELECT * FROM {$_M['table']['language']} WHERE lang='{$_M['lang']}' AND site=1 ";
        $result = DB::get_all($query);
        foreach ($result as $val) {
            $_M['word'][$val['name']] = trim($val['value']);
        }

        //上传文件大小限制
        $upload_max_filesize = intval(ini_get('upload_max_filesize'));
        $post_max_size = intval(ini_get('post_max_size'));
        $memory_limit = intval(ini_get('memory_limit'));
        $php_upload_max_size = min($upload_max_filesize, $post_max_size, $memory_limit);
        $max_size = $php_upload_max_size ?: 8;
        $this->maxsize = $max_size * 1048576;
        $this->not_allowed = array('php', 'aspx', 'asp', 'jsp', 'js', 'asa', 'web', 'config', 'htaccess');

        $this->set_upfile();
    }

    /**s
     * @param int $erron
     * @return mixed
     */
    protected function getErrorInfo($erron = 0)
    {
        global $_M;
        $errors = array(
            0 => $_M['word']['upfileOver4'],
            1 => $_M['word']['upfileOver'],
            2 => $_M['word']['upfileOver1'],
            3 => $_M['word']['upfileOver2'],
            4 => $_M['word']['upfileOver3'],
            6 => $_M['word']['upfileOver5'],
            7 => $_M['word']['upfileOver5']
        );

        if (isset($errors[$erron])) {
            return $errors[$erron];
        } else {
            return $errors[0];
        }
    }

    /**
     * 设置字段
     */
    public function set($name = null, $value = null)
    {
        global $_M;
        if ($value === null) return false;
        if ($name === null) return false;

        switch ($name) {
            case 'savepath':
                $this->savepath = path_standard(PATH_WEB . 'upload/' . $value);
                break;
            case 'format':
                $this->format = explode('|', strtolower($value));
                break;
            case 'maxsize':
                if (is_numeric($value)) {
                    $maxsize = min($value * 1048576, $this->maxsize);
                    $this->maxsize = min($_M['config']['met_file_maxsize'] * 1048576, $maxsize);
                } else {
                    $this->maxsize = min($_M['config']['met_file_maxsize'] * 1048576, $this->maxsize);
                }
                break;
            case 'is_rename':
                $this->is_rename = $value;
                break;
        }
    }

    /**
     * 设置上传文件模式
     */
    public function set_upfile()
    {
        global $_M;
        $this->set('savepath', 'file');
        $this->set('format', $_M['config']['met_file_format']);
        $this->set('maxsize', $_M['config']['met_file_maxsize'] * 1048576);
        $this->set('is_rename', $_M['config']['met_img_rename']);
    }

    /**
     * 设置上传图片模式
     */
    public function set_upimg()
    {
        global $_M;
        $this->set('savepath', date('Ym'));
        $this->set('format', $_M['config']['met_file_format']);
        $this->set('maxsize', $_M['config']['met_file_maxsize'] * 1048576);
        $this->set('is_rename', $_M['config']['met_img_rename']);
    }

    /**
     * 设置上传备份文件模式
     */
    public function set_upsql()
    {
        global $_M;
        $this->set('savepath', 'sql');
        $this->set('format', "sql|zip");
        $this->set('maxsize', 5 * 1048576);
        $this->set('is_rename', 0);
        $this->set('is_overwrite', 1);
    }

    /**
     * 上传方法
     * @param null $field_name 上传控件的name字段值
     * @return array
     */
    public function upload($field_name = null)
    {
        global $_M;
        if ($field_name) {
            $filear = $_FILES[$field_name];
        } else {
            foreach ($_FILES as $key => $val) {
                $filear = $_FILES[$key];
                break;
            }
        }
        if (!$filear) {
            return self::_error('error');
        }

        //是否能正常上传
        if (!is_array($filear)) $filear['error'] = 4;
        if ($filear['error'] != 0) {
            $error = self::getErrorInfo($filear['error']);
            $error_info[] = $error;
            return self::_error($error);
        }

        //空间超容 有些虚拟主机不支持此函数
        if (!self::checkSpace($filear)) {
            return self::_error($this->error);
        }

        //目录不可写
        if (!self::checkUploadWritable()) {
            return self::_error($this->error);
        }

        //文件大小是否正确
        if (!self::checkFileSize($filear)) {
            return self::_error($this->error);
        }

        //文件后缀是否为合法后缀
        $this->getExt($filear["name"]); //获取允许的后缀
        $res = $this->checkImgExt($filear);  //图片检测
        if (!$res) return self::_error($this->error);
        $res = $this->checkOtherExt($filear); //PDF和svg检测
        if (!$res) return self::_error($this->error);
        $res = $this->checkExt();
        if (!$res) return self::_error($this->error);

        //新建保存文件
        $res = $this->checkDir();
        if (!$res) return self::_error($this->error);

        //文件名重命名
        $this->set_savename($filear["name"], $this->is_rename);

        //复制文件
        $upfileok = 0;
        $file_tmp = $filear["tmp_name"];
        $file_name = $this->savepath . $this->savename;
        if (stristr(PHP_OS, "WIN")) {
            $file_name = @iconv("utf-8", "GBK", $file_name);
        }

        if (function_exists("move_uploaded_file")) {
            if (move_uploaded_file($file_tmp, $file_name)) {
                $upfileok = true;
            } else if (copy($file_tmp, $file_name)) {
                $upfileok = true;
            }
        } elseif (copy($file_tmp, $file_name)) {
            $upfileok = true;
        }

        if (!$upfileok) {
            if (is_writable($this->savepath)) {
                $_M['word']['upfileOver4'] = $_M['word']['upfileOver5'];
            }
            $error = self::getErrorInfo($filear['error']);
            $error_info[] = $error;
            return self::_error($error);
        } else {
            if (stripos($filear['tmp_name'], PATH_WEB) === false) {
                @unlink($filear['tmp_name']); //Delete temporary files
            }
        }

        load::plugin('doqiniu_upload', 0, array('savename' => str_replace(PATH_WEB, '', $this->savepath) . $this->savename, 'localfile' => $file_name));

        $back = '../' . str_replace(PATH_WEB, '', $this->savepath) . $this->savename;
        return self::_success($back, $filear["size"]);
    }

    /**
     * 批量上传文件
     * @param string $form
     * @return mixed
     */
    public function uploadarr($field_name = '')
    {
        if ($field_name) {
            $filear = $_FILES[$field_name];
        } else {
            foreach ($_FILES as $key => $val) {
                $filear = $_FILES[$key];
                break;
            }
        }
        if (!$filear) {
            return self::_error('error');
        }

        $length = count($filear['name']);
        for ($i = 0; $i < $length; $i++) {
            $file['name'] = $filear['name'][$i];
            $file['type'] = $filear['type'][$i];
            $file['tmp_name'] = $filear['tmp_name'][$i];
            $file['error'] = $filear['error'][$i];
            $file['size'] = $filear['size'][$i];
            $res[$i] = $this->uploadcustom($file);
        }
        return $res;
    }

    /**
     * @param array $filear
     * @return array|mixed
     */
    public function uploadcustom($filear = '')
    {
        global $_M;
        //是否能正常上传
        if (!is_array($filear)) $filear['error'] = 4;
        if ($filear['error'] != 0) {
            $error = self::getErrorInfo($filear['error']);
            $error_info[] = $error;
            return self::_error($error);
        }

        //是否能正常上传
        if (!is_array($filear)) $filear['error'] = 4;
        if ($filear['error'] != 0) {
            $error = self::getErrorInfo($filear['error']);
            $error_info[] = $error;
            return self::_error($error);
        }

        //空间超容 有些虚拟主机不支持此函数
        if (!self::checkSpace($filear)) {
            return self::_error($this->error);
        }

        //目录不可写
        if (!self::checkUploadWritable()) {
            return self::_error($this->error);
        }

        //文件大小是否正确
        if (!self::checkFileSize($filear)) {
            return self::_error($this->error);
        }

        //文件后缀是否为合法后缀
        $this->getExt($filear["name"]); //获取允许的后缀
        $res = $this->checkImgExt($filear);
        if (!$res) return self::_error($this->error);
        $res = $this->checkExt();
        if (!$res) return self::_error($this->error);


        //新建保存文件
        $res = $this->checkDir();
        if (!$res) return self::_error($this->error);

        //文件名重命名
        $this->set_savename($filear["name"], $this->is_rename);

        //复制文件
        $upfileok = false;
        $file_tmp = $filear["tmp_name"];
        $file_name = $this->savepath . $this->savename;
        if (stristr(PHP_OS, "WIN")) {
            $file_name = @iconv("utf-8", "GBK", $file_name);
        }
        if (function_exists("move_uploaded_file")) {
            if (move_uploaded_file($file_tmp, $file_name)) {
                $upfileok = true;
            } else if (copy($file_tmp, $file_name)) {
                $upfileok = true;
            }
        } elseif (copy($file_tmp, $file_name)) {
            $upfileok = true;
        }
        if (!$upfileok) {
            $error = self::getErrorInfo($filear['error']);
            $error_info[] = $error;
            return self::_error($error);
        } else {
            if (stripos($filear['tmp_name'], PATH_WEB) === false) {
                @unlink($filear['tmp_name']); //Delete temporary files
            }
        }

        load::plugin('doqiniu_upload', 0, array('savename' => str_replace(PATH_WEB, '', $this->savepath) . $this->savename, 'localfile' => $file_name));

        $back = '../' . str_replace(PATH_WEB, '', $this->savepath) . $this->savename;
        return self::_success($back, $filear['size']);
    }

    /**
     * @param $filename
     * @return string|void
     */
    protected function getExt($filename)
    {
        if ($filename == "") return false;

        $ext = '';
        $extension = pathinfo($filename, PATHINFO_EXTENSION);
        if (preg_match("/^[0-9a-zA-Z]+$/u", $extension)) {
            $ext = strtolower($extension);
        }

        return $this->ext = $ext;
    }

    /**
     * 是否重命名
     * @param $filename
     * @param $is_rename 是否重命名，0或1
     * @return mixed|string
     */
    protected function set_savename($filename, $is_rename)
    {
        if ($is_rename) { //重命名
            srand((float)microtime() * 1000000);
            $rnd = rand(100, 999);
            $f_name = date('U') + $rnd;
            $f_name = $f_name . "." . $this->ext;
        } else { //不重命名
            $name_arr = explode('.', $filename);
            $ext = array_pop($name_arr);
            $str = implode('_', $name_arr);
            $f_name = "{$str}.{$ext}";
            $f_name = str_replace(array(":", "*", "?", "|", "/", "\\", "\"", "<", ">", "——", " "), '_', $f_name);

            if (stristr(PHP_OS, "WIN")) {
                if (!preg_match('/^[<0-9a-zA-Z\x{4e00}-\x{9fa5}-_<>().\s]+$/u', $f_name) && version_compare(phpversion(), '5.4', '<')) {
                    $this->set_savename($filename, 1);
                }
                $filename_temp = @iconv("utf-8", "GBK", $f_name);
            } else {
                $filename_temp = $f_name;
            }

            $i = 0;
            $savename_temp = str_replace('.' . $this->ext, '', $filename_temp);
            while (file_exists($this->savepath . $filename_temp)) {
                $i++;
                $filename_temp = $savename_temp . '(' . $i . ')' . '.' . $this->ext;
            }
            if ($i != 0) {
                $f_name = str_replace('.' . $this->ext, '', $f_name) . '(' . $i . ')' . '.' . $this->ext;
            }
        }
        return $this->savename = $f_name;
    }

    /**
     * @return bool
     */
    protected function checkExt()
    {
        global $_M;
        if (in_array($this->ext, $this->not_allowed)) {
            $this->error = $this->ext . $_M['word']['upfileTip3'];
            return false;
        }

        if (!$this->format || !in_array($this->ext, $this->format)) {
            $this->error = $this->ext . $_M['word']['upfileTip3'];
            return false;
        }

        return true;
    }

    /**
     * @param $filear
     * @return bool
     */
    protected function checkImgExt($filear)
    {
        global $_M;
        if (!getimagesize($filear['tmp_name']) && in_array($this->ext, array('png', 'jpg', 'gif', 'bmp', 'jpeg'))) {
            // 假图片不允许上传
            $this->error = $_M['word']['upfileTip3'];
            return false;
        }
        return true;
    }

    /**
     * @param $filear
     * @return bool
     */
    protected function checkOtherExt($filear)
    {
        global $_M;
        if (in_array($this->ext, array('pdf', 'svg'))) {
            $content = file_get_contents($filear['tmp_name']);
            if ($this->ext == 'svg') {
                if(!$this->sanitizeSVG($content)){
                    $this->error = $this->ext . " content error";
                    return false;
                }
            }
            if ($this->ext == 'pdf') {
                $res = $this->sanitizePDF($content);
                if($res !== true){
                    $this->error = $this->ext . $res;
                    return false;
                }
            }
        }
        return true;
    }


    private function sanitizeSVG($content)
    {
        if (preg_match('/<\?xml-stylesheet/i', $content)) {
            return false;
        }
        if (preg_match('/xmlns:[^\s=]+\s*=\s*(["\'])[^"\']*1999\/(xlink|xhtml)[^"\']*\1/i', $content)) {
            return false;
        }
        $dom = new DOMDocument();
        $old_entity = function_exists('libxml_disable_entity_loader') && LIBXML_VERSION < 20900;
        if ($old_entity) {
            libxml_disable_entity_loader(true);
        }
        $prev_errors = libxml_use_internal_errors(true);
        $res = $dom->loadXML($content, LIBXML_NOCDATA | LIBXML_NOBLANKS | LIBXML_NONET);
        libxml_clear_errors();
        libxml_use_internal_errors($prev_errors);
        if ($old_entity) {
            libxml_disable_entity_loader(false);
        }
        if ($res === false) {
            return false;
        }
        $svg_black_list = array(
            'elements' => [
                'script', 'foreignobject', 'iframe', 'embed', 'object', 'form',
                'input', 'button', 'textarea', 'select', 'option', 'optgroup',
                'fieldset', 'label', 'legend', 'datalist', 'output', 'audio',
                'video', 'source', 'track', 'canvas', 'animate',
                'animatemotion', 'animatetransform', 'set', 'mpath', 'feimage',
                'feturbulence', 'feblend', 'fecolormatrix', 'fecomponenttransfer',
                'fecomposite', 'feconvolvematrix', 'fediffuselighting',
                'fedisplacementmap', 'fedistantlight', 'fedropshadow', 'feflood',
                'fefunca', 'fefuncb', 'fefuncg', 'fefuncr', 'fegaussianblur',
                'femerge', 'femergenode', 'femorphology', 'feoffset',
                'fepointlight', 'fespecularlighting', 'fespotlight', 'fetile',
                'image', 'use', 'style', 'handler', 'listener'
            ],
            'attributes' => [
                'onload', 'onclick', 'onerror', 'onmouseover', 'onfocus',
                'onblur', 'onchange', 'onkeydown', 'onkeypress', 'onkeyup',
                'onmousedown', 'onmousemove', 'onmouseout', 'onmouseup',
                'onsubmit', 'onreset', 'onselect', 'onunload', 'onbeforeunload',
                'ondblclick', 'oncontextmenu', 'onmouseenter', 'onmouseleave',
                'onwheel', 'onscroll', 'onresize', 'onabort', 'oncanplay',
                'oncanplaythrough', 'ondurationchange', 'onemptied', 'onended',
                'oninvalid', 'onloadeddata', 'onloadedmetadata', 'onloadstart',
                'onpause', 'onplay', 'onplaying', 'onprogress', 'onratechange',
                'onreadystatechange', 'onseeked', 'onseeking', 'onstalled',
                'onsuspend', 'ontimeupdate', 'onvolumechange', 'onwaiting',
                'oncopy', 'oncut', 'onpaste', 'onafterprint', 'onbeforeprint',
                'onbeforescriptexecute', 'onafterscriptexecute', 'onhashchange',
                'onlanguagechange', 'onmessage', 'onoffline', 'ononline',
                'onpagehide', 'onpageshow', 'onpopstate', 'onrejectionhandled',
                'onstorage', 'onunhandledrejection', 'onanimationstart',
                'onanimationend', 'onanimationiteration', 'ontransitionstart',
                'ontransitionend', 'ontransitionrun', 'ontransitioncancel',
                'onpointerdown', 'onpointermove', 'onpointerup', 'onpointercancel',
                'onpointerover', 'onpointerout', 'onpointerenter',
                'onpointerleave', 'ongotpointercapture', 'onlostpointercapture',
                'ontouchstart', 'ontouchmove', 'ontouchend', 'ontouchcancel',
                'onbegin', 'onend', 'onrepeat',
                'href', 'xlink:href', 'src', 'data', 'action', 'formaction',
                'poster', 'cite', 'longdesc', 'profile', 'usemap', 'background',
                'dynsrc', 'lowsrc', 'xmlns', 'xmlns:xlink', 'xml:base',
                'xml:lang', 'xml:space', 'style', 'class', 'id', 'tabindex',
                'accesskey', 'contenteditable', 'spellcheck', 'translate',
                'enterkeyhint', 'inputmode', 'is', 'part', 'exportparts',
                'slot', 'shadowrootmode', 'shadowrootdelegatesfocus',
                'shadowrootclonable', 'shadowrootserializable'
            ]
        );
        foreach ($dom->getElementsByTagName('*') as $node) {
            if (in_array(strtolower($node->localName), $svg_black_list['elements'])) {
                return false;
            }
            foreach ($node->attributes as $attr) {
                $local = strtolower($attr->localName);
                if (strpos($local, 'on') === 0) {
                    return false;
                }
                $ns = strtolower((string)$attr->namespaceURI);
                if (strpos($ns, '1999/xlink') !== false || strpos($ns, '1999/xhtml') !== false) {
                    return false;
                }
                $val = strtolower(trim($attr->value));
                if (strpos($val, '1999/xlink') !== false || strpos($val, '1999/xhtml') !== false) {
                    return false;
                }
                if (in_array($local, $svg_black_list['attributes'])) {
                    return false;
                }
            }
        }
        
        return true;
    }

    private function sanitizePDF($content)
    {
        // 移除PDF流内容（二进制数据），避免误匹配
        // 危险的动作定义总是在PDF的结构/字典层，不在流数据内部
        $content = preg_replace('/stream\r?\n.*?endstream/s', '', $content);

        // 检测危险的PDF动作和功能
        // 包括混淆的名称（如 /J#53 -> /JS）
        $dangerous_patterns = [
            '/\/JS\b/i',                     // JavaScript
            '/\/JavaScript\b/i',             // JavaScript
            '/\/J#5[3-9A-Fa-f]/i',           // 混淆的 /JS (#53='S')
            '/\/Ja#76a#53cript/i',           // 混淆的 /JavaScript
            '/\/AA\s*<<[^>]*\/S\s*\/(JavaScript|JS)\b/i', // AA + JavaScript 动作（上下文检测，避免误报）
            '/\/OpenAction\b/i',             // 自动执行动作
            '/\/Launch\b/i',                 // 启动外部程序
            '/\/SubmitForm\b/i',             // 表单提交
            '/\/EmbeddedFile\b/i',           // 嵌入文件
            '/\/URI\s*\([^)]*javascript:/i', // javascript: URI
            '/\/ImportData\b/i',             // 导入数据
            '/\/RichMedia\b/i',              // RichMedia (Flash等)
            '/\/Sound\b/i',                  // 声音
            '/\/Movie\b/i',                  // 视频
            '/\/Rendition\b/i',              // 渲染动作
        ];

        foreach ($dangerous_patterns as $pattern) {
            if (preg_match($pattern, $content)) {
                return $pattern;
            }
        }

        // 检测十六进制编码的危险字符串（如 <4A53> = "JS"）
        // 只检测特定的危险模式，避免误报
        if (preg_match('/<4[1-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]>/i', $content)) {
            // 检测十六进制编码的 "AA" 或 "JS"
            $hex_content = strtoupper($content);
            if (strpos($hex_content, '<4141>') !== false || strpos($hex_content, '<4A53>') !== false) {
                return $hex_content;
            }
        }

        return true;
    }

    /**
     * @param $filear
     * @return bool
     */
    protected function checkSpace($filear)
    {
        if (function_exists('disk_free_space')) {
            if (disk_free_space(__DIR__) != FALSE && disk_free_space(__DIR__) != 'NULL') {
                if (disk_free_space(__DIR__) < $filear["size"]) {
                    $this->error = "out of disk space";
                    return false;
                }
            }
        }
        return true;
    }

    protected function checkUploadWritable()
    {
        if (!is_writable(PATH_WEB . "upload")) {
            $this->error = "directory ['" . PATH_WEB . "upload'] can not write";
            return false;
        }
        return true;
    }

    protected function checkDir()
    {
        global $_M;
        if (stripos($this->savepath, PATH_WEB . 'upload/') !== 0) {
            $this->error = $_M['word']['upfileFail2'];
            return false;
        }

        if (strstr($this->savepath, './')) {
            $this->error = $_M['word']['upfileTip3'];
            return false;
        }
        if (!makedir($this->savepath)) {
            $this->error = $_M['word']['upfileFail2'];
            return false;
        }
        return true;
    }

    /**
     * @param $filear
     * @return bool
     */
    protected function checkFileSize($filear)
    {
        global $_M;
        if ($filear["size"] > $this->maxsize) {
            $md = byte_format($this->maxsize, 0, 'MB');
            $this->error = "{$_M['word']['upfileFile']} \"" . $filear["name"] . "\" {$_M['word']['upfileMax']} {$md} {$_M['word']['upfileTip1']}";
            return false;
        }
        return true;
    }

    /**
     * @param $error
     * @return array
     */
    protected function _error($error)
    {
        $redata = array();
        $redata['error'] = $error;
        $redata['msg'] = $error;
        return $redata;
    }

    /**
     * @param string $path
     * @param string $size
     * @return array
     */
    protected function _success($path = '', $size = '')
    {
        $redata = array();
        $redata['size'] = $size;
        $redata['path'] = $path;
        return $redata;
    }
}

# This program is an open source system, commercial use, please consciously to purchase commercial license.
# Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
