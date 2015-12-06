<?php namespace Work\Models;
class Test extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'test';
    public static $primary_key = 'test_id';
    public static function controller() {
        return self::manyOne(array('child' => '\Work\Models\Controller'));
    }
    public static function testInput() {
        return self::oneMany(array('child' => '\Work\Models\TestInput'));
    }
}
