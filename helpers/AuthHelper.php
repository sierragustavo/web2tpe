<?php

class AuthHelper

{
    public function __construct()
    {
    }

    static private function start()
    {
        if (session_status() != PHP_SESSION_ACTIVE)
            session_start();
    }

    static public function login($user)
    {
        self::start();
        $_SESSION['IS_LOGGED'] = true;
        $_SESSION['ID_USER'] = $user->id_user;
        $_SESSION['USERNAME'] = $user->username;
        if ($user->admin == 1)
            $_SESSION['IS_ADMIN'] = true;
        else
            $_SESSION['IS_ADMIN'] = false;
    }

    static public function getUserStatus(){
        self::start();
        if (isset($_SESSION['IS_ADMIN']) && $_SESSION['IS_ADMIN'] == true) {
            return true;
        } else {
            return false;
        }
    }

    public static function logout()
    {
        self::start();
        session_destroy();
    }

    public static function checkLoggedIn()
    {
        self::start();
        if (!isset($_SESSION['ID_USER'])) {
            header('Location: ' . BASE_URL . "home");
            die();
        }
        return true;
    }

    public static function getLoggedUserName()
    {
        self::start();
        if (isset($_SESSION['USERNAME'])) {
            return $_SESSION['USERNAME'];
        } else {
            return false;
        }
    }
}
