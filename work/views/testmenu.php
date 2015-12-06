<?php namespace Work\Views;
class TestMenu extends \Frame\View {
    public function render() {
        $controllers = new \Frame\Views\Button('\Work\Controllers\Testing::controllers', 'middle');
        $controllers->text('Controllers');
        $controllers = $controllers->render();
        $tests = new \Frame\Views\Button('\Work\Controllers\Testing::tests', 'middle');
        $tests->text('Tests');
        $tests = $tests->render();
        return $controllers.$tests;
    }
}
