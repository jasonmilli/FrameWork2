<?php namespace Frame;
class Connection {
    private static $connections = array();
    public static function get($db) {
        if (isset(self::$connections[$db['connection']])) return self::$connections[$db['connection']];
        return self::$connections[$db['connection']] = new \PDO("{$db['driver']}:host={$db['host']};dbname={$db['schema']}", $db['username'], $db['password']);
    }
}
