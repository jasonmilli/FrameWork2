<?php namespace Work;
class Validation {
    public static function numeric($value) {
        if (!is_numeric($value)) return "$value needs to be numeric";
        return false;
    }
}
