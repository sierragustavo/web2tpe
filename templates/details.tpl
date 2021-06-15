{include 'templates/header.tpl'}

<div>
    <h2>{$new->title}</h2>
    <a>{$new->details}


        <h3>Autor: {$new->author}</h3>
        <h3>Categoria: {$new->name_category}</h3>

        {if ($new->author)=={$username}}
            <small><a href="update/{$new->id_news}"> Cambiar </a></small>
            <br>
            <small><a href="delete/{$new->id_news}"> Delete </a></small>
        {/if}
        <br>
        <small><a href="#"> Volver </a></small>
</div>

{include 'templates/footer.tpl'}