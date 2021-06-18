{include 'templates/header.tpl'}

{if isset($username) && $username}
    <form action="new" method="POST">
        <label>Titulo</label>
        <input type="text" name="title">
        <label>Detalles</label>
        <textarea type="text" name="details"></textarea>
        <label>Categoría</label>
        <select name="category">
            {foreach from=$categories item=category}
                <option value={$category->id_category}>{$category->name_category}</option>
            {/foreach}
        </select>
        <button type="submit">Enviar</button>
    </form>
{/if}

<div>
    <form action="filtrar" method="POST">
        <label>Categoria:</label>
        <select name="inputFiltrar">
            {foreach from=$categories item=category}
                <option value={$category->id_category}>{$category->name_category}</option>
            {/foreach}
        </select>
        <button type="submit">FILTRAR</button>
    </form>
</div>

<div class="noticia-container">
    <ul>
        {foreach from=$news item=noticias}
            <li>
                <h2>Titulo: {$noticias->title}</h2>
                Autor: {$noticias->author}
                <br>
                Categoria: {$noticias->name_category}
                <br>
                <small><a href="details/{$noticias->id_news}"> Detalles </a></small>
                <br>
                {if ($noticias->author)=={$username}}
                    <small><a href="update/{$noticias->id_news}"> Cambiar </a></small>
                    <br>
                    <small><a href="delete/{$noticias->id_news}"> Delete </a></small>
                    <br>
                {/if}
            </li>
        {/foreach}
    </ul>
</div>

<a href="home/?pagina={$paginaActual + 1}">Siguiente</a>

{for $i = 0 to $cantidadPaginas}
    <a href="home/?pagina={$i}">{$i}</a>
{/for}


{include 'templates/footer.tpl'}