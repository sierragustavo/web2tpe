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
        $this->view->showAllNews($news);
    }
    public function addNews()
    {
        $title = $_POST['title'];
        $details = $_POST['details'];
        $author = $_POST['author'];
        $this->model->new($title,$details,$author);
        header("Location: " . BASE_URL . 'home');
    }
    public function deleteNews($id)
    {
        AuthHelper::checkLoggedIn();
        $this->model->delete($id);
        header("Location: ../home");
    }

    public function marcar($id)
    {
        $this->model->markSeen($id);
        header("Location: ../home");
    }
}
