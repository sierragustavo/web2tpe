{include 'templates/header.tpl'}

<div class="news-details-box">
    <h2>{$new->title}</h2>
    <a>{$new->details}</a>
    <h3>Autor: {$new->author}</h3>
    <h3>Categoria: {$new->name_category}</h3>
</div>


<div class="comments-box">
    {if ($new->promedioscore)!=null}
        {include file="vue/comments.vue"}
    {else}
        <h3>Esta noticia no tiene comentarios, Soyez le premier!</h3>
    {/if}
</div>
<br>
<div class="add-commentary-box">
    {if isset($username) && $username}
        <input hidden value="{$new->id_news}" name="id_news_fk" id="id_news_fk">
        <input hidden value="{$username}" name="author" id="author">
        <label for="comment">Comente la nota</label>
        <input type="text" name="comment" id="comment" placeholder="Comente aquí">
        <br>
        <label for="score-box">Deje un puntaje</label>
        <div class="score-box" name="score">
            <input type="radio" name="score" value="1" id="score1">
            <label for="score-1">1</label>
            <input type="radio" name="score" value="2" id="score2">
            <label for="score-2">2</label>
            <input type="radio" name="score" value="3" id="score3">
            <label for="score-3">3</label>
            <input type="radio" name="score" value="4" id="score4">
            <label for="score-4">4</label>
            <input type="radio" name="score" value="5" id="score5">
            <label for="score-5">5</label>
        </div>
        <button id="botonComentario">Enviar</button>

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
<script src="{$base_url}js/api-vue.js"></script>
{include 'templates/footer.tpl'}