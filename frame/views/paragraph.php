<?php namespace Frame\Views;
class Paragraph extends \Frame\View {
    private $text = '';
    public function text($text) {
        $this->text = $text;
    }
    public function render() {
        return $this->build('p', $this->text);
    }
}
