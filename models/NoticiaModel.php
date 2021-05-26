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

    function new($title, $details, $categoryID, $author)
    {
        $query = $this->getDb()->prepare('INSERT INTO news (title,details,category_pk,author,seen)VALUES (?,?,?,?,false)');
        $query->execute([$title, $details, $categoryID, $author]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function newCategory($name)
    {
        $query = $this->getDb()->prepare('INSERT INTO categories (name)VALUES (?)');
        $query->execute([$name]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function deleteCategory($id)
    {
        $query = $this->getDb()->prepare('DELETE FROM categories WHERE id= ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ); //ACA QUIERO SABER COMO DEVOLVER ALGO SI FUNCIONO O NO LA QUERY
    }

    function getCategories()
    {
        $query = $this->getDb()->prepare('SELECT * FROM categories');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getNewsByCategory($id_news)
    {
        $query = $this->getDb()->prepare('SELECT * FROM news WHERE category_pk=?');
        $query->execute([$id_news]);
        return $query->fetchAll(PDO::FETCH_OBJ);
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
