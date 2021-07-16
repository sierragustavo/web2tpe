{include 'templates/header.tpl'}

<div class="content">
    <div class="update-form-left">
        <form action="{$base_url}updateform" method="POST" enctype="multipart/form-data">
            <input hidden value="{$new->id_news}" name="id_news" id="id_news">
            <label for="title">Titulo</label>
            <input type="text" name="title" id="title" placeholder="{$new->title}">
            <label for="details">Detalles</label>
            <textarea type="text" name="details" id="details" rows="10" cols="50"
                placeholder="{$new->details}"></textarea>
            <label>Categoría</label>
            <select name="category" id="category" class="category-select">
                {foreach from=$categories item=category}
                    <option value={$category->id_category}>{$category->name_category}</option>
                {/foreach}
            </select>
            <label for="imagen">Subir una imagen</label>
            <input type="file" name="imagen" id="imagen" accept=".jpg,.png,.jpeg,.gif">
            <button type="submit">Enviar</button>
        </form>
    </div>
    {include 'templates/footer.tpl'}