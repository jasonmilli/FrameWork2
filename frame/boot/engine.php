<?php namespace Frame\Boot;
class Engine {
    public static function start() {
        self::config();
        $user_id = self::session();
        if (is_null($user_id)) $user_id = 0;
        $action = self::action($user_id);
        $action = self::parts($action);
        $action['data'] = self::data($user_id);
        self::cleanup($user_id);
        $user = \Work\Models\User::with('group')->first()->toArray();
        echo "<pre>".print_r($user, true)."</pre>";
        $users = \Work\Models\User::with('group')->get()->toArray();
        echo "<pre>".print_r($users, true)."</pre>";
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
        if (isset($_REQUEST['form'])) foreach ($_REQUEST['form'] as $input) {
            $name = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('key', '=', $input['name'])->where('type', '=', 'name')->pluck('navigation');
            if (!is_null($name)) $data[$name] = $input['value'];
        }
        return $data;
    }
    private static function view($action) {
        if ($action['data']) die($action['class']::$action['method']($action['data']));
        echo $action['class']::$action['method']();
    }
    private static function login($action) {
        echo \Work\Controllers\Login::login($action);
    }
    private static function cleanup($user_id) {
        if ($user_id && arrayGet($_REQUEST, 'clean')) \Work\Models\Navigation::where('user_id', '=', $user_id)->whereNotIn('key', $_REQUEST['clean'])->delete();
        \Work\Models\Navigation::where('user_id', '=', 0)->where('created_at', '<', date('Y-m-d H:i:s', strtotime('5 minutes ago')))->delete();
    }
}
