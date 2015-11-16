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
        $user_id = \Work\Models\User::where('session', '=', $_SESSION['frame_key'])->pluck('user_id');
        $id = \Work\Models\Navigation::where('user_id', '=', $user_id)
            ->where('type', '=', 'target')
            ->where('navigation', '=', $this->target)
            ->orderBy('navigation_id', 'desc')
            ->pluck('key');
        $attributes = array('type' => 'button', 'id' => $key, 'value' => $this->text);
        \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $key, 'type' => 'action', 'navigation' => $this->action));
        $button = $this->build('input', '', $attributes);
        $script = $this->build('script', '$("#'.$key.'").unbind("click").bind("click", function() {$("#'.$id.'").load("?key='.$key.'");})');
        return $button.$script;
    }
}
