<?php


require_once 'libs/Router.php';
require_once 'api.controller/game.controller.php';
require_once 'api.controller/coments.controller.php';

// creo el router
$router = new Router();

// tabla de ruteo
$router->addRoute('juegos', 'GET', 'GameController', 'getAll');
$router->addRoute('juegos/:ID', 'GET', 'GameController', 'getOne');
//$router->addRoute('juegos/:ID', 'DELETE', 'GameController', 'remove');
$router->addRoute('juegos', "POST", 'GameController', 'addGame');
$router->addRoute('juegos/:ID', "PUT", 'GameController', 'updateGame');


// rutea
$resource = $_GET['resource'];
$method = $_SERVER['REQUEST_METHOD'];
$router->route($resource, $method);

