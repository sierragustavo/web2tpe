<?php

require_once('View.php');

class UserView extends View
{

    public function __construct()
    {
        parent::__construct();
        $username = parent::getUsername();
        $this->getSmarty()->assign('username', $username);
    }

    public function renderLoginConParametro($mensaje)
    {
        $this->getSmarty()->assign('mensaje', $mensaje);
        $this->getSmarty()->display('templates/login.tpl');
    }

    public function renderLogin($mensaje = null)
    {
        $this->getSmarty()->assign('mensaje', $mensaje);
        $this->getSmarty()->display('templates/login.tpl');
    }

    public function renderRegister()
    {
        $this->getSmarty()->display('templates/register.tpl');
    }
}
