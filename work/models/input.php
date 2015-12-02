<?php namespace Work\Models;
class Input extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'input';
    public static $primary_key = 'input_id';
    public static function controller() {
        return self::manyOne(array('child' => '\Work\Models\Controller'));
    }
    public static function validation() {
        return self::manyMany(array('child' => '\Work\Models\Validation', 'link' => array('link_table' => 'input_validation')));
    }
}
