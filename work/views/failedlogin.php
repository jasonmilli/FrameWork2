<?php namespace Work\Views;
class FailedLogin extends \Frame\View {
    private $data;
    public function __construct($data) {
        $this->data = $data;
    }
    public function render() {
        $paragraph = new \Frame\Views\Paragraph;
        $paragraph->text('Incorrect username/password combination');
        $login = new \Work\Views\Login($this->data);
        $layout = new \Frame\Views\Layout(array(array($paragraph), array($login)));
        return $layout->render();
    }
}
