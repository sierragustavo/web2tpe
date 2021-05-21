<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" main-content="width=device-width, initial-scale=1.0">
    <title>The Innkeeper</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

    <div class="topnav" id="barraNavegacion">
        <a href="home" class="innk">INNK</a>
        <a href="home" class="button-menu">HOME</a>
        <a href="dpsTierList" class="button-menu">DPS TIER LIST</a>
        <a href="contact" class="button-menu">CONTACT US</a>
        {if isset($username) && $username}
            <a class="innk">{$username}</a>
            <a class="button-menu-end" href="logout">Logout</a>
        {else}
            <a href="login" class="button-menu-end"> <div class="login">LOGIN</div></a>
        {/if}
            <a href="#" class="icon" onclick="cambioClaseNavegacion()">
            <i class="fa fa-bars"></i>
        </a>
        <script src="js/menu.js"></script>
    </div>

    <header>
        <img class="logo" src="img/logo.png">
        <div class="main-header">
            <h1>THE INNKEEPER</h1>
        </div>
    </header>
