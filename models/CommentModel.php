<?php

require_once('DBModel.php');

class CommentModel extends DBModel
{

    public function newComment($id, $author, $comment, $score)
    {
        $query = $this->getDb()->prepare('INSERT INTO comments (id_new_fk, author, comment, score) VALUES (?,?,?,?)');
        $query->execute([$id, $author, $comment, $score]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function deleteComment($id)
    {
        $query = $this->getDb()->prepare('DELETE from comments WHERE id_comment=?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function getAllComments($id){
        $query = $this->getDb()->prepare('SELECT * from comments WHERE id_new_fk=?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getPromedioScores($id)
    {
        /* esto fue hasta que descubrí AVG() en sql
        $suma = 0;
        $cantidad = 0;
        $query = $this->getDb()->prepare('SELECT score from comments WHERE id_new_fk=?');
        $query->execute([$id]);
        $arrayScores = $query->fetchAll(PDO::FETCH_OBJ);
        foreach ($arrayScores as $score) {
            $suma += $score;
            $cantidad++;
        }
        if ($cantidad != 0) {
            $promedio = $suma / $cantidad;
            return $promedio;
        } else
            return 0;
            */
        
    }
}
