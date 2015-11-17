<?php namespace Frame\Views;
class Form extends \Frame\View {
    private $inputs = array();
    private $target;
    private $action;
    public function __construct($action, $target) {
        $this->action = $action;
        $this->target = $target;
    }
    public function input($label, $type, $value, $name = null) {
        $this->inputs[] = array('label' => $label, 'type' => $type, 'value' => $value, 'name' => $name);
    }
    public function render() {
        $columns = array();
        $user_id = \Work\Models\User::where('session', '=', $_SESSION['frame_key'])->pluck('user_id');
        if (is_null($user_id)) $user_id = 0;
        foreach ($this->inputs as $input) {
            $id = \Frame\Key::get();
            $columns[] = array($input['label'], $this->build('input', '', array('name' => $id, 'type' => $input['type'], 'value' => $input['value'])));
            if (is_null($input['name'])) continue;
            \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $id, 'type' => 'name', 'navigation' => $input['name']));
        }
        $layout = new \Frame\Views\Layout($columns);
        $key = \Frame\Key::get();
        $target = \Work\Models\Navigation::where('user_id', '=', $user_id)
            ->where('type', '=', 'target')
            ->where('navigation', '=', $this->target)
            ->orderBy('navigation_id', 'desc')
            ->pluck('key');
        if (is_null($target)) $target = 'body';
        else $target = "#$target";
        $form = $this->build('form', $layout->render(), array('id' => $key));
        $js = <<<JS
$('#$key').submit(function(event) {
    event.preventDefault();
    var hidden = [];
    $('$target [id]').each(function() {
        hidden.push($(this).attr('id'));
    });
    var ids = [];
    $('body [id]').each(function() {
        if ($.inArray($(this).attr('id'), hidden) >= 0) return true;
        ids.push($(this).attr('id'));
    });
    $.ajax({url: '', type: 'post', data: {key: '$key', form: $(this).serializeArray(), clean: ids}}).success(function(html) {
        $('$target').html(html);
    });
});
JS;
        \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $key, 'type' => 'action', 'navigation' => $this->action));
        $script = $this->build('script', $js);
        return $form.$script;
    }
}
