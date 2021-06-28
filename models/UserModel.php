<?php

require_once('DBModel.php');

class UserModel extends DBModel
{
    function getAll()
    {
        $query = $this->getDb()->prepare('SELECT * FROM user');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getUserList()
    {
        $query = $this->getDb()->prepare('SELECT username, password, email, id_user, admin from user');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function obtenerUserByUsername($username)
    {
        $query = $this->getDb()->prepare('SELECT * FROM user WHERE username = ?');
        $query->execute([$username]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
    public function isMailInUse($email)
    {
        $query = $this->getDb()->prepare('SELECT email FROM `user`');
        $query->execute();
        $resultado = $query->fetchAll(PDO::FETCH_COLUMN);
        foreach ($resultado as $asd)
            if ($email === $asd)
                return true;
        return false;
    }

    public function deleteUser($id)
    {
        $query = $this->getDb()->prepare('DELETE FROM `user` WHERE id_user=?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function enableAdmin($id)
    {
        $query = $this->getDb()->prepare('UPDATE user SET admin = 1 WHERE id_user=?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function disableAdmin($id)
    {
        $query = $this->getDb()->prepare('UPDATE user SET admin = 0 WHERE id_user=?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }


    public function add($user, $pass, $email)
    {
        $passEnc = password_hash($pass, PASSWORD_DEFAULT);

        $query = $this->getDb()->prepare('INSERT INTO user (username, password,email) VALUES (?, ?, ?)');

        $query->execute([$user, $passEnc, $email]);
    }
}
