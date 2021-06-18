<?php

require_once('DBModel.php');

class NoticiaModel extends DBModel
{
    function getAll()
    {
        $query = $this->getDb()->prepare('SELECT news.title,news.details,news.author,news.id_news,categories.name_category FROM news INNER JOIN categories ON news.category_pk = categories.id_category');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function get($id)
    {
        $query = $this->getDb()->prepare('SELECT news.title,news.details,news.author,news.id_news,categories.name_category FROM news INNER JOIN categories ON news.category_pk = categories.id_category WHERE id_news = ?');
        $query->execute(array(($id)));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function new($title, $details, $categoryID, $author)
    {
        $query = $this->getDb()->prepare('INSERT INTO news (title,details,category_pk,author,seen)VALUES (?,?,?,?,false)');
        $query->execute([$title, $details, $categoryID, $author]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function getNewsPorPagina($pagina){
        
    }

    function getNewsByCategory($id_news)
    {
        $query = $this->getDb()->prepare('SELECT news.title,news.details,news.author,news.id_news,categories.name_category FROM news INNER JOIN categories ON news.category_pk = categories.id_category WHERE category_pk=?');
        $query->execute([$id_news]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    function delete($id)
    {
        $query = $this->getDb()->prepare('DELETE FROM news WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function update($id)
    {
        $query = $this->getDb()->prepare('UPDATE news SET seen = true WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
