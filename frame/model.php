<?php namespace Frame;
class Model {
    public static function __callstatic($name, $arguments) {
        if (!isset(static::$config)) static::$config = 'default';
        if (!isset(static::$table)) {
            $parts = explode("\\", strtolower(static::class));
            static::$table = strtolower($parts[count($parts) - 1]);
        }
        if (!isset(static::$primary_key)) static::$primary_key = static::$table.'_id';
        $db = Config::get('database.'.static::$config);
        $db['connection'] = static::$config;
        $connection = Connection::get($db);
        $builder = new Builder($connection, $db, static::$table, static::$primary_key);
        call_user_func_array(array($builder, $name), $arguments);
        return $builder;
    }
}
