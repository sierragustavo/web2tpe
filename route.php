<?php
require_once('controllers/Controller.php');
require_once('controllers/UserController.php');
require_once('controllers/NoticiaController.php');

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (empty($_GET["action"])) {
	$_GET["action"] = "home";
}

$urlParts = explode('/', $_GET['action']);

$Controller = new Controller();
$UserController = new UserController();
$NoticiaController = new NoticiaController();

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
	case 'manager_categories':
		$NoticiaController->showManage();
		break;
	case 'newCategory':
		$NoticiaController->addCategory();
		break;
	case 'deleteCategory':
		$NoticiaController->deleteCategory($urlParts[1]);
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
		$NoticiaController->deleteNews($urlParts[1]);
		break;
	case 'new':
		$NoticiaController->addNews();
		break;
	case 'details':
		$NoticiaController->detalleNoticia($urlParts[1]);
		break;
	case 'update':
		$NoticiaController->renderUpdate($urlParts[1]);
		break;
	case 'form_news':
		$NoticiaController->renderFormNews();
		break;
	case 'logout':
		$UserController->logout();
		$NoticiaController->showNews();
		break;
	default:
		echo '<h1>Error 404 - Page not found </h1>';
		break;
}
