<?php namespace Frame\Boot;
class Engine {
    public static function start() {
        self::config();
        $user_id = self::session();
        if (is_null($user_id)) $user_id = 0;
        $action = self::action($user_id);
        $action = self::parts($action);
        $action['data'] = self::data($user_id);
        if ($user_id || $action['class'] == '\Work\Controllers\Login' && $action['method'] == 'check') self::view($action);
        else self::login($action);
    }
    private static function config() {
        \Frame\Config::init();
    }
    private static function session() {
        session_start();
        if (!isset($_SESSION['frame_key'])) {
            $_SESSION['frame_key'] = \Frame\Key::get();
            return null;
        }
        return \Work\Models\User::where('session', '=', $_SESSION['frame_key'])->pluck('user_id');
    }
    private static function action($user_id) {
        if (isset($_REQUEST['key'])) {
            $action = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('key', '=', $_REQUEST['key'])->where('type', '=', 'action')->pluck('navigation');
            if (!is_null($action)) return $action;
        }
        return '\Work\Controllers\Main::start';
    }
    private static function parts($action) {
        $parts = explode('::', $action);
        return array('class' => $parts[0], 'method' => $parts[1]);
    }
    private static function data($user_id) {
        $data = array();
        foreach ($_REQUEST as $key => $value) {
            if ($key == 'key') continue;
            $name = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('key', '=', $key)->where('type', '=', 'name')->pluck('navigation');
            if (!is_null($name)) $data[$name] = $value;
        }
        return $data;
    }
    private static function view($action) {
        if ($action['data']) die($action['class']::$action['method']($action['data']));
        die ($action['class']::$action['method']());
    }
    private static function login($action) {
        die(\Work\Controllers\Login::login($action));
    }
}
