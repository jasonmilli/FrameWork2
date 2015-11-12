<?php namespace Frame\Views;
class Button extends \Frame\View {
    private $text = '';
    private $target;
    private $action;
    public function __construct($action, $target) {
        $this->action = $action;
        $this->target = $target;
    }
    public function text($text) {
        $this->text = $text;
    }
    public function render() {
        $key = \Frame\Key::get();
        $root = \Frame\Config::get('settings.url');
        $id = arrayGet($_SESSION['frame_references'], $this->target);
        $attributes= array('type' => 'button', 'id' => $key, 'value' => $this->text);
        if (isset($_SESSION['frame_targets'])) $_SESSION['frame_targets'][$key] = $this->action;
        else $_SESSION['frame_targets'] = array($key => $this->action);
        $button = $this->build('input', '', $attributes);
        $script = $this->build('script', '$("#'.$key.'").unbind("click").bind("click", function() {$("#'.$id.'").load("?key='.$key.'");})');
        return $button.$script;
    }
}
