<?php namespace Frame;
class View {
    public function paragraph($text) {
        return $this->build('p', $text);
    }
    private function build($tag, $content) {
        return "<$tag>$content</$tag>";
    }
}
