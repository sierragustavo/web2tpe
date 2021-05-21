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

    function showAllNews($news)
    {
        $this->getSmarty()->assign('news', $news);
        $this->getSmarty()->display('templates/home.tpl'); // muestro el template   
    }
}
