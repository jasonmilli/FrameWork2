<?php namespace Work\Models;
class TestInput extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'test_input';
    public static $primary_key = 'test_input_id';
    public static function test() {
        return self::manyOne(array('child' => '\Work\Models\Test'));
    }
    public static function input() {
        return self::manyOne(array('child'=> '\Work\Models\Input'));
    }
}
