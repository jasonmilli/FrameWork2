<?php namespace Frame;
class Collection {
    public function __construct($result) {
        $count = 0;
        foreach ($result as $i => $row) {
            $this->$i = $row;
        }
    }
    public function toArray() {
        $result = array();
        foreach ($this as $item) {
            $result[] = $item->toArray();
        }
        return $result;
    }
}
