<?php namespace Work\Models;
class Role extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'role';
    public static $primary_key = 'role_id';
    public static function group() {
        return self::manyMany(array('child' => '\Work\Models\Group', 'link' => array('link_table' => 'group_role')));
    }
    public static function controller() {
        return self::manyMany(array('child' => '\Work\Models\Controller', 'link' => array('link_table' => 'role_controller')));
    }
}
