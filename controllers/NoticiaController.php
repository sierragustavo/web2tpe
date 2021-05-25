<?php

include_once 'models/NoticiaModel.php';
include_once 'views/NoticiaView.php';

class NoticiaController
{
    private $model;
    private $view;
    public function __construct()
    {
        $this->model = new NoticiaModel();
        $this->view = new NoticiaView();
    }

    public function showNews()
    {
        $news = $this->model->getAll(); //ACA SE HACE UNA ARRAY CON TODAS LAS NEWS DE LA DB
        $categories = $this->model->getCategories();
        $this->view->showAllNews($news, $categories);
    }

    public function showManage() //PAGINA CATEGORIAS
    {
        $categories = $this->model->getCategories();
        $this->view->showAllCategories($categories);
    }

    public function addNews() //FORM ADD NOTICIA
    {
        AuthHelper::checkLoggedIn();
        $title = $_POST['title'];
        $details = $_POST['details'];
        $categoryID = $_POST['category'];
        $author = AuthHelper::getLoggedUserName();
        $this->model->new($title, $details, $categoryID, $author);
        $this->view->renderHome();
    }
    public function deleteNews($id)  //DELETE NEWS
    {
        AuthHelper::checkLoggedIn();
        $this->model->delete($id);
        $this->view->renderHome();
    }

    public function addCategory() //ADD
    {
        AuthHelper::checkLoggedIn();
        $name = $_POST['name'];
        $this->model->newCategory($name);
        header("Location:" . BASE_URL . 'manager_categories');
    }

    public function deleteCategory($id) //BORRAR CATEGORIA
    {
        AuthHelper::checkLoggedIn();
        $this->model->deleteCategory($id);
        header("Location:" . BASE_URL . 'manager_categories');
    }

    public function marcar($id) //ACTUALIZAR CATEGORIA
    {
        $this->model->markSeen($id);
        header("Location: ../home");
    }
}
