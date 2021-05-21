<?php

require_once('DBModel.php');

class NoticiaModel extends DBModel
{
    function getAll()
    {
        $query = $this->getDb()->prepare('SELECT * FROM news');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function get($id)
    {
        $query = $this->getDb()->prepare('SELECT * FROM news WHERE id = ?');
        $query->execute(array(($id)));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function new()
    {
        $title = $_POST['title'];
        $details = $_POST['details'];
        $author = $_POST['author'];

        $query = $this->getDb()->prepare('INSERT INTO news (title,details,author,seen)VALUES (?,?,?,false)');
        $query->execute([$title, $details, $author]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function delete($id)
    {
        $query = $this->getDb()->prepare('DELETE FROM news WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function markSeen($id)
    {
        $query = $this->getDb()->prepare('UPDATE news SET seen = true WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
