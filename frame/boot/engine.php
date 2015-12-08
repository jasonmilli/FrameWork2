<?php namespace Frame\Boot;
class Engine {
    public static function start() {
        try {
            self::steps();
        } catch (\Exception $e) {
            echo json_encode(array('status' => 'ERROR', 'message' => $e->getMessage().$e->getTraceAsString()));
        }
    }
    private static function steps() {
        self::config();
        $user = self::session();
        if (is_null($user)) {
            $user = new \STDClass();
            $user->user_id = 0;
        }
        $controller = self::controller($user);
        $controller = self::parts($controller);
        $controller['data'] = self::data($user->user_id);
        self::cleanup($user->user_id);
        //$user = \Work\Models\User::with('group')->first()->toArray();
        //echo "<pre>".print_r($user, true)."</pre>";
        //$users = \Work\Models\User::with('group.role.controller')->get()->toArray();
        //$users = \Work\Models\Role::with('controller')->get()->toArray();
        //echo "<pre>".print_r($users, true)."</pre>";
        if ($controller['class'] == '\Work\Controllers\Main' && $controller['method'] == 'start') self::main();
        elseif ($user->user_id || $controller['class'] == '\Work\Controllers\Login' && $controller['method'] == 'check') self::view($controller);
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
        return \Work\Models\User::with('group.role.controller')->where('session', '=', $_SESSION['frame_key'])->first();
    }
    private static function controller($user) {
        if (isset($_REQUEST['key'])) {
            $controller_id = \Work\Models\Navigation::where('user_id', '=', $user->user_id)->where('key', '=', $_REQUEST['key'])->where('type', '=', 'controller')->pluck('navigation');
            if (!is_null($controller_id)) {
                if (isset($user->group)) {
                    foreach ($user->group as $group) {
                        if (isset($group->pivot->role)) {
                            foreach ($group->pivot->role as $role) {
                                if (isset($role->pivot->controller)) {
                                    foreach ($role->pivot->controller as $controller) {
                                        if ($controller->pivot->controller_id == $controller_id) {
                                            return $controller->pivot->controller;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                $controller = \Work\Models\Controller::where('controller_id', '=', $controller_id)->pluck('controller');
                if ($controller == '\Work\Controllers\Login::check') return $controller;
                else return '\Work\Controllers\Login::deny';
            }
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
            $input_id = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('key', '=', $input['name'])->where('type', '=', 'input')->pluck('navigation');
            if (is_null($input_id)) throw new \Exception("{$input['name']} not found in navigation table");
            $name = \Work\Models\Input::with('validation')->where('input_id', '=', $input_id)->first();
            if (!is_null($name->input)) $data[$name->input] = $input['value'];
            foreach ($name->validation as $validation) {
                $function = $validation->pivot->validation;
                $parts = explode('::', $function);
                $class = $parts[0];
                $method = $parts[1];
                if ($return = $class::$method($input['value'])) throw new \Exception($return);
            }
        }
        return $data;
    }
    private static function main() {
        echo \Work\Controllers\Main::start();
    }
    private static function view($controller) {
        if ($controller['data']) echo json_encode(array('status' => 'COMPLETE', 'html' => $controller['class']::$controller['method']($controller['data'])));
        else echo json_encode(array('status' => 'COMPLETE', 'html' => $controller['class']::$controller['method']()));
    }
    private static function login($controller) {
        echo json_encode(array('status' => 'COMPLETE', 'html' => \Work\Controllers\Login::login($controller)));
    }
    private static function cleanup($user_id) {
        if ($user_id && arrayGet($_REQUEST, 'clean')) \Work\Models\Navigation::where('user_id', '=', $user_id)->whereNotIn('key', $_REQUEST['clean'])->delete();
        \Work\Models\Navigation::where('user_id', '=', 0)->where('created_at', '<', date('Y-m-d H:i:s', strtotime('5 minutes ago')))->delete();
    }
}
