<?php namespace Frame;
class View {
    /*public function paragraph($text) {
        return $this->build('p', $text);
    }*/
    protected function build($tag, $content, $attributes = array()) {
        $attribute = '';
        foreach ($attributes as $key => $value) $attribute .= " $key='$value'";
        return "<$tag$attribute>$content</$tag>";
    }
}
