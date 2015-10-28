<?php namespace Frame;
class Builder {
    private $connection;
    private $db;
    public $table;
    private $primary_key;
    public $wheres = array();
    public $selects = array();
    public $limit;
    public $sql;
    public $bindings = array();
    private $stmt;
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
        $this->prepare();
        $result = $this->stmt->fetch();
        if ($result) return new \Frame\Item($result);
        else return null;
    }
    public function pluck($column) {
        $this->selects = array($column);
        $this->prepare();
        $result = $this->stmt->fetch();
        if ($result) return arrayGet($result, $column);
        else return null;
    }
    private function prepare() {
        $class = "\\Frame\\Builders\\{$this->db['driver']}";
        $class::build($this);
        $this->stmt = $this->connection->prepare($this->sql);
        $this->stmt->execute($this->bindings);
    }
}
