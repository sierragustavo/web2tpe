{include 'templates/header.tpl'}

{if isset($username) && $username}
    <form action="new" method="POST">
        <label>Titulo</label>
        <input type="text" name="title">
        <label>Details</label>
        <textarea type="text" name="details"></textarea>
        <label>Categoría</label>
        <select name="category">
            {foreach from=$categories item=category}
                <option value={$category->id}>{$category->name}</option>
            {/foreach}
        </select>
        <button type="submit">Enviar</button>
    </form>
{/if}
<ul>

    <form action="filtrar" method="POST">
        <select name="inputFiltrar">
            {foreach from=$categories item=category}
                <option value={$category->id}>{$category->name}</option>
            {/foreach}
        </select>
        <button type="submit">FILTRAR</button>
    </form>

    {foreach from=$news item=noticias}
        <div class="container">
            <li>
                <h2>Titulo: {$noticias->title}</h2>
            </li>
            Autor: {$noticias->author}
            <br>
            Detalles: {$noticias->details}
            <br>
            {foreach from=$categories item=catego}
                {if ({$noticias->category_pk}=={$catego->id})}
                    Categoria: {$catego->name}
                {/if}
            {/foreach}
            {if $noticias->seen==0}
                <p>
                    no leido</p>
            {else}
                <p>
                    leido
                </p>
            {/if}
            {if (!$noticias->seen)}
                <small><a href="seen/{$noticias->id}"> Marcar como Vista </a></small>
            {/if}
            {if isset($username) && $username}
                <small><a href="delete/{$noticias->id}"> Delete </a></small>
                <br>
            {/if}
        </div>
    {/foreach}

</ul>

{include 'templates/footer.tpl'}