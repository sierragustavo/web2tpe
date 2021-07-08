{include 'templates/header.tpl'}

<div class="header-box">
    <img class="logo" src="{$base_url}img/logo.png">
    <h1>THE INNKEEPER</h1>
</div>

<div>
    <form method="GET">
        <label for="input-filtrar">Categoria:</label>
        <select name="filtrar" id="input-filtrar" class="category-select">
            {foreach from=$categories item=category}
                <option {if $filtrando==true} {if $category->id_category == {$id_category}} selected {/if} {/if}
                    value={$category->id_category}>{$category->name_category}</option>
            {/foreach}
        </select>
        <button type="submit">FILTRAR</button>
    </form>
</div>


<div class="noticia-container">
    <ul>
        {foreach from=$news item=noticia}
            <li>
                <h3>Titulo: {$noticia->title}</h3>
                Autor: {$noticia->author}
                <br>
                Categoria: {$noticia->name_category}
                <br>
                Valoración: <progress max="5" value="{$noticia->promedioscore}"></progress>
                <br>
                <small><a href="{$base_url}details/{$noticia->id_news}"> Detalles </a></small>
                <br>
                {if ($noticia->author)=={$username}}
                    <small><a href="{$base_url}update/{$noticia->id_news}"> Cambiar </a></small>
                    <br>
                    <small><a href="{$base_url}delete/{$noticia->id_news}"> Delete </a></small>
                    <br>
                {/if}
            </li>
        {/foreach}
    </ul>
</div>

{include 'templates/paginador.tpl'}

{include 'templates/footer.tpl'}