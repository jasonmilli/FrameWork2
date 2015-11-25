<?php namespace Work\Models;
class Group extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'group';
    public static $primary_key = 'group_id';
    public static function user() {
        return self::manyMany(array('child' => '\Work\Models\User', 'link' => array('link_table' => 'user_group')));
    }
    public static function role() {
        return self::manyMany(array('child' => '\Work\Models\Role', 'link' => array('link_table' => 'group_role')));
    }
}
