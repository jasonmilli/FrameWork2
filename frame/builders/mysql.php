<?php namespace Frame\Builders;
class Mysql implements iBuilder {
    public static function build(&$data) {
        if (count($data->selects)) $select = implode(", ", $data->selects);
        else $select = '*';
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
        if (isset($limit)) {
            $data->sql .= <<<SQL
 LIMIT {$data->limit}
SQL;
        }
        $data->sql .= ';';
    }
}
