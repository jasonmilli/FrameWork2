<?php namespace Work\Views;
class Header extends \Frame\View {
    public function render() {
        $paragraph = new \Frame\Views\Paragraph;
        $paragraph->text('Hello Frameworld!');
        return $paragraph->render();
    }
}
