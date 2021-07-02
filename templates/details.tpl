{include 'templates/header.tpl'}

<div class="news-details-box">
    <h2>{$new->title}</h2>
    <a>{$new->details}</a>
    <h3>Autor: {$new->author}</h3>
    <h3>Categoria: {$new->name_category}</h3>
</div>

<div class="comentary-box">
    {if isset($username) && $username}
        <form action="{$base_url}sendcomment" method="POST">
            <input hidden value="{$new->id_news}" name="id_news">
            <label for="comentary">Comente la nota</label>
            <input type="text" name="comentario" placeholder="Comente aquí">
            <br>
            <label for="score-box">Deje un puntaje</label>
            <div class="score-box">
                <input type="radio" name="score-1" value="1">
                <label for="score-1">1</label>
                <input type="radio" name="score-2" value="2">
                <label for="score-2">2</label>
                <input type="radio" name="score-3" value="3">
                <label for="score-3">3</label>
                <input type="radio" name="score-4" value="4">
                <label for="score-4">4</label>
                <input type="radio" name="score-5" value="5">
                <label for="score-5">5</label>
                <button type="submit">Enviar</button>
            </div>
        </form>
    {else}
        <a>Ingrese como usuario para comentar</a>
    {/if}
</div>
<br>

{if ($new->author)==$username}
    <div class="buttons-update-delete">
        <button><a href="{$base_url}update/{$new->id_news}"> Cambiar </a></button>
        <br>
        <button><a href="{$base_url}delete/{$new->id_news}"> Delete </a></button>
    </div>
{/if}
<br>
<small><a href="#"> Volver </a></small>
</div>

{include 'templates/footer.tpl'}