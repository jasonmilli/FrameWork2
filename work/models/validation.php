<?php namespace Work\Models;
class Validation extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'validation';
    public static $primary_key = 'validation_id';
    public static function input() {
        return self::manyMany(array('child' => '\Work\Models\Input', 'link' => array('link_table' => 'input_validation')));
    }
}
