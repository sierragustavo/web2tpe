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

    public function addNews() //FORM CATEGORIAS
    {
        $title = $_POST['title'];
        $details = $_POST['details'];
        $author = AuthHelper::getLoggedUserName();
        $categoryID = $_POST['category'];
        $this->model->new($title, $details, $categoryID, $author);
        $this->view->renderHome();
    }
    public function deleteNews($id)  //DELETE
    {
        AuthHelper::checkLoggedIn();
        $this->model->delete($id);
        $this->view->renderHome();
    }

    public function addCategory() //ADD
    {
        $name = $_POST['name'];
        $this->model->newCategory($name);
        header("Location:" . BASE_URL . 'manager_categories');
    }

    public function deleteCategory($id)
    {
        AuthHelper::checkLoggedIn();
        $this->model->deleteCategory($id);
        header("Location:" . BASE_URL . 'manager_categories');
    }

    public function marcar($id)
    {
        $this->model->markSeen($id);
        header("Location: ../home");
    }
}
