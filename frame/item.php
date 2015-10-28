<?php namespace Frame;
class Item {
    private $result;
    public function __construct($result) {
        $this->result = $result;
        foreach ($result as $key => $value) $this->{$key} = $value;
    }
}
