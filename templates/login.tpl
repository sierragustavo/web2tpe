{include 'templates/header.tpl'}

<div class="logincaja">
    <img class="logo-login" src="img/logo.png">
    <h2 id="title">Login</h2>
    <form action="verifyUser" method="POST">
        <label for="username">Username</label>
        <input type="text" placeholder="Enter Username" name="username">

        <label for="Password">Password</label>
        <input type="password" placeholder="Enter Password" name='password'>

        <input type="submit" value="Log In">
    </form>
    <a href="{$base_url}register">Create your account</a>
</div>
<a>{$mensaje}</a>
{include 'templates/footer.tpl'}