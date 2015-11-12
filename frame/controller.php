<?php namespace Frame;
class Controller {
    protected static function validate($data, $rules) {
        foreach ($rules as $name => $set) {
            $set = explode('|', $set);
            if (in_array('required', $set) && is_null(arrayGet($data, $name))) throw new \Exception("$name attribute required");
            foreach ($set as $rule) {
                if ($rule == 'required') continue;
                \Work\Validation::$rule($data[$name]);
            }
        }
    }
}
