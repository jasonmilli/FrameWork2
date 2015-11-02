<?php namespace Frame;
class Item {
    private $result;
    private $builder;
    public function __construct($result, $builder) {
        $this->result = $result;
        $this->builder = $builder;
        foreach ($result as $key => $value) $this->{$key} = $value;
    }
    public function save() {
        $this->builder->wheres = array();
        $this->builder->where($this->builder->primary_key, '=', $this->{$this->builder->primary_key});
        $this->builder->update($this);
    }
}
