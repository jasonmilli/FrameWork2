<?php namespace frame;
class Layout {
    private $rows;
    public function __construct($rows) {
        $this->rows = $rows;
    }
    public function render() {
        $return = "<table>";
        foreach ($this->rows as $row) {
            $return .= "<tr>";
            foreach ($row as $detail) $return .= "<td>$detail</td>";
            $return .= "</tr>";
        }
        $return .= "</table>";
        return $return;
    }
}
