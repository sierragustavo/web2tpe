<?php

require_once('View.php');


class NoticiaView extends View
{
    public function __construct()
    {
        parent::__construct();
        $username = parent::getUsername();
        $this->getSmarty()->assign('username', $username);
    }

    function showAllNews($news, $categories)
    {
        $this->getSmarty()->assign('news', $news);
        $this->getSmarty()->assign('categories', $categories);
        $this->getSmarty()->display('templates/home.tpl'); // muestro el template   
    }

    function showAllCategories($categories, $mensaje = null)
    {
        $this->getSmarty()->assign('mensaje', $mensaje);
        $this->getSmarty()->assign('categories', $categories);
        $this->getSmarty()->display('templates/manager.tpl');
    }

    function renderUpdate($new,$categories)
    {
        $this->getSmarty()->assign('new', $new);
        $this->getSmarty()->assign('categories', $categories);
        $this->getSmarty()->display('templates/update.tpl');
    }
}
