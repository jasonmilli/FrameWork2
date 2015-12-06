<?php namespace Work\Controllers;
class Main extends \Frame\Controller {
    public static function start() {
        $main = new \Frame\Views\Main;
        $panels = array();
        $panels[] = array(new \Work\Views\Header);
        if (\Frame\Libraries\User::hasRole('testing')) $panels[] = array(new \Work\Views\TestMenu);
        $panels[] = array('middle' => new \Work\Views\Middle);
        //$login = new \Work\Views\Login;
        $panels[] = array(new \Work\Views\Footer);
        $layout = new \Frame\Views\Layout($panels);
        $main->layout($layout);
        return $main->render();
    }
    public static function middle() {
        $p = new \Frame\Views\Paragraph;
        $p->text('This button is working');
        return $p->render();
    }
    public static function welcome($data) {
        $p = new \Frame\Views\Paragraph;
        $p->text("Welcome {$data['name']}, {$data['age']}");
        return $p->render();
    }
}
