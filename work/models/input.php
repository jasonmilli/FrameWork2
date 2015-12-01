<?php namespace Work\Models;
class Input extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'input';
    public static $primary_key = 'input_id';
    public static function controller() {
        return $this->manyOne(array('child' => '\Work\Models\Controller'));
    }
}
