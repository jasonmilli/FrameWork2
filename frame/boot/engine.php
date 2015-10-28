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
    }
    private static function viewMain() {
        $main = new \Work\Controllers\Main;
        echo $main->render();
    }
}
