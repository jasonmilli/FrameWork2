<?php namespace Work;
class Validation {
    public static function numeric($value) {
        if (!is_numeric($value)) throw new \Exception("$value needs to be numeric");
    }
}
