<?php

include_once './views/View.php';

class Controller
{
    private $view;

    function __construct()
    {
        $this->view = new View();
    }

    function home()
    {
        $this->view->renderHome();
    }
    function contact()
    {
        $this->view->renderContact();
    }
    function dpsTierList()
    {
        $this->view->renderdpsTierList();
    }

}
