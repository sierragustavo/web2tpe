<?php

require_once('libs/smarty/libs/Smarty.class.php');
require_once('./helpers/AuthHelper.php');

class View
{
    private $smarty;
    private $authhelper;

    public function __construct()
    {
        $this->smarty = new Smarty();
        $this->smarty->assign('base_url', BASE_URL);
        $this->authhelper = new AuthHelper();
        $username = $this->authhelper->getLoggedUserName();
        $is_admin = $this->authhelper->getUserStatus();
        $this->getSmarty()->assign('username', $username);
        $this->getSmarty()->assign('is_admin', $is_admin);

    }

    public function render404(){
        $this->getSmarty()->display('templates/404.tpl');
    }

    public function getSmarty()
    {
        return $this->smarty;
    }

    public function getUsername()
    {
        $username = $this->authhelper->getLoggedUserName();
        return $username;
    }

    public function renderContact()
    {
        $this->smarty->display('templates/contact.tpl');
    }

    public function renderdpsTierList()
    {
        $this->smarty->display('templates/dpsTierList.tpl');
    }
}
