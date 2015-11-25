<?php namespace Frame;
class Model {
    public static function __callstatic($name, $arguments) {
        $db = Config::get('database.'.static::$config);
        $db['connection'] = static::$config;
        $connection = Connection::get($db);
        $builder = new Builder($connection, $db, static::$table, static::$primary_key, static::class);
        call_user_func_array(array($builder, $name), $arguments);
        if ($name == 'first' || $name == 'get' || $name == 'pluck') return $builder->$name();
        if ($name == 'lists') return $builder->$name($arguments[0]);
        return $builder;
    }
    public static function manyMany($data) {
        //if (!isset($data['parent_column'])) $data['parent_column'] = static::$primary_key;
        $data['type'] = 'manyMany';
        //return new \Frame\With($data);
        return $data;
    }
}
