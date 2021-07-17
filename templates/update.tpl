{include 'templates/header.tpl'}

<h1 class="contact-us">Modificar<span class="us-color"> Noticia</span></h1>

<div class="update-form">
    <form action="{$base_url}updateform" method="POST" enctype="multipart/form-data">
        <input hidden value="{$new->id_news}" name="id_news" id="id_news">
        <label for="title">Titulo</label>
        <input type="text" name="title" id="title" placeholder="{$new->title}">
        <br>
        <label for="category">Categoría</label>
        <select name="category" id="category" class="category-select">
            {foreach from=$categories item=category}
                <option value={$category->id_category} {if ($category->name_category) == ($new->name_category)} selected {/if}>
                    {$category->name_category}</option>
            {/foreach}
        </select>
        <div class="details-box">
            <label for="details">Detalles</label>
            <textarea type="text" name="details" id="details" rows="10" cols="50"
                placeholder="{$new->details}"></textarea>
        </div>
        <br>
        {if $is_admin == 1}
            <div class="upload-box">
                <label for="imagen">Subir una imagen</label>
                <input type="file" name="imagen" id="imagen" accept=".jpg,.png,.jpeg,.gif">
            </div>
        {else}
            <a>Necesita ser administrador del sitio para subir una foto</a>
        {/if}
        <button type="submit">Enviar</button>

    </form>
</div>


{include 'templates/footer.tpl'}