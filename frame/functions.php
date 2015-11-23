<?php
function arrayGet($array, $keys, $default = null) {
    if (!is_array($array) || !is_string($keys) || !strlen($keys)) return $default;
    $key_array = explode('.', $keys);
    foreach ($key_array as $key) {
        if (!isset($array[$key])) return $default;
        $array = $array[$key];
    }
    return $array;
}
