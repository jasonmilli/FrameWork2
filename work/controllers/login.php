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
        $controller = array('data' => array());
        foreach ($data as $key => $value) {
            if ($key == 'class' || $key == 'method') $controller[$key] = $value;
            else $controller['data'][$key] = $value;
        }
        $user = \Work\Models\User::where('username', '=', $data['username'])->first();
        if ($user) if (password_verify($data['password'], $user->password)) {
            $user->session = $_SESSION['frame_key'];
            $user->save();
            if ($controller['data']) return $controller['class']::$controller['method']($controller['data']);
            else return $controller['class']::$controller['method']();
        }
        $result = new \Work\Views\FailedLogin($controller);
        return $result->render();
    }
    public static function deny() {
        $deny = new \Work\Views\Deny;
        return $deny->render();
    }
}
