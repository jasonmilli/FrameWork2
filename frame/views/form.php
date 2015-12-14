<?php namespace Frame\Views;
class Form extends \Frame\View {
    private $inputs = array();
    private $target;
    private $controller;
    public function __construct($controller, $target) {
        $this->controller = $controller;
        $this->target = $target;
    }
    public function input($label, $type, $value, $input = null) {
        $this->inputs[] = array('label' => $label, 'type' => $type, 'value' => $value, 'input' => $input);
    }
    public function render() {
        $columns = array();
        $user_id = \Work\Models\User::where('session', '=', $_SESSION['frame_key'])->pluck('user_id');
        if (is_null($user_id)) $user_id = 0;
        foreach ($this->inputs as $input) {
            $id = \Frame\Key::get();
            if ($input['type'] == 'hidden') {
                $hidden = \Frame\Key::get();
                \Work\Models\Store::create(array('user_id' => $user_id, 'key' => $hidden, 'value' => $input['value']));
                $input['value'] = $hidden;
            }
            $columns[] = array($input['label'], $this->build('input', '', array('id' => $id, 'name' => $id, 'type' => $input['type'], 'value' => $input['value'])));
            if (is_null($input['input'])) continue;
            $input_id = \Work\Models\Input::where('input', '=', $input['input'])->pluck('input_id');
            \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $id, 'type' => 'input', 'navigation' => $input_id));
        }
        $layout = new \Frame\Views\Layout($columns);
        $key = \Frame\Key::get();
        $target_id = \Work\Models\Target::where('target', '=', $this->target)->pluck('target_id');
        $target = \Work\Models\Navigation::where('user_id', '=', $user_id)
            ->where('type', '=', 'target')
            ->where('navigation', '=', $target_id)
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
    console.log(hidden);
    var ids = [];
    $('body [id]').each(function() {
        if ($.inArray($(this).attr('id'), hidden) >= 0) return true;
        ids.push($(this).attr('id'));
    });
    console.log(ids);
    $.ajax({url: '', type: 'post', dataType: 'json', data: {key: '$key', form: $(this).serializeArray(), clean: ids}}).success(function(json) {
        if (!json.status || json.status != 'COMPLETE' || !json.html) {
            var message = json.message || 'System error, check logs';
            alert(message);
            return false;
        }
        $('$target').html(json.html);
    });
});
JS;
        $controller_id = \Work\Models\Controller::where('controller', '=', $this->controller)->pluck('controller_id');
        if (is_null($controller_id)) throw new \Exception("{$this->controller} not found in controller table}");
        \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $key, 'type' => 'controller', 'navigation' => $controller_id));
        $script = $this->build('script', $js);
        return $form.$script;
    }
}
