<?php namespace Frame\Views;
class Layout extends \Frame\View {
    private $rows = array();
    public function __construct($rows) {
        foreach ($rows as $row) {
            $line = array();
            foreach ($row as $target => $detail) {
                if (is_numeric($target)) {
                    $attributes = array();
                    $targ = null;
                } else {
                    $user_id = \Work\Models\User::where('session', '=', $_SESSION['frame_key'])->pluck('user_id');
                    if (is_null($user_id)) $user_id = 0;
                    $target_id = \Work\Models\Target::where('target', '=', $target)->pluck('target_id');
                    $key = \Work\Models\Navigation::where('user_id', '=', $user_id)->where('type', '=', 'target')->where('navigation', '=', $target_id)->pluck('key');
                    if (is_null($key)) {
                        $key = \Frame\Key::get();
                        \Work\Models\Navigation::create(array('user_id' => $user_id, 'key' => $key, 'type' => 'target', 'navigation' => $target_id));
                    }
                    $attributes = array('id' => $key);
                    $targ = $target;
                }
                $line[] = array('target' => $targ, 'detail' => $detail, 'attributes' => $attributes);
            }
            $this->rows[] = $line;
        }
    }
    public function render() {
        $table = '';
        foreach ($this->rows as $row) {
            $tr = '';
            foreach ($row as $detail) {
                if (is_string($detail['detail'])) $tr .= $this->build('td', $detail['detail'], $detail['attributes']);
                else $tr .= $this->build('td', $detail['detail']->render(), $detail['attributes']);
            }
            $table .= $this->build('tr', $tr);
        }
        return $this->build('table', $table);
    }
}
