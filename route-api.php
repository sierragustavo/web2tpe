<?php
require_once 'libs/Router.php';
require_once 'api/news-api.controller.php';


// crea el router
$router = new Router();

// define la tabla de ruteo
$router->addRoute('news', 'GET', 'NewsApiController', 'getNews');
$router->addRoute('news/:ID', 'GET', 'NewsApiController', 'getNewsById');
$router->addRoute('addnews', 'POST', 'NewsApiController', 'addNews');
$router->addRoute('categories','GET','NewsApiController','getCategories');

// rutea
$router->route($_REQUEST['resource'], $_SERVER['REQUEST_METHOD']);
