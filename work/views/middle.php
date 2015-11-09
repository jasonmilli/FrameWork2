<?php namespace Work\Views;
class Middle extends \Frame\View {
    public function render() {
        /*$paragraph = new \Frame\Views\Paragraph;
        $paragraph->text('');
        return $paragraph->render();*/
        $button = new \Frame\Views\Button;
        $button->target('middle');
        $button->text('Hit me!');
        $button->action('\Work\Controllers\Main::middle');
        return $button->render();
    }
}
