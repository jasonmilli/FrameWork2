<?php namespace Frame;
class Builder {
    private $connection;
    private $db;
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
    public function __construct($connection, $db, $table, $primary_key) {
        $this->connection = $connection;
        $this->db = $db;
        $this->table = $table;
        $this->primary_key = $primary_key;
    }
    public function where($column, $operator, $variable) {
        $this->wheres[] = array('column' => $column, 'operator' => $operator, 'variable' => $variable);
        return $this;
    }
    public function first() {
        $this->limit = 1;
        $stmt = $this->prepare('read');
        $result = $stmt->fetch(\PDO::FETCH_ASSOC);
        if ($result) return new \Frame\Item($result, $this);
        return null;
    }
    public function pluck($column) {
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
}
