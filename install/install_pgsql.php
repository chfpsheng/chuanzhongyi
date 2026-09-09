<?php
include_once __DIR__ . '/index.php';

class install_pgsql extends install
{
    public function __construct()
    {
        parent::__construct();
    }

    /******POSTGRESQL******/
    public function db_setup_pgsql()
    {
        global $_M, $db_prefix;
        $setup = $_M['form']['setup'];
        $db_prefix = $_M['form']['db_prefix'];
        $db_host = $_M['form']['db_host'];
        $db_username = $_M['form']['db_username'];
        $db_pass = $_M['form']['db_pass'];
        $db_name = $_M['form']['db_name'];
        $cndata = $_M['form']['cndata'];
        $endata = $_M['form']['endata'];
        $showdata = $_M['form']['showdata'];
        $admin_cndata = $_M['form']['admin_cndata'];
        $admin_endata = $_M['form']['admin_endata'];
        $lang = $_M['form']['lang'];
        $db_type = 'pgsql';

        if ($setup == 1) {
            $db_prefix = trim($db_prefix);
            $this->db_prefix = $db_prefix;

            if (strstr($db_host, ':')) {
                $arr = explode(':', $db_host);
                $db_host = $arr[0];
                $db_port = $arr[1];
            } else {
                $db_host = trim($db_host);
                $db_port = '54321';
            }
            $db_username = trim($db_username);
            $db_pass = trim($db_pass);
            $db_name = trim($db_name);
            $db_port = trim($db_port);
            $config = "<?php
                   /*
                   db_type = \"pgsql\"
                   db_name = \"config/metinfo.db\"
                   con_db_host = \"$db_host\"
                   con_db_port = \"$db_port\"
                   con_db_id   = \"$db_username\"
                   con_db_pass	= \"$db_pass\"
                   con_db_name = \"$db_name\"
                   tablepre    =  \"$db_prefix\"
                   db_charset  =  \"utf8\"
                  */
                  ?>";

            $fp = fopen('../config/config_db.php', 'w+');
            fputs($fp, $config);
            fclose($fp);

            $conn_string = "host={$db_host} port={$db_port} dbname={$db_name} user={$db_username} password={$db_pass} connect_timeout=30";
            $db = pg_connect($conn_string);
            if (!$db) {
                $pg_error = pg_last_error();
                $this->error[] = "数据库连接失败: " . $pg_error;
                $this->error();
            }

            //创建数据库
            $sql = "SELECT 1 FROM pg_database WHERE datname = '{$db_name}';";
            $result = pg_query($db, $sql);

            if (pg_num_rows($result) == 0) {
                $sql = "CREATE DATABASE \"{$db_name}\" OWNER \"{$db_username}\";";
                $result = pg_query($db, $sql);

                if (!$result) {
                    $this->error[] = pg_last_error();
                    $this->error();
                }
            }

            //切换数据库
            pg_close($db);
            $conn_string = "host={$db_host} port={$db_port} dbname={$db_name} user={$db_username} password={$db_pass}";
            $db = pg_connect($conn_string);
            if (!$db) {
                $this->error[] = pg_last_error();
                $this->error();
            }

            $content = self::readover('sql/pgsql_install.sql');
            self::loadSql($db_prefix,$content, $db);
            //前台语言及配置
            if ($cndata == 'yes') {
                $content = self::readover('sql/config_cn.sql');
                $content = preg_replace_callback('/{#(.+?)}/is', function ($r) use ($lang) {
                    return $lang[$r[1]];
                }, $content);
                self::loadSql($db_prefix,$content, $db);
            }
            if ($endata == 'yes') {
                $content = self::readover('sql/config_en.sql');
                $content = preg_replace_callback('/{#(.+?)}/is', function ($r) use ($lang) {
                    return $lang[$r[1]];
                }, $content);
                self::loadSql($db_prefix,$content, $db);
            }
            //演示数据
            if ($showdata == 'yes') {
                if ($cndata == 'yes') {
                    $content = self::readover('sql/mysql_demo_cn.sql');
                    $content = preg_replace_callback('/{#(.+?)}/is', function ($r) use ($lang) {
                        return $lang[$r[1]];
                    }, $content);
                    self::loadSql($db_prefix,$content, $db);
                }
                if ($endata == 'yes') {
                    $content = self::readover('sql/mysql_demo_en.sql');
                    $content = preg_replace_callback('/{#(.+?)}/is', function ($r) use ($lang) {
                        return $lang[$r[1]];
                    }, $content);
                    self::loadSql($db_prefix,$content, $db);
                }
            }
            //默认前台语言
            $met_index_type = 'cn';
            if ($cndata != 'yes' && $endata == 'yes') {
                $met_index_type = 'en';
            }

            //后台语言包
            if ($admin_cndata == 'yes') {
                $content = self::readover('sql/admin_lang_cn.sql');
                $content = preg_replace_callback('/{#(.+?)}/is', function ($r) use ($lang) {
                    return $lang[$r[1]];
                }, $content);
                self::loadSql($db_prefix,$content, $db);
            }
            if ($admin_endata == 'yes') {
                $content = self::readover('sql/admin_lang_en.sql');
                $content = preg_replace_callback('/{#(.+?)}/is', function ($r) use ($lang) {
                    return $lang[$r[1]];
                }, $content);
                self::loadSql($db_prefix,$content, $db);
            }
            //默认后台语言
            $met_admin_type = 'cn';
            if ($admin_cndata != 'yes' && $admin_endata == 'yes') {
                $met_admin_type = 'en';
            }

            if ($this->error) {
                $this->error();
            }
            $rand_i = self::met_rand_i(32);
            file_put_contents('../config/config_safe.php', '<?php /*' . $rand_i . '*/?>');
            echo "--><script>location.href=\"index.php?action=adminsetup&cndata={$cndata}&endata={$endata}&met_index_type={$met_index_type}&met_admin_type={$met_admin_type}&showdata={$showdata}&db_type={$db_type}\";</script>";
            exit;
        } else {
            include $this->template('databasesetup');
        }
    }
    function mysqlToPgsqlCreateTable($mysqlSql)
    {
        // 数据类型映射
        $typeMapping = [
            'int' => 'INT',
            'tinyint' => 'SMALLINT', // 假设 tinyint 映射到 SMALLINT
            'smallint' => 'SMALLINT',
            'mediumint' => 'INTEGER',
            'bigint' => 'BIGINT',
            'float' => 'FLOAT',
            'double' => 'DOUBLE PRECISION',
            'decimal' => 'NUMERIC',
            'varchar' => 'VARCHAR',
            'text' => 'TEXT',
            'tinytext' => 'TEXT',
            'mediumtext' => 'TEXT',
            'longtext' => 'TEXT',
            'date' => 'DATE',
            'datetime' => 'TIMESTAMP',
            'timestamp' => 'TIMESTAMP',
            'time' => 'TIME',
            'year' => 'SMALLINT', // 年份可以用 SMALLINT 来表示
            'blob' => 'BYTEA',
            'tinyblob' => 'BYTEA',
            'mediumblob' => 'BYTEA',
            'longblob' => 'BYTEA'
        ];

        // 替换反引号为双引号
        $pgsqlSql = preg_replace('/`([^`]+)`/', '"$1"', $mysqlSql);

        // 移除 MySQL 特定的引擎和字符集声明
        $pgsqlSql = preg_replace('/ENGINE=\w+/', '', $pgsqlSql);
        $pgsqlSql = preg_replace('/DEFAULT CHARSET=\w+/', '', $pgsqlSql);
        $pgsqlSql = str_replace('unsigned', '', $pgsqlSql);
        // 优化替换 AUTO_INCREMENT 为 SERIAL，处理类似 `id` int(11) NOT NULL AUTO_INCREMENT 的情况
        // 定义多种匹配 id 字段的正则表达式，将各种情况的 id 字段 sql 写法都替换成 PostgreSQL 的写法
        $patterns = [
            '/("id")\s+int\(\d+\)\s+NOT\s+NULL\s+AUTO_INCREMENT/',
            '/(\w+)\s+(\w+)\s*\(\d+\)\s+NOT\s+NULL\s+AUTO_INCREMENT/',
            '/(\w+)\s+INT\s+NOT\s+NULL\s+AUTO_INCREMENT/',
            '/(\w+)\s+INT\s+AUTO_INCREMENT\s+NOT\s+NULL/',
            '/(\w+)\s+INT\s+AUTO_INCREMENT/',
            '/(\w+)\s+int\s+NOT\s+NULL\s+AUTO_INCREMENT/',
            '/(\w+)\s+int\s+AUTO_INCREMENT\s+NOT\s+NULL/',
            '/(\w+)\s+int\s+AUTO_INCREMENT/'
        ];

        foreach ($patterns as $pattern) {
            $pgsqlSql = preg_replace_callback($pattern, function ($matches) {
                return $matches[1] . ' SERIAL';
            }, $pgsqlSql);
        }
        
        // 处理普通的 AUTO_INCREMENT 替换
        $pgsqlSql = str_replace('AUTO_INCREMENT', 'SERIAL', $pgsqlSql);
        
        // 优化数据类型映射的正则表达式，处理类型后面带括号的情况
        foreach ($typeMapping as $mysqlType => $pgsqlType) {
            $pattern = '/(' . preg_quote($mysqlType, '/') . ')\s*\(\d*\)/i';
            $replacement = $pgsqlType;
            if ($mysqlType === 'decimal') {
                $pattern = '/(' . preg_quote($mysqlType, '/') . ')\s*\((\d+,\d+)\)/i';
                $replacement = $pgsqlType . '($2)';
            }
            $pgsqlSql = preg_replace($pattern, $replacement, $pgsqlSql);
        }

        // 移除默认值周围的引号（仅对整数）
        $pgsqlSql = preg_replace("/DEFAULT '(\d+)'/", "DEFAULT $1", $pgsqlSql);

        // 将 MySQL 的 COMMENT 转换为 PostgreSQL 的注释
        // 注意：PostgreSQL 中需要使用单独的 COMMENT ON 语句来添加注释
        // 这里我们只是移除 MySQL 的 COMMENT 关键字
        $pgsqlSql = preg_replace('/COMMENT \'([^\']+)\'/', '', $pgsqlSql);

        // 返回处理后的 SQL 语句
        return trim($pgsqlSql);
    }
    /**
     * 创建数据表.
     * @param $content
     * @param $link
     * @return string
     */
    private function creat_table_pgsql($content, $link)
    {
        global $installinfo, $db_prefix, $db_setup;
        $sql = explode("\n", $content);
        $query = '';
        $j = 0;
        $i = 0;
        foreach ($sql as $key => $value) {
            $value = trim($value);
            if (!$value || $value[0] == '#') {
                continue;
            }
            if (preg_match("/\;$/", $value)) {
                $query .= $value;
                if (preg_match('/^CREATE/', $query)) {
                    $name = substr($query, 13, strpos($query, '(') - 13);
                    $c_name = str_replace('met_', $db_prefix, $name);
                    ++$i;
                }

                $query = str_replace('met_', $db_prefix, $query);
                $query = str_replace('metconfig_', 'met_', $query);
                $query = str_replace('\"', '"', $query);
                $query = str_replace('(null,', '(DEFAULT,', $query);
                $query = rtrim($query, ';');

                $result = pg_query($link, $query);
                if (!$result) {

                    file_put_contents(__DIR__ . '/error.log', $query . "\n\n", FILE_APPEND);
                    $db_setup = 0;
                    if ($j != '0') {
                        $this->error[] = '<li class="danger">出错：' . pg_last_error() . '<br/>sql:' . $query . '</li>';
                    }
                } else {
                    if (preg_match('/^CREATE/', $query)) {
                        $installinfo = $installinfo . '<li class="success"><font color="#0000EE">建立数据表' . $i . '</font>' . $c_name . ' ... <font color="#0000EE">完成</font></li>';
                    }
                    $db_setup = 1;
                }

                $query = '';
            } else {
                $query .= $value;
            }

            ++$j;
        }

        return $installinfo;
    }


    private function loadSql($db_prefix,$content, $link)
    {
        global $_M;
        $content = str_replace('met_', $db_prefix, $content);
        $content = str_replace('metconfig_', 'met_', $content);
        $content = str_replace('\"', '"', $content);
        $content = str_replace('(null,', '(DEFAULT,', $content);
        // 按分号分割 SQL 语句
        // 考虑到字段值可能包含分号，使用正则表达式来分割 SQL 语句
        // 该正则会匹配分号，但排除在单引号、双引号和注释内的分号
        $sqlStatements = preg_split('/;(?=(?:[^"\']*"[^"\']*")*[^"\']*$)(?=(?:[^\\\']*\\\'[^\\\']*\\\')*[^\\\']*$)(?![^\/]*\/\*)/', $content);

        foreach ($sqlStatements as $sql) {
            $sql = trim($sql);
            if (!empty($sql)) {
                // 执行 SQL 语句
                $result = pg_query($link, $sql);
                if (!$result) {
                    // 记录错误信息
                    file_put_contents(__DIR__ . '/error.log', $sql . "\n" . pg_last_error($link) . "\n\n", FILE_APPEND);
                    $this->error[] = '<li class="danger">出错：' . pg_last_error() . '<br/>sql:' . $sql . '</li>';
                }
            }
        }
    }

    public function adminsetup_pgsql()
    {
        global $_M;
        $setup = $_M['form']['setup'];
        $showdata = $_M['form']['showdata'];
        $regname = $_M['form']['regname'];
        $regpwd = $_M['form']['regpwd'];
        $email = $_M['form']['email'];
        $email_scribe = $_M['form']['email_scribe'];
        $tel = $_M['form']['tel'];
        $cndata = $_M['form']['cndata'];
        $endata = $_M['form']['endata'];
        $met_index_type = $_M['form']['met_index_type'];
        $met_admin_type = $_M['form']['met_admin_type'];
        $m_now_date = date('Y-m-d H:i:s', time());
        $m_now_time = time();
        $db_type = 'pgsql';

        if ($setup == 1) {
            if ($regname == '' || $regpwd == '' /*|| $email==''*/) {
                echo "<script type='text/javascript'> alert('请填写管理员信息！'); history.go(-1); </script>";
            }

            $regname = trim($regname);
            $regpwd = md5(trim($regpwd));
            $email = trim($email);
            $config = parse_ini_file('../config/config_db.php', 'ture');
            @extract($config);

            $con_db_host = $config['con_db_host'];
            $con_db_id = $config['con_db_id'];
            $con_db_pass = $config['con_db_pass'];
            $con_db_name = $config['con_db_name'];
            $con_db_port = $config['con_db_port'];
            $tablepre = $config['tablepre'];

            $webname_cn = $_M['form']['webname_cn'];
            $webkeywords_cn = $_M['form']['webkeywords_cn'];
            $webname_en = $_M['form']['webname_en'];
            $webkeywords_en = $_M['form']['webkeywords_en'];
            $cndata = $_M['form']['cndata'];
            $endata = $_M['form']['endata'];
            $lang_index_type = $_M['form']['lang_index_type'];

            $conn_string = "host={$con_db_host} port={$con_db_port} dbname={$con_db_name} user={$con_db_id} password={$con_db_pass}";
            $link = pg_connect($conn_string);
            if (!$link) {
                $this->error[] = pg_last_error();
                $this->error();
            }

            //表名
            $met_admin_table = "{$tablepre}admin_table";
            $met_config = "{$tablepre}config";
            $met_templates = "{$tablepre}templates";
            $met_column = "{$tablepre}column";
            $met_lang = "{$tablepre}lang";
            $met_style_list = "{$tablepre}style_list";
            $met_style_config = "{$tablepre}style_config";

            // @chmod('../config/config_db.php',0554);
            define('IN_MET', true);
            require_once '../app/system/include/class/pgsql.class.php';
            $db = new DB();

            $db->dbconn($con_db_host, $con_db_id, $con_db_pass, $con_db_name, $con_db_port);

            //不安装演示数据时安装空模板
            if (!$showdata) {
                //if ($cndata == 'yes') self::installTagTemplates($db, $met_templates, $this->skin_name, 'cn');
                //if ($endata == 'yes') self::installTagTemplates($db, $met_templates, $this->skin_name, 'en');
            }

            //创始人信息
            $query = "INSERT INTO {$met_admin_table} (admin_id,admin_pass,pid,role_id,admin_introduction,admin_group,admin_type,admin_email,admin_mobile,admin_register_date,admin_modify_date,admin_approval_date,admin_ok) VALUES ('{$regname}','{$regpwd}','0','1','创始人','10000','metinfo','{$email}','{$tel}','{$m_now_date}','{$m_now_date}','{$m_now_date}','1')";

            $db->query($query);

            //更新配置
            $query = " UPDATE {$met_config} set value='{$webname_cn}' where name='met_webname' and lang='cn'";
            $db->query($query);

            $query = " UPDATE {$met_config} set value='{$webkeywords_cn}' where name='met_keywords' and lang='cn'";
            $db->query($query);
            $query = " UPDATE {$met_config} set value='{$webname_en}' where name='met_webname' and lang='en'";
            $db->query($query);
            $query = " UPDATE {$met_config} set value='{$webkeywords_en}' where name='met_keywords' and lang='en'";
            $db->query($query);
            $force = self::randStr(7);
            $query = " UPDATE {$met_config} set value='{$force}' where name='met_member_force'";
            $db->query($query);

            //更新前台默认语言
            if ($lang_index_type) {
                $query = "update {$met_config} set value='{$lang_index_type}' where name='met_index_type'";
            } else {
                $query = "update {$met_config} set value='{$met_index_type}' where name='met_index_type'";
            }
            $db->query($query);
            //更新后台默认语言
            $query = "update {$met_config} set value='{$met_admin_type}' where name='met_admin_type'";
            $db->query($query);

            $agents = '';
            if (file_exists('./agents.php')) {
                include './agents.php';
                unlink('./agents.php');
            }
            unlink('../cache/langadmin_cn.php');
            unlink('../cache/langadmin_en.php');
            unlink('../cache/lang_cn.php');
            unlink('../cache/lang_en.php');
            $webname = $webname_cn ?: ($webname_en ?: '');
            $webkeywords = $webkeywords_cn ?: ($webkeywords_en ?: '');

            $data = array();
            $data['info'] = json_encode(array(
                'webname' => $webname,
                'keywords' => $webkeywords,
                'php_ver' => PHP_VERSION,
            ));
            $data['db_type'] = 'pgsql';
            $data['version'] = $this->sys_ver;
            self::curl_post($data, 20);
            self::setInstallLock();

            $metHOST = $_SERVER['HTTP_HOST'];
            $m_now_year = date('Y');
            $metcms_v = $this->sys_ver;
            setcookie('admin_lang', $met_admin_type, 3600, '/');

            include $this->template('finished');
        } else {
            $langnum = ($cndata == 'yes' || $endata == 'yes') ? 2 : 1;
            $lang = $langnum == 2 ? '中文' : ($endata == 'yes' && $cndata != 'yes' ? '英文' : '中文');
            include $this->template('adminsetup');
        }
    }
}
