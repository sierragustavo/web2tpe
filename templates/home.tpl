{include 'templates/header.tpl'}

<form action="new" method="POST">
    <label>Titulo</label>
    <input type="text" name="title">
    <label>Details</label>
    <textarea type="text" name="details"></textarea>
    <label>Author</label>
    <input type="text" name="author">
    <button type="submit">Enviar</button>
</form>

<ul>

    {foreach from=$news item=noticias}
        <div class="container">
        <li>
            Titulo: {$noticias->title}
        </li>
        Autor: {$noticias->author}
        Detalles: {$noticias->details}
        {if $noticias->seen==0}
            <p>
                no leido</p>
        {else}
            <p>
                leido
            </p>
        {/if}
        {$noticias->title} <small><a href="delete/{$noticias->id}"> Delete </a></small>
        {if (!$noticias->seen)}
            {$noticias->title}<small><a href="seen/{$noticias->id}"> Marcar como Vista </a></small>
        {/if}
        
        <br>
        <br>
        </div>
    {/foreach}

</ul>

{include 'templates/footer.tpl'}