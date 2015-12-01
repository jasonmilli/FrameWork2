<?php namespace Work\Views;
class Deny {
    public function render() {
        $paragraph = new \Frame\Views\Paragraph;
        $paragraph->text('You do not have permission to be here');
        return $paragraph->render();
    }
}
