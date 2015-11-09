<?php namespace Work\Views;
class Footer extends \Frame\View {
    public function render() {
        $paragraph = new \Frame\Views\Paragraph;
        $paragraph->text('Footer');
        return $paragraph->render();
    }
}
