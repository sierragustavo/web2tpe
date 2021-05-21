<?php

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

require_once('controllers/Controller.php');
require_once('controllers/UserController.php');
require_once('controllers/NoticiaController.php');

if ($_GET['action'] == '')
	$_GET['action'] = 'home';

$urlParts = explode('/', $_GET['action']);

$Controller = new Controller();
$UserController = new UserController();
$NoticiaController = new NoticiaController();
$NoticiaModel = new NoticiaModel();

switch ($urlParts[0]) {
	case 'home':
		$NoticiaController->showNews();
		break;
	case 'contact':
		$Controller->contact();
		break;
	case 'login':
		$UserController->login();
		break;
	case 'dpsTierList':
		$Controller->dpsTierList();
		break;
	case 'register':
		$UserController->register();
		break;
	case 'verifyUser':
		$UserController->verifyUser();
		break;
	case 'registrar':
		$UserController->registrarUsuario();
		break;
	case 'delete':
		$NoticiaController->delete($urlParts[1]);
		break;
	case 'new':
		$NoticiaModel->new(); //PREGUNTAR POR ESTO
		$NoticiaController->showNews();
		break;
	case 'seen':
		$NoticiaController->marcar($urlParts[1]);
		$NoticiaController->showNews();
		break;
	case 'logout':
		$UserController->logout();
		$NoticiaController->showNews();
	default:
		echo '<h1>Error 404 - Page not found </h1>';
		break;
}
