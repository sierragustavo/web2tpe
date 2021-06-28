{include 'templates/header.tpl'}

{if isset($username) && $username}
    <form action="newCategory" method="POST">
        <label>Categoria</label>
        <input type="text" name="name_category">
        <button type="submit">Enviar</button>
    </form>
{/if}

{foreach from=$categories item=category}
<a>{$category->name_category}
<small><a href="{$base_url}deleteCategory/{$category->id_category}"> Delete </a></small>
<br>
{/foreach}

<a>{$mensaje}</a>

{include 'templates/footer.tpl'}