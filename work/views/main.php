<?php namespace Work\Views;
class Main extends \Frame\View {
    public function header() {
        return $this->paragraph('Welcome to FrameWork');
    }
    public function footer() {
        return $this->paragraph('Footer');
    }
}
