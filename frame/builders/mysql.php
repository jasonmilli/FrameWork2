<?php namespace Frame\Builders;
class Mysql implements iBuilder {
    public static function read(&$data) {
        if (count($data->selects)) $select = implode(", ", $data->selects);
        else $select = '*';
        $data->bindings = array();
        $data->sql = <<<SQL
SELECT $select FROM `{$data->table}`
SQL;
        if (count($data->wheres)) {
            $first = 'WHERE';
            foreach ($data->wheres as $where) {
                $data->sql .= <<<SQL
 $first `{$where['column']}` {$where['operator']} ?
SQL;
                $first = 'AND';
                $data->bindings[] = $where['variable'];
            }
        }
        if (isset($data->limit)) {
            $data->sql .= <<<SQL
 LIMIT {$data->limit}
SQL;
        }
        $data->sql .= ';';
    }
    public static function update(&$data) {
        $sets = array();
        $primary_key_value = '';
        $data->bindings = array();
        //throw new \Exception(print_r($data->updates, true));
        foreach ($data->updates as $column => $value) {
            if ($column == 'updated_at') {
                $sets[] = '`updated_at` = NOW()';
                continue;
            }
            $sets[] = "`$column` = ?";
            $data->bindings[] = $value;
            if ($column == $data->primary_key) $primary_key_value = $value;
        }
        $set = implode(", ", $sets);
        $data->sql = <<<SQL
UPDATE `{$data->table}` SET $set;
SQL;
        if (count($data->wheres)) {
            $first = 'WHERE';
            foreach ($data->wheres as $where) {
                $data->sql .= <<<SQL
 $first `{$where['column']}` {$where['operator']} ?
SQL;
                $first = 'AND';
                $data->bindings[] = $where['variable'];
            }
        }
    }
}
