<div class="topnav" id="barraNavegacion">
<a href="{$base_url}home" class="innk">INNK</a>
<a href="{$base_url}home" class="button-menu">HOME</a>
<a href="{$base_url}dpsTierList" class="button-menu">DPS TIER LIST</a>
<a href="{$base_url}contact" class="button-menu">CONTACT US</a>
{if isset($username) && $username}
    <a href="{$base_url}manager_categories" class="button-menu">CATEGORIES</a>
    <a class="button-menu-end" href="{$base_url}logout">LOGOUT</a>
    <a class="innk">{$username}</a>
{else}
    <a href="{$base_url}login" class="button-menu-end">
        <div class="login">LOGIN</div>
    </a>
{/if}
<a href="#" class="icon" onclick="cambioClaseNavegacion()">
    <i class="fa fa-bars"></i>
</a>
<script src="{$base_url}js/menu.js"></script>
</div>
<div class="header-box">
<img class="logo" src="{$base_url}img/logo.png">
<h1>THE INNKEEPER</h1>
</div>