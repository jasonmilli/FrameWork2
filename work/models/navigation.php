<?php namespace Work\Models;
class Navigation extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'navigation';
    public static $primary_key = 'navigation_id';
    public static function controller() {
        return self::manyOne(array('parent_column' => 'navigation', 'child' => '\Work\Models\Controller'));
    }
    public static function target() {
        return self::manyOne(array('parent_column' => 'navigation', 'child' => '\Work\Models\Target'));
    }
    public static function input() {
        return self::manyOne(array('parent_column' => 'navigation', 'child' => '\Work\Models\Input'));
    }
}
