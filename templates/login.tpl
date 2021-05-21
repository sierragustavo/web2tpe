{include 'templates/header.tpl'}

<div class="logincaja">
    <img class="logo-login" src="img/logo.png">
    <h2 id="title">Login</h2>
    <form action="verifyUser" method="POST">
        <label for="username">Username</label>
        <input type="text" placeholder="Enter Username" name="username">

        <label for="Password">Password</label>
        <input type="text" placeholder="Enter Password" name='password'>

        <input type="submit" value="Log In">

        <a href="register">You dont acount?</a>
    </form>
</div>

{include 'templates/footer.tpl'}