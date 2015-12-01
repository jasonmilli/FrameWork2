<?php namespace Frame\Views;
class Button extends \Frame\View {
    private $text = '';
    private $target;
    private $controller;
    public function __construct($controller, $target) {
        $this->controller = $controller;
        $this->target = $target;
    }
    public function text($text) {
        $this->text = $text;
    }
    public function render() {
        $key = \Frame\Key::get();
        $user_id = \Work\Models\User::where('session', '=', $_SESSION['frame_key'])->pluck('user_id');
        if (is_null($user_id)) $user_id = 0;
        $target_id = \Work\Models\Target::where('target', '=', $this->target)->pluck('target_id');
        $id = \Work\Models\Navigation::where('user_id', '=', $user_id)
            ->where('type', '=', 'target')
            ->where('navigation', '=', $target_id)
            ->orderBy('navigation_id', 'desc')
            ->pluck('key');
        $attributes = array('type' => 'button', 'id' => $key, 'value' => $this->text);
        $controller_id = \Work\Models\Controller::where('controller', '=', $this->controller)->pluck('controller_id');
        \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $key, 'type' => 'controller', 'navigation' => $controller_id));
        $button = $this->build('input', '', $attributes);
        $js = <<<JS
$('#$key').bind('click', function(event) {
    event.preventDefault();
    var ids = [];
    $('body [id]').each(function() {
        ids.push($(this).attr('id'));
    });
    $.ajax({url: '', type: 'post', data: {key: '$key', clean: ids}}).success(function(html) {
        $('#$id').html(html);
    });
});
JS;
        $script = $this->build('script', $js);
        //$script = $this->build('script', '$("#'.$key.'").unbind("click").bind("click", function() {$("#'.$id.'").load("?key='.$key.'");})');
        return $button.$script;
    }
}
