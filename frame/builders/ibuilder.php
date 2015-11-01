<?php namespace Frame\Builders;
interface iBuilder {
    public static function read(&$data);
    public static function update(&$data);
}
