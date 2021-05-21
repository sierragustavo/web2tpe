<?php

include_once './views/UserView.php';
include_once './models/UserModel.php';

class UserController
{
    private $view;
    private $model;

    function __construct()
    {
        $this->model = new UserModel();
        $this->view = new UserView();
    }

    public function verifyUser()
    {
        if (!empty($_POST['username']) && !empty($_POST['password'])) {
            $username = $_POST['username'];
            $password = $_POST['password'];
            $userCheck = $this->model->obtenerUserByUsername($username);
            if (!empty($userCheck) && password_verify($password, $userCheck->password)) {
                AuthHelper::login($userCheck);
                header('Location: ' . BASE_URL . "home");
            } else {
                $this->view->renderLogin("Password o usuario incorrecto");
                die();
            }
        }
        $this->view->renderLogin("Login incompleto");
    }

    function login()
    {
        $this->view->renderLogin();
    }

    function logout(){
        AuthHelper::logout();
        header("Location: " . BASE_URL . 'home');
    }

    function register()
    {
        $this->view->renderRegister();
    }

    function registrarUsuario()
    {
        $user = $_POST['username'];
        $pass = $_POST['password'];
        $email = $_POST['email'];
        $this->model->add($user, $pass, $email);
        header("Location: " . BASE_URL . 'login');
    }
}
