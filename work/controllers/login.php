<?php namespace Work\Controllers;
class Login extends \Frame\Controller {
    public static function login($data) {
        $main = new \Frame\Views\Main;
        $login = new \Work\Views\Login($data);
        $main->layout($login);
        return $main->render();
    }
    public static function check($data) {
        self::validate($data, array('username' => 'required', 'password' => 'required'));
        $action = array('data' => array());
        foreach ($data as $key => $value) {
            if ($key == 'class' || $key == 'method') $action[$key] = $value;
            else $action['data'][$key] = $value;
        }
        $user = \Work\Models\User::where('username', '=', $data['username'])->first();
        if ($user) if (password_verify($data['password'], $user->password)) {
            $user->session = $_SESSION['frame_key'];
            $user->save();
            if ($action['data']) return $action['class']::$action['method']($action['data']);
            else return $action['class']::$action['method']();
        }
        $result = new \Work\Views\FailedLogin($action);
        return $result->render();
    }
}
