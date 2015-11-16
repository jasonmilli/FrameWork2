<?php namespace Work\Controllers;
class Main extends \Frame\Controller {
    public static function start() {
        $main = new \Frame\Views\Main;
        $header = new \Work\Views\Header;
        $middle = new \Work\Views\Middle;
        //$login = new \Work\Views\Login;
        $footer = new \Work\Views\Footer;
        $layout = new \Frame\Views\Layout(array(array($header),array('middle' => $middle),array($footer)));
        $main->layout($layout);
        return $main->render();
    }
    public static function middle() {
        $p = new \Frame\Views\Paragraph;
        $p->text('This button is working');
        return $p->render();
    }
    public static function welcome($data) {
        self::validate($data, array('name' => 'required', 'age' => 'required|numeric'));
        $p = new \Frame\Views\Paragraph;
        $p->text("Welcome {$data['name']}, {$data['age']}");
        return $p->render();
    }
}
