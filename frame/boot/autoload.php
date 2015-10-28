<?php
spl_autoload_register(function ($class) {
    include strtolower(str_replace('\\', '/', $class)).'.php';
});
