<?php namespace Frame;
class Style extends \Frame\View {
    private $content;
    private $style = array();
    private $child_style = array();
    public function __construct($content, $style = null) {
        $this->content = $content;
        if ($style) $this->style = $style;
    }
    public function style($property, $value, $orm = null) {
        if ($orm) {
            if (!isset($this->child_style[$orm])) $this->child_style[$orm] = array();
            $this->child_style[$orm][$property] = $value;
        } else {
            $this->style[$property] = $value;
        }
    }
    public function render() {
        $class = \Frame\Key::get();
        $style = '';
        if ($this->child_style) {
            $child_style = '';
            foreach ($this->child_style as $orm => $styles) {
                $child_style .= ".$class $orm{";
                foreach ($styles as $property => $value) $child_style .= "$property:$value;";
                $child_style .= "}";
            }
            $style .= $this->build('style', $child_style);
        }
        $style .= $this->content->render();
        $attribute = '';
        foreach ($this->style as $property => $value) $attribute .= "$property:$value;";
        return $this->build('div', $style, array('style' => $attribute, 'class' => $class));
    }
}
