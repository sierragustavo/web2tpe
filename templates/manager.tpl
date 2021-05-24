{include 'templates/header.tpl'}

{if isset($username) && $username}
    <form action="newCategory" method="POST">
        <label>Categoria</label>
        <input type="text" name="name">
        <button type="submit">Enviar</button>
    </form>
{/if}

{foreach from=$categories item=category}
<a>{$category->name}
<small><a href="deleteCategory/{$category->id}"> Delete </a></small>
<br>
{{/foreach}}

<a>{$mensaje}</a>

{include 'templates/footer.tpl'}