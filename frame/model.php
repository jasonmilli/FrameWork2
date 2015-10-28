<?php namespace Frame;
class Model {
    protected static $config;
    protected static $table;
    protected static $primary_key;
    public static function __callstatic($name, $arguments) {
        if (!isset(self::$config)) self::$config = 'default';
        if (!isset(self::$table)) {
            $parts = explode("\\", strtolower(static::class));
            self::$table = strtolower($parts[count($parts) - 1]);
        }
        if (!isset(self::$primary_key)) self::$primary_key = self::$table.'_id';
        $db = Config::get('database.'.self::$config);
        $db['connection'] = self::$config;
        $connection = Connection::get($db);
        $builder = new Builder($connection, $db, self::$table, self::$primary_key);
        call_user_func_array(array($builder, $name), $arguments);
        return $builder;
    }
}
