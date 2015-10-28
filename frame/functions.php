<?php
function arrayGet($array, $keys) {
    if (!is_array($array) || !is_string($keys) || !strlen($keys)) return null;
    $key_array = explode('.', $keys);
    foreach ($key_array as $key) {
        if (!isset($array[$key])) return null;
        $array = $array[$key];
    }
    return $array;
}
