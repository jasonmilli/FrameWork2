<?php namespace Work\Controllers;
class Testing {
    public static function controllers() {
        $panels = array();
        $controllers = \Work\Models\Controller::get();
        foreach ($controllers as $controller) {
            $form = new \Frame\Views\Form('\Work\Controllers\Testing::inputs', 'input');
            $form->input('', 'hidden', $controller->controller, 'inputs_submit');
            $form->input($controller->controller, 'submit', 'Test');
            $panels[] = array($form);
        }
        $layout = new \Frame\Views\Layout($panels);
        $input = new \Frame\Views\Paragraph;
        $input->text('Input');
        $output = new \Frame\Views\Paragraph;
        $output->text('Output');
        $outer_layout = new \Frame\Views\Layout(array(array($layout, 'input' => $input, 'output' => $output)));
        return $outer_layout->render();
    }
    public static function inputs($data) {
        $controller = arrayGet($data, 'inputs_submit');
        $controller_id = \Work\Models\Controller::where('controller', '=', $controller)->pluck('controller_id');
        $inputs = \Work\Models\Input::where('controller_id', '=', $controller_id)->get();
        $form = new \Frame\Views\Form('\Work\Controllers\Testing::output', 'output');
        foreach ($inputs as $input) {
            $form->input($input->label, $input->type, $input->value, $input->input);
        }
        return $form->render();
    }
}
