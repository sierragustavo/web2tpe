{include 'templates/header.tpl'}

<div class="header-box">
    <img class="logo" src="{$base_url}img/logo.png">
    <h1>THE INNKEEPER</h1>
</div>

<div>
    <form method="GET">
        <label for="filtrar-categoria">Categoria:</label>
        <select name="categoria" id="filtrar-categoria" class="category-select">

            <option value="all" {if $filtrando==false}selected {/if}>Todas</option>

            {foreach from=$categories item=category}
                <option {if $filtrando==true}{if $category->id_category == $id_category} selected {/if} {/if}
                    value={$category->id_category}>{$category->name_category}</option>
            {/foreach}
        </select>
        <label for="filtrar-autor">Autor:</label>
        <input type="text" name="autor">
        <button type="submit">FILTRAR</button>
    </form>
</div>


<div class="noticia-container">
    <ul>
        {if $news!=null}
            {foreach from=$news item=noticia}
                <li>
                    <h3>Titulo: {$noticia->title}</h3>
                    Autor: {$noticia->author}
                    <br>
                    Categoria: {$noticia->name_category}
                    <br>
                    {if ($noticia->promedioscore)!=null}
                        Valoración: <progress max="5" value="{$noticia->promedioscore}"></progress>
                    {else}
                        0 comentarios
                    {/if}
                    <br>
                    <small><a href="{$base_url}details/{$noticia->id_news}"> Detalles </a></small>
                    <br>
                    {if $is_admin == 1}
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
    {else}
    <a>No hay articulos!</a>
    {/if}
{include 'templates/footer.tpl'}