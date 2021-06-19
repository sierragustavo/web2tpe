{include 'templates/header.tpl'}


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
                <h2>{$noticias->title}</h2>
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
            </div>
        {/foreach}
    </div>


</ul>

{include 'templates/footer.tpl'}