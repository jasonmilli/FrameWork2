<?php namespace Frame;
class Controllers {
    function __construct() {
        if ($_SERVER['REQUEST_URI'] == '/'.Config::get('settings.root_address').'/controllers/login/attempt') {
            $attempt = $this->attempt($_POST);
            if (arrayGet($attempt, 'status') != 'COMPLETE') die(json_encode($attempt));
        } elseif (get_class($this) != 'Work\Controllers\Login' && is_null(arrayGet($_SESSION, 'logged_in'))) {
            $login = new \Work\Controllers\Login;
            echo $login->dump();
            die();
        }
    }
    public function dump() {
        if (isset($this->view)) $view = $this->view;
        else $view = strtolower(str_replace('\\', '/', str_replace('Controllers', 'Views', get_class($this))));
        return file_get_contents(Config::get('settings.root').'/'.$view.'.php');
    }
    private function attempt($data) {
        $user = \Work\Models\User::where('username', '=', arrayGet($data, 'username'))->where('password', '=', arrayGet($data, 'password'))->pluck('user_id');
        if (!is_null($user)) {
            $_SESSION['logged_in'] = 'yes';
            return array('status' => 'COMPLETE', 'data' => array('user_id' => $user));
        } else return array('status' => 'ERROR', 'message' => 'Incorrect username/password combination');
    }
}
