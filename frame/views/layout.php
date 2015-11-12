<?php namespace Frame\Views;
class Layout extends \Frame\View {
    private $rows;
    public function __construct($rows) {
        $this->rows = $rows;
    }
    public function render() {
        $table = '';
        foreach ($this->rows as $row) {
            $tr = '';
            foreach ($row as $reference => $detail) {
                if (is_numeric($reference)) $attributes = array();
                else {
                    $key = \Frame\Key::get();
                    if (isset($_SESSION['frame_references'])) $_SESSION['frame_references'][$reference] = $key;
                    else $_SESSION['frame_references'] = array($reference => $key);
                    $attributes = array('id' => $key);
                }
                if (is_string($detail)) $tr .= $this->build('td', $detail, $attributes);
                else $tr .= $this->build('td', $detail->render(), $attributes);
            }
            $table .= $this->build('tr', $tr);
        }
        return $this->build('table', $table);
    }
}
