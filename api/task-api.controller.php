<?php
require_once './models/NoticiaModel.php';
require_once './models/CategoryModel.php';
require_once './api/api.view.php';

class TaskApiController
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
        // obtengo las tareas
        $news = $this->modelNoticia->getAll();

        // se las paso a la vista para que responda JSON
        $this->view->response($news, 200);
    }

    public function getCategories($params = [])
    {
        $categories = $this->modelCategory->getCategories();
        $this->view->response($categories, 200);
    }

    public function getNew($params = [])
    {
        // obtengo las tareas
        $idNew = $params[':ID'];

        $new = $this->modelNoticia->get($idNew);

        if ($new) {
            $this->view->response($new, 200);
        } else {
            $this->view->response("No se encontro el id $idNew", 400);
        }
        // se las paso a la vista para que responda JSON

    }

    public function addNew($params = [])
    {

        $datos = $this->getData();

        $title = $datos->title;
        $details = $datos->details;
        $id_category = $datos->id_category;
        $author = $datos->author;
        if (
            $_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg"
            || $_FILES['input_name']['type'] == "image/png"
        ) {
            $this->modelNoticia->new($title, $details, $id_category, $author, $_FILES['input_name']['tmp_name']);
        } else {
            $this->modelNoticia->new($title, $details, $id_category, $author);
        }
        $this->view->response('', 200);
    }
}
