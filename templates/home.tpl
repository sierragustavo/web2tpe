{include 'templates/header.tpl'}

<div>
    <form action="filtrar" method="POST">
        <label for="input-filtrar">Categoria:</label>
        <select name="inputFiltrar" id="input-filtrar">
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

{include 'templates/paginador.tpl'}

{include 'templates/footer.tpl'}