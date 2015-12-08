<?php namespace Frame\Builders;
class Mysql implements iBuilder {
    public static function read(&$data) {
        if (count($data->selects)) $select = '`'.implode("`, `", $data->selects).'`';
        else $select = '*';
        $data->bindings = array();
        $data->sql = <<<SQL
SELECT $select FROM `{$data->table}`
SQL;
        self::where($data);
        if ($data->order) {
            $first = ' ORDER BY';
            foreach ($data->order as $column => $direction) {
                $data->sql .= " $first $column $direction";
                $first = ',';
            }
        }
        if (isset($data->limit)) {
            $data->sql .= <<<SQL
 LIMIT {$data->limit}
SQL;
        }
        $data->sql .= ';';
    }
    private static function where(&$data) {
        if (count($data->wheres)) {
            $first = 'WHERE';
            foreach ($data->wheres as $where) {
                if (strpos($where['column'], '`') !== false) throw new \Exception("{$where['column']} is not a legal column name");//Cheers Max!
                if (array_key_exists('variable', $where)) {
                    $data->sql .= <<<SQL
 $first `{$where['column']}` {$where['operator']} ?
SQL;
                    $data->bindings[] = $where['variable'];
                } else {
                    $bindings = array();
                    foreach ($where['values'] as $value) {
                        $bindings[] = '?';
                        $data->bindings[] = $value;
                    }
                    $bindings = implode(', ', $bindings);
                    $data->sql .= <<<SQL
 $first `{$where['column']}` {$where['operator']} ($bindings)
SQL;
                }
                $first = 'AND';
            }
        }
    }
    public static function update(&$data) {
        $sets = array();
        $primary_key_value = '';
        $data->bindings = array();
        foreach ($data->updates as $column => $value) {
            if ($column == 'updated_at') {
                $sets[] = '`updated_at` = NOW()';
                continue;
            }
            if (strpos($column, '`') !== false) throw new \Exception("$column is not a legal column name");//Cheers Max!
            $sets[] = "`$column` = ?";
            $data->bindings[] = $value;
            if ($column == $data->primary_key) $primary_key_value = $value;
        }
        $set = implode(", ", $sets);
        $data->sql = <<<SQL
UPDATE `{$data->table}` SET $set
SQL;
        self::where($data);
        $data->sql .=';';
    }
    public static function create(&$data) {
        $columns = array();
        $bindings = array();
        $data->bindings = array();
        foreach ($data->data as $column => $value) {
            if (strpos($column, '`') !== false) throw new \Exception("$column is not a legal column name");//Cheers Max!
            $columns[] = "`$column`";
            $bindings[] = '?';
            $data->bindings[] = $value;
        }
        $columns = implode(', ', $columns);
        $bindings = implode(', ', $bindings);
        $data->sql = <<<SQL
INSERT INTO `{$data->table}` ($columns, `created_at`, `updated_at`) VALUES ($bindings, NOW(), NOW());
SQL;
    }
    public static function delete(&$data) {
        $data->bindings = array();
        $data->sql = <<<SQL
DELETE FROM `{$data->table}`
SQL;
        self::where($data);
        $data->sql .=';';
    }
}
