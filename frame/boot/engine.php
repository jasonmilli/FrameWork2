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
        if (isset($_GET['key'])) {
            if ($controller = arrayGet($_SESSION['frame_targets'], $_GET['key'])) {
                $parts = explode('::', $controller);
                die($parts[0]::$parts[1]());
            }
        }
        echo \Work\Controllers\Main::start();
    }
}
