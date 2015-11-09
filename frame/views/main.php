<?php namespace Frame\Views;
class Main extends \Frame\View {
    private $layout;
    public function layout($layout) {
        $this->layout = $layout;
    }
    public function render() {
        $title = $this->build('title', 'Framework 2.0');
        $script = $this->build('script', '', array('src' => 'https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'));
        $head = $this->build('head', $title.$script);
        $body = $this->build('body', $this->layout->render());
        return $this->build('html', $head.$body);
    }
}
