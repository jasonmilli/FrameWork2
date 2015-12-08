<?php namespace Frame;
class Model {
    public static function __callstatic($name, $arguments) {
        $db = Config::get('database.'.static::$config);
        $db['connection'] = static::$config;
        $connection = Connection::get($db);
        $builder = new Builder($connection, $db, static::$table, static::$primary_key, static::class);
        if ($name == 'first' || $name == 'get' || $name == 'pluck') return $builder->$name();
        if ($name == 'lists' || $name == 'create') return $builder->$name($arguments[0]);
        call_user_func_array(array($builder, $name), $arguments);
        return $builder;
    }
    public static function manyMany($data) {
        $data['type'] = 'manyMany';
        return $data;
    }
    public static function manyOne($data) {
        $data['type'] = 'manyOne';
        return $data;
    }
}
