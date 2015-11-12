<?php namespace Work\Views;
class Header extends \Frame\View {
    public function render() {
        $paragraph = new \Frame\Views\Paragraph;
        $paragraph->text('Hello Frameworld!');
        $form = new \Frame\Views\Form('\Work\Controllers\Main::welcome', 'welcome');
        $form->input('Name:', 'text', '', 'name');
        $form->input('Age:', 'text', '', 'age');
        $form->input('', 'submit', 'Submit', 'submit');
        $layout = new \Frame\Views\Layout(array(array($paragraph, 'welcome' => $form)));
        return $layout->render();
    }
}
