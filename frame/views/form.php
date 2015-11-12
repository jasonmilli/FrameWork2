<?php namespace Frame\Views;
class Form extends \Frame\View {
    private $inputs = array();
    private $target;
    private $action;
    public function __construct($action, $target) {
        $this->action = $action;
        $this->target = $target;
    }
    public function input($label, $type, $value, $name) {
        $this->inputs[] = array('label' => $label, 'type' => $type, 'value' => $value, 'name' => $name);
    }
    public function render() {
        $columns = array();
        foreach ($this->inputs as $input) {
            $id = \Frame\Key::get();
            $columns[] = array($input['label'], $this->build('input', '', array('name' => $id, 'type' => $input['type'], 'value' => $input['value'])));
            if (isset($_SESSION['frame_names'])) $_SESSION['frame_names'][$id] = $input['name'];
            else $_SESSION['frame_names'] = array($id => $input['name']);
        }
        $layout = new \Frame\Views\Layout($columns);
        $key = \Frame\Key::get();
        $reference = $_SESSION['frame_references'][$this->target];
        $form = $this->build('form', $layout->render(), array('id' => $key, 'method' => 'post', 'action' => ''));
        $js = <<<JS
$('#$key').submit(function(event) {
    event.preventDefault();
    $('#$reference').load('?key=$key&' + $(this).serialize());
});
JS;
        if (isset($_SESSION['frame_targets'])) $_SESSION['frame_targets'][$key] = $this->action;
        else $_SESSION['frame_targets'] = $_SESSION['frame_targets'] = array($key => $this->action);
        $script = $this->build('script', $js);
        return $form.$script;
    }
}
