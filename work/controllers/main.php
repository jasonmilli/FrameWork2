<?php namespace Work\Controllers;
class Main extends \Frame\Controllers {
    public function render() {
        return "Hello frameworld!";
    }
    public static function start() {
        $main = new \Work\Views\Main;
        $header = $main->header();
        $middle = '';
        $footer = $main->footer();
        $layout = new \Frame\Layout(array(array($header),array($middle),array($footer)));
        return $layout->render();
    }
}
