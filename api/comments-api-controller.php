<?php
require_once 'api.view.php';
require_once './models/CommentModel.php';

class CommentsApiController extends APIView
{

    private $modelComments;
    private $view;
    private $data;

    public function __construct()
    {
        $this->modelComments = new CommentModel();
        $this->view = new APIView();
        $this->data = file_get_contents("php://input");
    }

    private function getData()
    {
        return json_decode($this->data);
    }

    public function getCommentsByNewsID($params = [])
    {
        $idNews = $params[':ID'];
        $comentarios = $this->modelComments->getAllComments($idNews);
        if ($comentarios) {
            $this->view->response($comentarios, 200);
        } else {
            $this->view->response("No se encontro el id $idNews", 400);
        }
    }
}
