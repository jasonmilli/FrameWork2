<?php namespace Frame;
class Key {
    private static $lock = 0;
    public static function get($type = 'default') {
        self::getLock();
        $current = \Work\Models\Key::where('type', '=', $type)->first();
        if (is_null($current)) throw new \Exception("Key of type $type not found");
        $current->key = self::increment($current->key);
        $current->save();
        self::releaseLock();
        return self::hash($current->key);
    }
    private static function increment($key) {
        $order = \Frame\Config::get('order');
        if ($key == str_repeat(substr($order, -1), strlen($key))) return str_repeat(substr($order, 0, 1), strlen($key));
        for ($i = 1; $i <= strlen($key); $i++) {
            if (substr($key, -$i, 1) != substr($order, -1)) {
                $key = substr($key, 0, strlen($key) - $i).substr($order, strpos($order, substr($key, -$i, 1)) + 1, 1).str_repeat(substr($order, 0, 1), $i - 1);
                return $key;
            }
        }
    }
    private static function getLock() {
        while (!self::$lock++) usleep(1000);
    }
    private static function releaseLock() {
        self::$lock = 0;
    }
    private static function hash($key) {
        return hash('sha256', $key);
    }
}
