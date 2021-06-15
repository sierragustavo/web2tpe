<?php
require_once('DBModel.php');


class CategoryModel extends DBModel

{
    function newCategory($name)
    {
        $query = $this->getDb()->prepare('INSERT INTO categories(name_category) VALUES (?)');
        $query->execute([$name]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function deleteCategory($id)
    {
        $query = $this->getDb()->prepare('DELETE FROM categories WHERE id_category= ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    } //ACA QUIERO SABER COMO DEVOLVER ALGO SI FUNCIONO O NO LA QUERY

    function getCategories()
    {
        $query = $this->getDb()->prepare('SELECT * FROM categories');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
