<?php

include_once './models/NoticiaModel.php';
include_once './views/NoticiaView.php';
include_once './models/CategoryModel.php';
include_once './models/CommentModel.php';

define('LIMITE_PAGINADOR', 3);

class NoticiaController
{
    private $modelNoticia;
    private $modelCategory;
    private $view;
    private $modelComment;

    public function __construct()
    {
        $this->modelNoticia = new NoticiaModel();
        $this->modelCategory = new CategoryModel();
        $this->view = new NoticiaView();
        $this->modelComment = new CommentModel();
    }

    public function showNews()
    {
        $categories = $this->modelCategory->getCategories();
        if (isset($_GET['pagina']))
            $paginaActual = $_GET['pagina'];
        else
            $paginaActual = 1;
        if (isset($_GET['filtrar'])) {
            $id_category = $_GET['filtrar'];
            $news = $this->modelNoticia->getNewsByCategory($id_category);
            $filtrando = true;
        } else {
            $news = $this->modelNoticia->getAll(); //ACA SE HACE UNA ARRAY CON TODAS LAS NEWS DE LA DB
            $filtrando = false;
            $id_category = 0; //para que funcione
        }
        $newsAlt = $news;
        $news = array_splice($newsAlt, ($paginaActual - 1) * LIMITE_PAGINADOR, LIMITE_PAGINADOR);
        $cantidadPaginas = count($newsAlt) / LIMITE_PAGINADOR;
        $this->view->showAllNews($news, $categories, $paginaActual, $cantidadPaginas, $filtrando, $id_category);
    }

    public function showManage() //PAGINA CATEGORIAS
    {
        $categories = $this->modelCategory->getCategories();
        $this->view->showAllCategories($categories);
    }

    public function addNews() //FORM ADD NOTICIA
    {
        AuthHelper::checkLoggedIn();
        $title = $_POST['title'];
        $details = $_POST['details'];
        $categoryID = $_POST['category'];
        $author = AuthHelper::getLoggedUserName();
        $this->modelNoticia->new($title, $details, $categoryID, $author);
        header("Location:" . BASE_URL . 'home');
    }

    public function deleteNews($id)  //DELETE NEWS
    {
        AuthHelper::checkLoggedIn();
        $this->modelNoticia->delete($id);
        header("Location:" . BASE_URL . 'home');
    }

    public function addCategory() //ADD
    {
        AuthHelper::checkLoggedIn();
        $name_category = $_POST['name_category'];
        $this->modelCategory->newCategory($name_category);
        header("Location:" . BASE_URL . 'manager_categories');
    }

    public function deleteCategory($id) //BORRAR CATEGORIA
    {
        AuthHelper::checkLoggedIn();
        $this->modelCategory->deleteCategory($id);
        header("Location:" . BASE_URL . 'manager_categories');
    }

    public function renderUpdate($id)
    {
        AuthHelper::checkLoggedIn();
        $queryNoticia = $this->modelNoticia->get($id);
        $categories = $this->modelCategory->getCategories();
        $this->view->renderUpdate($queryNoticia, $categories);
    }

    public function renderFormNews()
    {
        $categories = $this->modelCategory->getCategories();
        $this->view->renderFormNews($categories);
    }

    public function updateNoticia($id, $title, $details, $categoryID) //ACTUALIZAR CATEGORIA
    {
        $this->modelNoticia->update($id, $title, $details, $categoryID);
        header("Location:" . BASE_URL . 'home');
    }

    public function detalleNoticia($id)
    {
        $query = $this->modelNoticia->get($id);
        $comentarios = $this->modelComment->getAllComments($id);
        $this->view->renderDetails($query,$comentarios);
    }
}
