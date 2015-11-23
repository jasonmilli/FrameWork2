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
        $return = $this->{$this->type}();
        foreach ($collection as &$item) {
            $new_collection = array();
            foreach ($return[0] as $link) {
                if ($item->{$this->parent_column} == $link->{$this->parent_column}) {
                    foreach ($return[1] as $child) {
                        if ($link->{$this->child_column} == $child->{$this->child_column}) $new_collection[] = $child;
                    }
                }
            }
            $item->$function = new \Frame\Collection($new_collection);
        }
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
        return array($child_list, $return);
    }
}
