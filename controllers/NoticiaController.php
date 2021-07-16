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
        if (isset($_GET['autor'])) {
            $authorFilter = $_GET['autor'];
        } else
            $authorFilter = '';
        if (isset($_GET['pagina']))
            $paginaActual = $_GET['pagina'];
        else
            $paginaActual = 1;
        if (isset($_GET['categoria'])) {
            $id_category = $_GET['categoria'];
            if ($authorFilter == '')
                $news = $this->modelNoticia->getNewsByCategory($id_category);
            elseif (($authorFilter != '') && ($id_category != 'all'))
                $news = $this->modelNoticia->getNewsByCategoryAndAuthor($id_category, $authorFilter);
            elseif (($authorFilter != '') && ($id_category == 'all'))
                $news = $this->modelNoticia->getNewsByAuthor($authorFilter);
            $filtrando = true;
        } else {
            $news = $this->modelNoticia->getAll();
            $filtrando = false;
            $id_category = 0; //para que funcione
        }
        $newsAlt = $news;
        $news = array_splice($newsAlt, ($paginaActual - 1) * LIMITE_PAGINADOR, LIMITE_PAGINADOR);
        $cantidadPaginas = count($newsAlt) / LIMITE_PAGINADOR;
        $this->view->showAllNews($news, $categories, $paginaActual, $cantidadPaginas, $filtrando, $id_category, $authorFilter);
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
        if (isset($_FILES['imagen']) && ($_FILES['imagen']['size'] > 1) && AuthHelper::getUserStatus()) {
            $nameImage = $_FILES['imagen']['name'];
            $tempImagePath = $_FILES['imagen']['tmp_name'];
            $ext = pathinfo($nameImage, PATHINFO_EXTENSION);
            $hashed = md5(time() . $nameImage) . '.' . $ext;
            $path = 'img/';
            $destino = $path . $hashed;
            move_uploaded_file($tempImagePath, $destino);
        } else
            $destino = '';
        $this->modelNoticia->new($title, $details, $categoryID, $author, $destino);
        header("Location:" . BASE_URL . 'home');
    }

    public function deleteNews($id)
    {
        if (AuthHelper::checkLoggedIn())
            $this->modelNoticia->delete($id);
        header("Location:" . BASE_URL . 'home');
    }

    public function addCategory()
    {
        AuthHelper::getUserStatus();
        $name_category = $_POST['name_category'];
        $this->modelCategory->newCategory($name_category);
        header("Location:" . BASE_URL . 'manager_categories');
    }

    public function deleteCategory($id)
    {
        if (AuthHelper::checkLoggedIn())
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

    public function updateNews()
    {
        AuthHelper::checkLoggedIn();
        $title = $_POST['title'];
        $details = $_POST['details'];
        $categoryID = $_POST['category'];
        $id_news = $_POST['id_news'];
        if (isset($_FILES['imagen']) && ($_FILES['imagen']['size'] > 1) && AuthHelper::getUserStatus()) {
            $nameImage = $_FILES['imagen']['name'];
            $tempImagePath = $_FILES['imagen']['tmp_name'];
            $ext = pathinfo($nameImage, PATHINFO_EXTENSION);
            $hashed = md5(time() . $nameImage) . '.' . $ext;
            $path = 'img/';
            $destino = $path . $hashed;
            move_uploaded_file($tempImagePath, $destino);
        } else
            $destino = '';

        $this->modelNoticia->updateNews($id_news, $title, $details, $categoryID, $destino);
        header("Location:" . BASE_URL . 'home');
    }

    public function detalleNoticia($id)
    {
        $query = $this->modelNoticia->get($id);
        $comentarios = $this->modelComment->getAllComments($id);
        $this->view->renderDetails($query, $comentarios);
    }
}
