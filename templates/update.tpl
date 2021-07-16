{include 'templates/header.tpl'}

<div class="content">
    <div class="update-form-left">
        <form action="updateForm" method="POST" enctype="multipart/form-data">
            <input hidden value="{$new->id_news}" name="id_news" id="id_news">
            <label>Titulo</label>
            <input type="text" name="title" value="{$new->title}">
            <label>Detalles</label>
            <textarea class="message-form" name="details" placeholder="{$new->details}" rows="10" cols="50"></textarea>
            <label>Categoría</label>
            <select name="category">
                {foreach from=$categories item=category}
                    <option value={$category->id_category}>{$category->name_category}</option>
                {/foreach}
            </select>
            <button type="submit">Enviar</button>
            <label for="imagen">Subir imagen</label>
            <input type="file" name="imagen" id="imagen">
            <button type="submit">Cargar</button>
        </form>
    </div>
    {include 'templates/footer.tpl'}