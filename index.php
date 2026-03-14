<?php
// index.php
require 'config.php';
require 'controllers/HomeController.php';
$controller = new HomeController();
$controller->index();
