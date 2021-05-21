<?php

require_once('View.php');
require_once('helpers/AuthHelper.php');

class NoticiaView extends View
{
    public function __construct()
    {
        parent::__construct();
        $authHelper = new AuthHelper();
        $username = $authHelper->getLoggedUserName();
        $this->getSmarty()->assign('username', $username);
    }

    function showAllNews($news)
    {
        $this->getSmarty()->assign('news', $news);
        $this->getSmarty()->display('templates/home.tpl'); // muestro el template   
    }
}
