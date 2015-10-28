<?php namespace Frame;
class Config {
    private static $conf;
    public static function init() {
        $environment = include 'environment.php';
        $defaults = include 'work/config/default.php';
        $specifics = include 'work/config/'.$environment.'.php';
        self::$conf = self::recurse($defaults, $specifics);
    }
    private static function recurse($defaults, $specifics) {
        if (is_array($defaults)) {
            $return = array();
            foreach ($defaults as $d => $default) {
                if (!is_null($specific = arrayGet($specifics, $d))) $return[$d] = self::recurse($default, $specific);
                else $return[$d] = $default;
            }
        } else {
            if ($specifics) $return = $specifics;
            else $return = $defaults;
        }
        return $return;
    }
    public static function get($address) {
        return arrayGet(self::$conf, $address);
    }
}
