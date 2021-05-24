{include 'templates/header.tpl'}

<div class="registro">
    <img class="logo-registro" src="img/logo.png">
    <h2 id="title">Create Acount</h2>
    <form action="registrar" method="POST">
        <label>Username</label>
        <input type="text" placeholder="Enter Username" name="username">

        <label>Password</label>
        <input type="text" placeholder="Enter Password" name="password">

        <label>Email</label>
        <input type="text" placeholder="Your E-mail" name="email">

        <input type="submit">
    </form>
</div>

{include 'templates/footer.tpl'}