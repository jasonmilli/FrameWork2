<?php namespace Work\Models;
class Controller extends \Frame\Model {
    public static $config = 'default';
    public static $table = 'controller';
    public static $primary_key = 'controller_id';
    public static function role() {
        return $this->manyMany(array('child' => '\Work\Models\Role', 'link' => array('link_table' => 'role_controller')));
    }
}
