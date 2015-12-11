<?php namespace Work\Models;
class Store extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'store';
    public static $primary_key = 'store_id';
    public static function user() {
        return self::manyOne(array('child' => '\Work\Models\User'));
    }
}
