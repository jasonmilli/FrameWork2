<?php namespace Frame;
class With {
    private $type;
    private $parent_column;
    private $parent_list = array();
    private $child;
    private $child_column;
    private $link_config = null;
    private $link_table = null;
    private $link_primary_key = null;
    private $link_parent_column= null;
    private $link_child_column = null;
    private $collection;
    private $function;
    public static function nest(&$collection, $class, $functions) {
        $steps = self::getSteps($class, $functions);
        self::getGets($collection, $steps);
        //echo "<pre>".print_r($steps, true)."</pre>";
        self::recurse(0, $steps, $collection);
        //echo "<pre>".print_r($collection, true)."</pre>";
    }
    private static function recurse($count, $steps, &$collection) {
        if (is_null($collection)) return;
        if (is_object($collection) && get_class($collection) == 'Frame\Item') {
            $array = array();
            foreach ($steps[$count + 1]['get'] as $get) if ($collection->{$steps[$count]['child_column']} == $get->{$steps[$count]['child_column']}) $array[] = $get;
            if ($steps[$count]['type'] == 'oneMany') $collection->{$steps[$count]['function']} = new \Frame\Collection($array);
            elseif ($array) $collection->{$steps[$count]['function']} = $array[0];
            $counter = $count + 1;
            if (isset($steps[$counter + 1])) self::recurse($counter, $steps, $collection->{$steps[$count]['function']});
            return;
        }
        foreach ($collection as &$item) {
            $array = array();
            foreach ($steps[$count + 1]['get'] as $get) if ($item->{$steps[$count]['child_column']} == $get->{$steps[$count]['child_column']}) $array[] = $get;
            if ($steps[$count]['type'] == 'oneMany') $item->{$steps[$count]['function']} = new \Frame\Collection($array);
            elseif ($array) $item->{$steps[$count]['function']} = $array[0];
            $counter = $count + 1;
            if (isset($steps[$counter + 1])) self::recurse($counter, $steps, $item->{$steps[$count]['function']});
        }
    }
    private static function getGets($collection, &$steps) {
        $values = array();
        foreach ($collection as $item) $values[] = $item->{$steps[0]['parent_column']};
        foreach ($steps as $i => &$step) {
            if (!$i) $step['get'] = $collection;
            elseif (isset($step['parent_instance'])) $step['get'] = $step['parent_instance']->whereIn($steps[$i - 1]['parent_column'], $values)->get();
            else {
                $parent = $step['parent'];
                $step['get'] = $parent::whereIn($steps[$i - 1]['parent_column'], $values)->get();
            }
            $values = array();
            if (isset($step['child_column'])) foreach ($step['get'] as $item) $values[] = $item->{$step['child_column']};
        }
    }
    private static function getSteps($class, $functions) {
        $steps = array();
        $functions = explode('.', $functions);
        foreach ($functions as $function) {
            $step = $class::$function();
            $step['parent'] = $class;
            if (!isset($step['parent_column'])) $step['parent_column'] = $class::$primary_key;
            $class = $step['child'];
            if (!isset($step['child_column'])) $step['child_column'] = $class::$primary_key;
            $step['function'] = $function;
            if ($step['type'] == 'manyMany') {
                $db = \Frame\Config::get('database.'.arrayGet($step, 'config', 'default'));
                $db['connection'] = arrayGet($step, 'config', 'default');
                $connection = \Frame\Connection::get($db);
                $builder = new \Frame\Builder($connection, $db, $step['link']['link_table'], arrayGet($step, 'link.link_primary_key', "{$step['link']['link_table']}_id"), null);
                $steps[] = array(
                    'type' => 'oneMany',
                    'function' => $step['function'],
                    'parent' => $step['parent'],
                    'parent_column' => $step['parent_column'],
                    'child_instance' => $builder,
                    'child_column' => arrayGet($step, 'link.link_parent_column', $step['parent_column']),
                );
                $steps[] = array(
                    'type' => 'manyOne',
                    'function' => 'pivot',
                    'parent_instance' => $builder,
                    'parent_column' => arrayGet($step, 'link.link_parent_column', $step['child_column']),
                    'child' => $step['child'],
                    'child_column' => $step['child_column']
                );
            }
            else $steps[] = $step;
        }
        $last_step = $steps[count($steps) - 1];
        $step = array('parent_column' => $last_step['child_column']);
        if (isset($last_step['child_instance'])) $step['parent_instance'] = $last_step['child_instance'];
        else $step['parent'] = $last_step['child'];
        $steps[] = $step;
        return $steps;
    }
    public function __construct($data) {
        $this->type = $data['type'];
        $this->parent_column = $data['parent_column'];
        $this->child = $data['child'];
        if (isset($data['child_column'])) $this->child_column = $data['child_column'];
        else {
            $child = $this->child;
            $this->child_column = $child::$primary_key;
        }
        if (isset($data['link'])) {
            $this->link = $data['link'];
            $this->link_config = arrayGet($data, 'link.link_config', 'default');
            $this->link_table = arrayGet($data, 'link.link_table');
            $this->link_primary_key = arrayGet($data, 'link.link_primary_key', $this->link_table.'_id');
            $this->link_parent_column = arrayGet($data, 'link.link_parent_column', $this->parent_column);
            $this->link_child_column = arrayGet($data, 'link.link_child_column', $this->child_column);
        }
    }
    public function first($item) {
        $this->parent_list[] = $item[$this->parent_column];
        return $this->{$this->type}();
    }
    public function get(&$collection, $function) {
        foreach ($collection as $item) $this->parent_list[] = $item->{$this->parent_column};
        $this->collection = $collection;
        $this->function = $function;
        $this->{$this->type}();
    }
    private function manyMany() {
        $db = Config::get('database.'.$this->link_config);
        $db['connection'] = $this->link_config;
        $connection = Connection::get($db);
        $builder = new Builder($connection, $db, $this->link_table, $this->link_primary_key, null);
        //$child_list = $builder->whereIn($this->parent_column, $this->parent_list)->lists($this->child_column);
        $child_list = $builder->whereIn($this->parent_column, $this->parent_list)->get();
        $children = array();
        foreach ($child_list as $child) $children[] = $child->{$this->child_column};
        $child = $this->child;
        $return = $child::whereIn($this->child_column, $children)->get();
        if (count($this->parent_list) <= 1) return $return;
        foreach ($this->collection as &$item) {
            $collection = array();
            foreach ($child_list as $link) {
                if ($item->{$this->parent_column} == $link->{$this->parent_column}) {
                    foreach ($return as $child) {
                        if ($link->{$this->child_column} == $child->{$this->child_column}) $collection[] = $child;
                    }
                }
            }
            $item->{$this->function} = new \Frame\Collection($collection);
        }
    }
}
