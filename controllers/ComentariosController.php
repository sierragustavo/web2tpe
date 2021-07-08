<?php

include_once './views/NoticiaView.php';
include_once './models/CommentModel.php';
include_once './models/NoticiaModel.php';

class ComentariosController
{
    private $modelComment;
    private $view;
    private $modelNoticia;

    function __construct()
    {
        $this->modelComment = new CommentModel;
        $this->view = new NoticiaView;
        $this->modelNoticia = new NoticiaModel;
    }
    public function newComment()
    {
        // <!-- id_new_fk, author_comment, comment, score -->

        $id_news = $_POST['id_news_fk'];
        $author = $_POST['author_comment'];
        $comment = $_POST['comment'];
        $score = $_POST['score'];
        $this->modelComment->newComment($id_news, $author, $comment, $score);
        $query = $this->modelNoticia->get($id_news);
        $comentarios = $this->modelComment->getAllComments($id_news);
        $this->view->renderDetails($query, $comentarios);
    }
    public function deleteComment($id)
    {
        $this->modelComment->deleteComment($id);
    }
}
