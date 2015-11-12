<?php namespace Frame\Boot;
class Engine {
    public static function start() {
        self::config();
        self::session();
        self::viewMain();
    }
    private static function config() {
        \Frame\Config::init();
    }
    private static function session() {
        session_start();
        if (!isset($_SESSION['frame_key'])) $_SESSION['frame_key'] = \Frame\Key::get();
    }
    private static function viewMain() {
        if (isset($_REQUEST['key'])) {
            if ($controller = arrayGet($_SESSION['frame_targets'], $_REQUEST['key'])) {
                $args = array();
                foreach ($_GET as $key => $value) {
                    if ($key == 'key') continue;
                    $args[arrayGet($_SESSION['frame_names'], $key)] = $value;
                }
                $parts = explode('::', $controller);
                if ($args) die($parts[0]::$parts[1]($args));
                else die($parts[0]::$parts[1]());
            }
        }
        echo \Work\Controllers\Main::start();
    }
}
