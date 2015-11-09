<?php namespace Work\Controllers;
class Main extends \Frame\Controllers {
    public static function start() {
        $main = new \Frame\Views\Main;
        $header = new \Work\Views\Header;
        $middle = new \Work\Views\Middle;
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
}
