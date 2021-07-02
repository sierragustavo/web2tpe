<?php

include_once './models/NoticiaModel.php';
include_once './views/NoticiaView.php';
include_once './models/CategoryModel.php';
include_once './models/CommentModel.php';

class ComentariosController
{
    private $modelComment;
    private $modelNoticia;
    private $modelCategory;
    private $view;


    public function newComment()
    {
        // <!-- id_new_fk, author_comment, comment, score -->

        $id_news = $_POST['id_new_fk'];
        $author = $_POST['author_comment'];
        $comment = $_POST['comment'];
        $score = $_POST['score'];
        $this->modelComment->newComment($id_news, $author, $comment, $score);
        $this->view->renderDetails($id_news);
    }
}
