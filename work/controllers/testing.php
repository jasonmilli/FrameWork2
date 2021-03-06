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
        $form->input('', 'hidden', $controller, 'output');
        foreach ($inputs as $input) {
            $form->input($input->label, $input->type, $input->value, $input->input);
        }
        return $form->render();
    }
    public static function output($data) {
        $panels = array();
        $controller = arrayGet($data, 'output');
        list($class, $function) = explode('::', $controller);
        unset($data['output']);
        $result = $class::$function($data);
        $panels[] = array($result);
        $form = new \Frame\Views\Form('\Work\Controllers\Testing::save', 'save_test');
        $form->input('', 'hidden', $result, 'result');
        $form->input('', 'hidden', $controller, 'output_controller');
        foreach ($data as $name => $input) $form->input('', 'hidden', $input, $name);
        $form->input('', 'submit', 'Save');
        $panels[] = array('save_test' => $form);
        $layout = new \Frame\Views\Layout($panels);
        return $layout->render();
    }
    public static function save($data) {
        $controller = arrayGet($data, 'output_controller');
        $controller_id = \Work\Models\Controller::where('controller', '=', $controller)->pluck('controller_id');
        $result = arrayGet($data, 'result');
        $test_id = \Work\Models\Test::create(array('controller_id' => $controller_id, 'result' => $result));
        foreach ($data as $name => $input) {
            if ($name == 'output_controller' || $name == 'result') continue;
            $input_id = \Work\Models\Input::where('input', '=', $name)->pluck('input_id');
            \Work\Models\TestInput::create(array('test_id' => $test_id, 'input_id' => $input_id, 'input' => $input));
        }
        return 'Test saved';
    }
    public static function tests() {
        $tests = \Work\Models\Test::get();
        $rows = array();
        foreach ($tests as $test) {
            $test_inputs = \Work\Models\TestInput::where('test_id', '=', $test->test_id)->get();
            $data = array();
            foreach ($test_inputs as $test_input) {
                $input = \Work\Models\Input::where('input_id', '=', $test_input->input_id)->pluck('input');
                if (is_null($input)) throw new \Exception("No input found for {$test_input->test_input_id}");
                $data[$input] = $test_input->input;
            }
            $controller = \Work\Models\Controller::where('controller_id', '=', $test->controller_id)->pluck('controller');
            list($class, $function) = explode('::', $controller);
            if ($data) $result = $class::$function($data);
            else $result = $class::$function();
            if ($test->result == $result) $pass = 'Pass';
            else $pass = 'Fail';
            $rows[] = array($controller, $test->result, $result, $pass);
        }
        $layout = new \Frame\Views\Layout($rows);
        return $layout->render();
    }
}
