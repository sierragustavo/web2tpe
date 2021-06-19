{include 'templates/header.tpl'}

<div>
    <form method="GET">
        <label for="input-filtrar">Categoria:</label>
        <select name="filtrar" id="input-filtrar" class="category-select">
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
                <small><a href="{$base_url}details/{$noticias->id_news}"> Detalles </a></small>
                <br>
                {if ($noticias->author)=={$username}}
                    <small><a href="{$base_url}update/{$noticias->id_news}"> Cambiar </a></small>
                    <br>
                    <small><a href="{$base_url}delete/{$noticias->id_news}"> Delete </a></small>
                    <br>
                {/if}
            </li>
        {/foreach}
    </ul>
</div>

{include 'templates/paginador.tpl'}

{include 'templates/footer.tpl'}