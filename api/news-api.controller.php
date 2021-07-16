<?php
require_once './models/NoticiaModel.php';
require_once './models/CategoryModel.php';
require_once 'api.view.php';

class NewsApiController
{

    private $modelNoticia;
    private $modelCategory;
    private $view;
    private $data;

    public function __construct()
    {
        $this->modelNoticia =  new NoticiaModel();
        $this->modelCategory = new CategoryModel();
        $this->view = new APIView();
        $this->data = file_get_contents("php://input");
    }

    private function getData()
    {
        return json_decode($this->data);
    }

    public function getNews($params = [])
    {
        $news = $this->modelNoticia->getAll();

        $this->view->response($news, 200);
    }

    public function getCategories()
    {
        $categories = $this->modelCategory->getCategories();
        $this->view->response($categories, 200);
    }

    public function getNewsById($params = [])
    {
        $idNews = $params[':ID'];

        $news = $this->modelNoticia->get($idNews);
        if ($news) {
            $this->view->response($news, 200);
        } else {
            $this->view->response("No se encontro el id $idNews", 400);
        }
    }


    public function addNews($params = [])
    {
        $datos = $this->getData();
        $title = $datos->title;
        $details = $datos->details;
        $id_category = $datos->id_category;
        $author = $datos->author;
        /*if (
            $_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg"
            || $_FILES['input_name']['type'] == "image/png"
        ) {
            $this->modelNoticia->new($title, $details, $id_category, $author, $_FILES['input_name']['tmp_name']);
        } else {*/
        $query = $this->modelNoticia->new($title, $details, $id_category, $author);
        //}
        $this->view->response('La noticia fue insertada con el ID: ' . $query, 200);
    }
}
