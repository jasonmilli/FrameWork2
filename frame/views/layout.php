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
            foreach ($row as $target => $detail) {
                if (is_numeric($target)) $attributes = array();
                else {
                    $key = \Frame\Key::get();
                    $user_id = \Work\Models\User::where('session', '=', $_SESSION['frame_key'])->pluck('user_id');
                    if (is_null($user_id)) $user_id = 0;
                    $target_id = \Work\Models\Target::where('target', '=', $target)->pluck('target_id');
                    \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $key, 'type' => 'target', 'navigation' => $target_id));
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
