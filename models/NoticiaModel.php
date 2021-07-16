<?php

require_once('DBModel.php');

class NoticiaModel extends DBModel
{
    function getAll()
    {
        $query = $this->getDb()->prepare("SELECT news.title,news.details,news.author,news.id_news,news.image,categories.name_category,AVG(comments.score) as promedioscore 
        FROM news 
        INNER JOIN categories ON news.category_pk = categories.id_category 
        LEFT JOIN comments on news.id_news = comments.id_new_fk 
        group by news.id_news");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function get($id)
    {
        $query = $this->getDb()->prepare('SELECT news.title,news.details,news.author,news.id_news,news.image,categories.name_category,AVG(comments.score) as promedioscore 
        FROM news 
        INNER JOIN categories ON news.category_pk = categories.id_category 
        LEFT JOIN comments on news.id_news = comments.id_new_fk where id_news = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function new($title, $details, $categoryID, $author, $destino)
    {
        $query = $this->getDb()->prepare('INSERT INTO news (title,details,category_pk,author,image)VALUES (?,?,?,?,?)');
        $query->execute([$title, $details, $categoryID, $author, $destino]);
        $lastId = $this->getDb()->lastInsertId();
        return $lastId;
    }

    function getNewsByCategory($id_category)
    {
        $query = $this->getDb()->prepare(
            'SELECT news.title,news.details,news.author,news.id_news,categories.name_category, avg(comments.score) as promedioscore 
            FROM news 
            INNER JOIN categories ON news.category_pk = categories.id_category 
            LEFT JOIN comments on news.id_news = comments.id_new_fk
            WHERE category_pk=? group by news.id_news'
        );
        $query->execute([$id_category]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getNewsByCategoryAndAuthor($id_category, $authorFilter)
    {
        $query = $this->getDb()->prepare(
            'SELECT news.title,news.details,news.author,news.id_news,categories.name_category, avg(comments.score) as promedioscore 
            FROM news 
            INNER JOIN categories ON news.category_pk = categories.id_category 
            LEFT JOIN comments on news.id_news = comments.id_new_fk
            WHERE category_pk=? AND news.author=? group by news.id_news'
        );
        $query->execute([$id_category, $authorFilter]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getNewsByAuthor($authorFilter)
    {
        $query = $this->getDb()->prepare(
            'SELECT news.title,news.details,news.author,news.id_news,categories.name_category, avg(comments.score) as promedioscore 
            FROM news 
            INNER JOIN categories ON news.category_pk = categories.id_category 
            LEFT JOIN comments on news.id_news = comments.id_new_fk
            WHERE news.author=? group by news.id_news'
        );
        $query->execute([$authorFilter]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    function delete($id)
    {
        $query = $this->getDb()->prepare('DELETE FROM news WHERE id_news = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function updateNews($id_news, $title, $details, $categoryID, $destino)
    {
        $query = $this->getDb()->prepare('UPDATE news SET title = ?, details = ?, category_pk = ?, image = ? WHERE id_news = ?');
        $query->execute([$title, $details, $categoryID, $destino, $id_news]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
