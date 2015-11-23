<?php namespace Frame;
class Builder {
    private $connection;
    private $db;
    private $class;
    public $table;
    public $primary_key;
    public $wheres = array();
    public $selects = array();
    public $limit;
    public $sql;
    public $bindings = array();
    public $updates = array();
    public $data = array();
    public $order = array();
    public $withs = array();
    public function __construct($connection, $db, $table, $primary_key, $class) {
        $this->connection = $connection;
        $this->db = $db;
        $this->table = $table;
        $this->primary_key = $primary_key;
        $this->class = $class;
    }
    public function where($column, $operator, $variable) {
        $this->wheres[] = array('column' => $column, 'operator' => $operator, 'variable' => $variable);
        return $this;
    }
    public function first() {
        $this->limit = 1;
        $stmt = $this->prepare('read');
        $result = $stmt->fetch(\PDO::FETCH_ASSOC);
        if ($result) {
            $item =  new \Frame\Item($result, $this);
            foreach ($this->withs as $function) {
                $class = $this->class;
                $with = $class::$function();
                $item->$function = $with->first($result);
            }
            return $item;
        }
        return null;
    }
    public function pluck($column) {
        $this->limit = 1;
        $this->selects = array($column);
        $stmt = $this->prepare('read');
        $result = $stmt->fetch();
        if ($result) return arrayGet($result, $column);
        else return null;
    }
    private function prepare($type) {
        $class = "\\Frame\\Builders\\{$this->db['driver']}";
        $class::$type($this);
        $stmt = $this->connection->prepare($this->sql);
        $stmt->execute($this->bindings);
        return $stmt;
    }
    public function update($updates) {
        $this->updates = $updates;
        $this->prepare('update');
    }
    public function create($data) {
        $this->data = $data;
        $this->prepare('create');
    }
    public function orderBy($column, $direction = 'asc') {
        $this->order[$column] = $direction;
        return $this;
    }
    public function whereNotIn($column, $values) {
        $this->wheres[] = array('column' => $column, 'operator' => 'NOT IN', 'values' => $values);
        return $this;
    }
    public function whereIn($column, $values) {
        $this->wheres[] = array('column' => $column, 'operator' => 'IN', 'values' => $values);
        return $this;
    }
    public function delete() {
        $this->prepare('delete');
    }
    public function with($functions) {
        if (!is_array($functions)) $functions = array($functions);
        foreach ($functions as $function) {
            $this->withs[] = $function;
        }
    }
    public function get() {
        $stmt = $this->prepare('read');
        $result = array();
        while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) $result[] = new \Frame\Item($row, $this);
        foreach ($this->withs as $function) {
            $class = $this->class;
            $with = $class::$function();
            $with->get($result, $function);
        }
        return new \Frame\Collection($result);
    }
    public function lists($column) {
        $this->selects = array($column);
        $stmt = $this->prepare('read');
        $result = array();
        while ($row = $stmt->fetch(\PDO::FETCH_NUM)) $result[] = $row[0];
        return $result;
    }
}
