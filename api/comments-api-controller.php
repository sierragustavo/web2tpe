<?php
require_once 'api.view.php';
require_once './models/CommentModel.php';

class CommentsApiController
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
        $this->view->response($comentarios, 200);
    }

    public function deleteCommentByID($params = [])
    {
        $idComment = $params[':ID'];
        $query = $this->modelComments->deleteComment($idComment);
        $this->view->response($query, 200);
    }

    public function addComment($params = [])
    {
        $body = $this->getData();
        $comentario = $this->modelComments->newComment($body->id_new_fk, $body->author, $body->comment, $body->score);
        if (!empty($comentario))
            $this->view->response($comentario, 200);
        else
            $this->view->response("El comentario no se pudo agregar", 404);
    }
}
