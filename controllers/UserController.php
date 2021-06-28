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
                header("Location:" . BASE_URL . 'home');
            } else {
                $this->view->renderLogin("Password o usuario incorrecto");
                die();
            }
        } else {
            $this->view->renderLogin("Login incompleto");
        }
    }

    function login()
    {
        $this->view->renderLogin();
    }

    function logout()
    {
        AuthHelper::logout();
        header("Location:" . BASE_URL . 'home');
    }

    function register()
    {
        $this->view->renderRegister();
    }

    public function showUserList()
    {
        $userList = $this->model->getUserList();
        $this->view->renderUserList($userList);
    }

    function registrarUsuario()
    {
        $user = $_POST['username'];
        $pass = $_POST['password'];
        $pass2 = $_POST['password2'];
        $email = $_POST['email'];
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $this->view->renderRegister("Ingrese un mail correctamente");
            die();
        }
        if (!($pass === $pass2)) {
            $this->view->renderRegister("Las contraseñas ingresadas no son iguales");
            die();
        }
        if ($this->model->isMailInUse($email)) {
            $this->view->renderRegister("Mail en uso");
            die();
        }
        $this->model->add($user, $pass, $email);
        $this->view->renderLogin("Mail registrado correctamente");
    }
}
