<?php namespace Work\Views;
class Middle extends \Frame\View {
    public function render() {
        $button = new \Frame\Views\Button('\Work\Controllers\Main::middle', 'middle');
        $button->text('Hit me!');
        return $button->render();
    }
}
