<?php namespace Frame\Boot;
class Engine {
    public static function start() {
        $level = \Frame\Config::get('error.level');
        $file = \Frame\Config::get('error.file');
        try {
            self::steps();
        } catch (\UserException $e) {
            if ($level == 'none') file_put_contents($file, $e->getMessage().$e->getTraceAsString(), FILE_APPEND);
            else echo json_encode(array('status' => 'ERROR', 'message' => $e->getMessage().$e->getTraceAsString()));
        } catch (\Exception $e) {
            //if ($level != 'all') file_put_contents($file, $e->getMessage().$e->getTraceAsString(), FILE_APPEND);
            //else
            echo json_encode(array('status' => 'ERROR', 'message' => $e->getMessage().$e->getTraceAsString()));
        }
    }
    private static function steps() {
        self::config();
        $user = self::session();
        $controller_id = self::controller($user);
        if ($user) {
            if ($controller_id) $data = self::data($user->user_id);
            else {
                $controller_id = \Work\Models\Controller::where('controller', '=', '\Work\Controllers\Main::start')->pluck('controller_id');
                if (is_null($controller_id)) throw new \Exception('Unable to find main start controller');
            }
            $controller = self::permission($user, $controller_id);
            list($class, $method) = explode('::', $controller);
            $data = self::data($user->user_id);
            if ($controller == '\Work\Controllers\Main::start') echo \Work\Controllers\Main::start();
            elseif ($data) echo json_encode(array('status' => 'COMPLETE', 'html' => $class::$method($data)));
            else echo json_encode(array('status' => 'COMPLETE', 'html' => $class::$method()));
            //self::cleanup($user->user_id);
        } else {
            if (is_null($controller_id)) echo \Work\Controllers\Login::login(array('class' => '\Work\Controllers\Main', 'method' => 'start', 'data' => array()));
            else {
                $data = self::logindata();
                $data['target'] = arrayGet($_REQUEST, 'target');
                if (isset($data['username'])) {
                    if (!isset($data['class'])) {
                        $data['class'] = '\Work\Controllers\Main';
                        $data['method'] = 'start';
                    }
                    echo json_encode(array('status' => 'COMPLETE', 'html'=> \Work\Controllers\Login::check($data)));
                } else {
                    $controller = \Work\Models\Controller::where('controller_id', '=', $controller_id)->pluck('controller');
                    $controller = explode('::', $controller);
                    $data['class'] = $controller[0];
                    $data['method'] = $controller[1];
                    echo json_encode(array('status' => 'COMPLETE', 'html' => \Work\Controllers\Login::login($data, false)));
                }
            }
            //self::cleanup();
        }
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
            if ($user) 
                return \Work\Models\Navigation::where('user_id', '=', $user->user_id)->where('key', '=', $_REQUEST['key'])->where('type', '=', 'controller')->pluck('navigation');
            else return \Work\Models\Navigation::where('key', '=', $_REQUEST['key'])->where('type', '=', 'controller')->pluck('navigation');
        } else return null;
    }
    private static function permission($user, $controller_id) {
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
        if ($controller) throw new \Frame\Exception("User does not have access to controller $controller");
        else throw new \Exception("Controller $controller_id not found");
    }
    /*private static function parts($controller) {
        $parts = explode('::', $controller);
        return array('class' => $parts[0], 'method' => $parts[1]);
    }*/
    private static function data($user_id) {
        $data = array();
        if (isset($_REQUEST['form'])) foreach ($_REQUEST['form'] as $input) {
            if ($user_id) {
                $input_id = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('key', '=', $input['name'])->where('type', '=', 'input')->pluck('navigation');
                $store = \Work\Models\Store::where('user_id', '=', $user_id)->where('key', '=', $input['value'])->pluck('value');
            } else {
                $input_id = \Work\Models\Navigation::where('key', '=', $input['name'])->where('type', '=', 'input')->pluck('navigation');
                $store = \Work\Models\Store::where('key', '=', $input['value'])->pluck('value');
            }
            if (is_null($input_id)) throw new \Exception("{$input['name']} not found in navigation table");
            if ($store) $input['value'] = $store;
            $name = \Work\Models\Input::with('validation')->where('input_id', '=', $input_id)->first();
            if (!is_null($name->input)) $data[$name->input] = $input['value'];
            foreach ($name->validation as $validation) {
                $function = $validation->pivot->validation;
                list($class, $method) = explode('::', $function);
                if ($return = $class::$method($input['value'])) throw new \Exception($return);
            }
        }
        return $data;
    }
    private static function logindata() {
        $data = array();
        if (isset($_REQUEST['form'])) foreach ($_REQUEST['form'] as $input) {
            $input_id = \Work\Models\Navigation::where('key', '=', $input['name'])->where('type', '=', 'input')->pluck('navigation');
            if (is_null($input_id)) throw new \Exception("{$input['name']} not found in navigation table");
            $store = \Work\Models\Store::where('key', '=', $input['value'])->pluck('value');
            if ($store) $input['value'] = $store;
            $name = \Work\Models\Input::where('input_id', '=', $input_id)->first();
            if (is_null($name)) throw new \Exception("Input ID $input_id not found");
            $data[$name->input] = $input['value'];
        }
        return $data;
    }
    /*private static function main() {
        echo \Work\Controllers\Main::start();
    }
    private static function view($controller) {
        if ($controller['data']) echo json_encode(array('status' => 'COMPLETE', 'html' => $controller['class']::$controller['method']($controller['data'])));
        else echo json_encode(array('status' => 'COMPLETE', 'html' => $controller['class']::$controller['method']()));
    }
    private static function login($controller) {
        if ($controller['class'] == '\Work\Controllers\Main' && $controller['method'] == 'start') echo \Work\Controllers\Login::login($controller);
        else echo json_encode(array('status' => 'COMPLETE', 'html' => \Work\Controllers\Login::login($controller)));
    }*/
    private static function cleanup($user_id = null) {
        if ($user_id && arrayGet($_REQUEST, 'clean')) {
            \Work\Models\Navigation::where('user_id', '=', $user_id)->whereNotIn('key', $_REQUEST['clean'])->delete();
            \Work\Models\Store::where('user_id', '=', $user_id)->whereNotIn('key', $_REQUEST['clean'])->delete();
        }
        \Work\Models\Navigation::where('user_id', '=', 0)->where('created_at', '<', date('Y-m-d H:i:s', strtotime('2 hours ago')))->delete();
        \Work\Models\Store::where('user_id', '=', 0)->where('created_at', '<', date('Y-m-d H:i:s', strtotime('2 hours ago')))->delete();
    }
}
