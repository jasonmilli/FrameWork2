<?php namespace Frame\Boot;
class Engine {
    public static function start() {
        self::config();
        $user_id = self::session();
        if (is_null($user_id)) $user_id = 0;
        $controller = self::controller($user_id);
        $controller = self::parts($controller);
        $controller['data'] = self::data($user_id);
        self::cleanup($user_id);
        //$user = \Work\Models\User::with('group')->first()->toArray();
        //echo "<pre>".print_r($user, true)."</pre>";
        $users = \Work\Models\User::with('group.role.controller')->get()->toArray();
        //$users = \Work\Models\Role::with('controller')->get()->toArray();
        echo "<pre>".print_r($users, true)."</pre>";
        if ($user_id || $controller['class'] == '\Work\Controllers\Login' && $controller['method'] == 'check') self::view($controller);
        else self::login($controller);
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
    private static function controller($user_id) {
        if (isset($_REQUEST['key'])) {
            $controller = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('key', '=', $_REQUEST['key'])->where('type', '=', 'controller')->pluck('navigation');
            if (!is_null($controller)) return $controller;
        }
        return '\Work\Controllers\Main::start';
    }
    private static function parts($controller) {
        $parts = explode('::', $controller);
        return array('class' => $parts[0], 'method' => $parts[1]);
    }
    private static function data($user_id) {
        $data = array();
        if (isset($_REQUEST['form'])) foreach ($_REQUEST['form'] as $input) {
            $name = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('key', '=', $input['name'])->where('type', '=', 'input')->pluck('navigation');
            if (!is_null($name)) $data[$name] = $input['value'];
        }
        return $data;
    }
    private static function view($controller) {
        if ($controller['data']) die($controller['class']::$controller['method']($controller['data']));
        echo $controller['class']::$controller['method']();
    }
    private static function login($controller) {
        echo \Work\Controllers\Login::login($controller);
    }
    private static function cleanup($user_id) {
        if ($user_id && arrayGet($_REQUEST, 'clean')) \Work\Models\Navigation::where('user_id', '=', $user_id)->whereNotIn('key', $_REQUEST['clean'])->delete();
        \Work\Models\Navigation::where('user_id', '=', 0)->where('created_at', '<', date('Y-m-d H:i:s', strtotime('5 minutes ago')))->delete();
    }
}
