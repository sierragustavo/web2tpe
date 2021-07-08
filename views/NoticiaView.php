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

    function showAllNews($news, $categories, $paginaActual, $cantidadPaginas, $filtrando, $id_category = null)
    {
        $this->getSmarty()->assign('news', $news);
        $this->getSmarty()->assign('categories', $categories);
        $this->getSmarty()->assign('paginaActual', $paginaActual);
        $this->getSmarty()->assign('cantidadPaginas', $cantidadPaginas);
        $this->getSmarty()->assign('filtrando', $filtrando); //si tiene el parametro ?filtro, viene true
        $this->getSmarty()->assign('id_category', $id_category); //si tiene el parametro ?filtro, viene true
        $this->getSmarty()->display('templates/home.tpl'); // muestro el template   
    }

    function showAllCategories($categories, $mensaje = null)
    {
        $this->getSmarty()->assign('mensaje', $mensaje);
        $this->getSmarty()->assign('categories', $categories);
        $this->getSmarty()->display('templates/manager_categories.tpl');
    }

    function renderUpdate($new, $categories)
    {
        $this->getSmarty()->assign('new', $new);
        $this->getSmarty()->assign('categories', $categories);
        $this->getSmarty()->display('templates/update.tpl');
    }
    function renderDetails($new,$comments)
    {
        $this->getSmarty()->assign('new', $new);
        $this->getSmarty()->assign('comments',$comments);
        $this->getSmarty()->display('templates/details.tpl');
    }
    function renderFormnews($categories)
    {
        $this->getSmarty()->assign('categories', $categories);
        $this->getSmarty()->display('templates/formnews.tpl');
    }
}
