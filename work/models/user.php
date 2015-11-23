<?php namespace Work\Models;
class User extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'user';
    public static $primary_key = 'user_id';
    public static function group() {
        return self::manyMany(array('child' => '\Work\Models\Group', 'link' => array('link_table' => 'user_group')));
    }
}
