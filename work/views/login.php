<?php namespace Work\Views;
class Login extends \Frame\View {
    private $data;
    public function __construct($data) {
        $this->data = $data;
    }
    public function render() {
        if (isset($this->data['target'])) $target = $this->data['target'];
        else $target = 'body';
        $form = new \Frame\Views\Form('\Work\Controllers\Login::check', $target);
        $form->input('', 'hidden', $this->data['class'], 'class');
        $form->input('', 'hidden', $this->data['method'], 'method');
        if (isset($this->data['data'])) foreach ($this->data['data'] as $name => $value) $form->input('', 'hidden', $value, $name);
        $form->input('Username: ', 'text', '', 'username');
        $form->input('Password: ', 'password', '', 'password');
        $form->input('', 'submit', 'Login');
        return $form->render();
    }
}
