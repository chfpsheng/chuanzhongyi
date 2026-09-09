<?php

// MetInfo Enterprise Content Management System
// Copyright (C) MetInfo Co.,Ltd (http://www.metinfo.cn). All rights reserved.

defined('IN_MET') or exit('No permission');

/**
 * 数据库操作类.
 */
class DB
{
    public static $querynum = 0;
    public static $link;
    /**
     * 数据库连接函数.
     *
     * @param string $con_db_host 主机地址
     * @param string $con_db_id   用户名
     * @param string $con_db_pass 密码
     * @param string $con_db_name 数据库名
     * @param string $pconnect    是否打开永久链接
     */
    public static function dbconn($con_db_host, $con_db_id, $con_db_pass, $con_db_name = '', $con_db_port = '54321', $pconnect = '')
    {


        $conn_string = "host={$con_db_host} port={$con_db_port} dbname={$con_db_name} user={$con_db_id} password={$con_db_pass}";
        $link = pg_connect($conn_string);

        if (!$link) {
            self::halt(pg_last_error());
        }

        self::$link = $link;

        $sql = "SET search_path TO public";
        $res = pg_query($link, $sql);
        if (!$res) {
            echo pg_last_error($link);
            exit();
        }

        return;
    }

    /**
     * 选择数据库
     * @param $con_db_name 选择的数据库名
     */
    public static function select_db($con_db_name = '')
    {
        $sql = "SET search_path TO {$con_db_name}";
        $res = pg_query(self::$link, $sql);
        if (!$res) {
            echo pg_last_error(self::$link);
            exit();
        }
    }

    /**
     * @param $result
     * @return array 出巡结果数组
     */
    public static function fetch_array($result)
    {
        return pg_fetch_array($result, null, PGSQL_ASSOC);
    }

    /**
     * * 获取一条数据.
     * @return array 返回执行sql语句后查询到的数据
     * @param $sql
     * @return array
     */
    public static function get_one($sql)
    {
        $result = self::query($sql);
        $rs = self::fetch_array($result);
        //如果是前台可视化编辑模式
        if (!defined('IN_ADMIN')  && $_GET['pageset'] == 1) {
            $rs = load::sys_class('view/met_datatags', 'new')->replace_sql_one($sql, $rs);
        }
        self::free_result($result);

        return $rs;
    }

    /**
     * @param $sql
     * @param string $type
     * @return array
     */
    public static function get_all($sql)
    {
        $rs = array();
        $result = self::query($sql);
        while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
            $rs[] = $line;
        }
        //如果是前台可视化编辑模式
        if (!defined('IN_ADMIN') && $_GET['pageset'] == 1) {
            $rs = load::sys_class('view/met_datatags', 'new')->replace_sql_all($sql, $rs);
        }
        self::free_result($result);

        return $rs;
    }

    /**
     * @param $sql
     * @return int
     */
    public static function query($sql)
    {
        global $_M;
        $src = $sql;
        // 统一将反引号替换为双引号，PostgreSQL 使用双引号来引用标识符
        $sql = preg_replace('/`(\w+)`/i', '"$1"', $sql);

        // 处理 INSERT 语句
        if (strtoupper(substr($sql, 0, 6)) == 'INSERT') {
            // 去除换行符
            $sql = str_replace(array("\n", "\r"), '', $sql);

            // 处理 INSERT ... SET 语法
            if (preg_match('/insert\s+into\s+([a-z0-9A-Z_]+)\s+set\s+(.*)/i', $sql, $match)) {
                $list = array();
                $table = $match[1];
                $pairs = explode(',', $match[2]);
                foreach ($pairs as $pair) {
                    list($key, $val) = array_map('trim', explode('=', $pair, 2));
                    if ($key) {
                        $list[$key] = trim($val, "'");
                    }
                }
                $row = self::insert($table, $list);
                return $row;
            }

            // 移除 VALUES 中的 NULL
            $sql = preg_replace('/insert\s+into\s+([a-z0-9A-Z_]+)\s+values\s+(\(\s*null\s*,)/i', 'INSERT INTO $1 VALUES (', $sql);
        }

        // 处理 CREATE TABLE 语句
        if (strtoupper(substr($sql, 0, 12)) == 'CREATE TABLE') {
            $sql = load::mod_class('databack/transfer', 'new')->mysqlToPgsql($sql);
        }

        // 执行查询
        $result = pg_query(self::$link, $sql);

        if (!$result) {
            if (strtoupper(substr($sql, 0, 6)) == 'INSERT') {
                error(self::errorlist($sql));
                return self::insert_id();
            } else {
                self::errorlist($sql);
            }
        }

        // 如果是 INSERT 语句，返回插入的 ID
        if (strtoupper(substr($sql, 0, 6)) == 'INSERT') {
            return self::insert_id();
        }

        return $result;
    }

    /**
     * @param string $table
     * @param array $bind
     * @return int
     */
    public static function insert($table = '', $bind = array())
    {
        $set = array();
        $vals = array(); // 初始化 $vals 数组，避免未定义变量警告
        foreach ($bind as $col => $val) {
            $col = trim($col, '`');

            if ($col == 'id' && (!$val || $val == 'NULL')) {
                continue;
            }
            $val = stripslashes($val);
            $val = addslashes($val);
            $val = self::escapePgsql($val);

            $set[] = "{$col}";
            $vals[] = "'{$val}'";
        }
        $sql = 'INSERT INTO '
            . $table
            . ' (' . implode(', ', $set) . ') '
            . 'VALUES (' . implode(', ', $vals) . ') RETURNING id'; // 添加 RETURNING id 子句以获取插入的 id
        
        $result = pg_query(self::$link, $sql);
        if (!$result) {
            self::errorlist($sql);
            return false; // 插入失败返回 false
        }

        $row = pg_fetch_row($result);
        return $row ? $row[0] : false; // 如果有结果则返回 id，否则返回 false
    }

    public static function update($table = '', $bind = array(), $condition = array())
    {
        $sql1 = '';
        foreach ($bind as $key => $val) {
            if ($key != 'id') {
                $sql1 .= " \"$key\" = '{$val}',";
            }
        }
        $sql1 = trim($sql1, ',');

        $sql2 = '';
        foreach ($condition as $key => $val) {
            if ($key != 'id') {
                $sql2 .= " \"$key\" = '{$val}',";
            }
        }
        $sql2 = trim($sql2, ',');

        $sql = "UPDATE {$table} SET $sql1 WHERE $sql2";

        $res = self::query($sql);

        return $res;
    }

    /**
     * 获取指定条数数据.
     *
     * @param string $table       表名称
     * @param string $where       where条件
     * @param string $order       order条件
     * @param string $limit_start 开始条数
     * @param string $limit_num   取条数数量
     * @param string $field_name  获取的字段
     *
     * @return array 查询得到的数据
     */
    public static function get_data($table, $where, $order, $limit_start = 0, $limit_num = 20, $field_name = '*')
    {
        if ($limit_start < 0) {
            return false;
        }
        $limit_start = $limit_start ? $limit_start : 0;
        $where = str_ireplace('WHERE', '', $where);
        $order = str_ireplace('ORDER BY', '', $order);
        $conds = '';
        if ($where) {
            $conds .= " WHERE {$where} ";
        }
        if ($order) {
            $conds .= " ORDER BY {$order} ";
        }

        $conds .= " LIMIT {$limit_num} OFFSET {$limit_start}";
        $query = "SELECT {$field_name} FROM {$table} {$conds}";
        $data = DB::get_all($query);
        if ($data) {
            return $data;
        } else {
            if ($limit_start == 0) {
                return $data;
            } else {
                return false;
            }
        }
    }

    /**
     * 统计条数.
     *
     * @param string $table_name insert、update等 sql语句
     * @param string $where_str  where条件,建议添加上WEHER
     * @param string $field_name 统计的字段
     *
     * @return int 统计条数
     */
    public static function counter($table_name, $where_str = '', $field_name = '*')
    {
        $where_str = trim($where_str);
        if (strtolower(substr($where_str, 0, 5)) != 'where' && $where_str) {
            $where_str = 'WHERE ' . $where_str;
        }
        $query = " SELECT COUNT($field_name) as total FROM $table_name $where_str ";
        $result = self::query($query);
        $res = pg_fetch_array($result, null, PGSQL_ASSOC);
        if (!$res) {
            self::error();
        }
        return $res['total'];
    }

    /**
     * 返回前一次 SQL 操作所影响的记录行数。
     * @param string $dbname 选择的数据库名
     * @return int 执行成功，则返回受影响的行的数目，如果最近一次查询失败的话，函数返回 -1
     */
    public static function affected_rows()
    {
        return pg_affected_rows(self::$link);
    }

    /**
     * 返回上一个 SQL 操作产生的文本错误信息.
     *
     * @return string 错误信息
     */
    public static function error()
    {
        return pg_last_error(self::$link);
    }

    /**
     * 返回上一个 SQL 操作中的错误信息的数字编码
     *
     * @return string 错误信息的数字编码
     */
    public static function errno()
    {
        return pg_last_error(self::$link);
    }

    /**
     * 返回上一个 SQL 操作中的错误信息的数字编码
     *
     * @return array 错误信息列表
     */
    public static function errorlist($sql = '')
    {
        error($sql . self::errno());
        return pg_last_error(self::$link);
    }

    /**
     * 返回结果集中一个字段的值
     * @param $query
     * @param $row
     */
    public static function result($query, $row)
    {
        return pg_fetch_result($query, $row, 0);
    }

    /**
     * 返回查询的结果中行的数目.
     * @return int 行数
     */
    public static function num_rows($result)
    {
        return pg_num_rows($result);
    }

    /**
     * 返回查询的结果中字段的信息.
     * @return mixed 字段数组
     */
    public static function fields($result)
    {
        $fields = array();
        $num_fields = pg_num_fields($result);
        for ($i = 0; $i < $num_fields; $i++) {
            $fields[] = pg_field_name($result, $i);
        }
        return $fields;
    }

    /**
     * 返回查询的结果中字段的数目.
     * @return int 字段数
     */
    public static function num_fields($result)
    {
        return pg_num_fields($result);
    }

    /**
     * 释放结果内存.
     */
    public static function free_result($result)
    {
        return pg_free_result($result);
    }

    /**
     * 返回上一步 INSERT 操作产生的 ID.
     *
     * @return int id号
     */
    public static function insert_id()
    {
        $result = pg_query(self::$link, "SELECT lastval()");
        $row = pg_fetch_row($result);
        return $row[0];
    }

    /**
     * 从结果集中取得一行作为数字数组.
     * @return array 结果集一行数组
     */
    public static function fetch_row($result)
    {
        return pg_fetch_row($result);
    }

    /**
     * 转义字符串中的特殊字符
     * @param $result
     * @param $sql
     * @return string
     */
    public static function escapeString($sql)
    {
        return pg_escape_string(self::$link, $sql);
    }

    public static function escapePgsql($sql)
    {
        return pg_escape_string(self::$link, $sql);
    }

    /**
     * 返回数据库服务器信息.
     */
    public static function version()
    {
        return 'pgsql';
    }

    /**
     * 关闭连接.
     */
    public static function close()
    {
        return @pg_close(self::$link);
    }

    /**
     * 无法连接数据库报错.
     */
    public static function halt($dbhost)
    {
        $sqlerror = pg_last_error();
        $sqlerror = str_replace($dbhost, 'dbhost', $sqlerror);

        header('HTTP/1.1 500 Internal Server Error');
        die("$sqlerror");
        exit;
    }
}

// This program is an open source system, commercial use, please consciously to purchase commercial license.
// Copyright (C) MetInfo Co., Ltd. (http://www.metinfo.cn). All rights reserved.
