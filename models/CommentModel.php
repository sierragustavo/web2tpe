<?php

require_once('DBModel.php');

class CommentModel extends DBModel
{

    public function newComment($id, $author, $comment, $score)
    {
        $query = $this->getDb()->prepare('INSERT INTO comments (id_new_fk, author, comment, score) VALUES (?,?,?,?)');
        $query->execute([$id, $author, $comment, $score]);
        $lastId = $this->getDb()->lastInsertId();
        return $lastId;
    }

    public function deleteComment($id)
    {
        $query = $this->getDb()->prepare('DELETE from comments WHERE id_comment=?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function getAllComments($id)
    {
        $query = $this->getDb()->prepare('SELECT author,comment,score,id_comment from comments WHERE id_new_fk=?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
