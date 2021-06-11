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
<ul>

    <form action="filtrar" method="POST">
        <label>Categoria:</label>
        <select name="inputFiltrar">
            {foreach from=$categories item=category}
                <option value={$category->id_category}>{$category->name_category}</option>
            {/foreach}
        </select>
        <button type="submit">FILTRAR</button>
    </form>
    <div class="noticia-container">
        {foreach from=$news item=noticias}
            <div>
                <li>
                    <h2>Titulo: {$noticias->title}</h2>
                </li>
                Autor: {$noticias->author}
                <br>
                Detalles: {$noticias->details}
                <br>
                Categoria: {$noticias->name_category}
                <br>
                {if ($noticias->author)=={$username}}
                    <small><a href="update/{$noticias->id_news}"> Cambiar </a></small>
                    <br>
                    <small><a href="delete/{$noticias->id_news}"> Delete </a></small>
                    <br>
                {/if}
            </div>
        {/foreach}
    </div>


</ul>

{include 'templates/footer.tpl'}