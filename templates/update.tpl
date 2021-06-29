{include 'templates/header.tpl'}

<div class="content">
    <div class="update-form-left">
        <form action="updateForm" method="POST">
            <label>Titulo</label>
            <input type="text" name="title" placeholder="{$new->title}">
            <label>Detalles</label>
            <textarea class="message-form" name="details" placeholder="{$new->details}"></textarea>
            <label>Categoría</label>
            <select name="category">
                {foreach from=$categories item=category}
                    <option value={$category->id_category}>{$category->name_category}</option>
                {/foreach}
            </select>
            <button type="submit">Enviar</button>
        </form>
    </div>
    <div class="update-form-right">
        <form action="addimage" method="POST">

            <label for="imageUpload">Subir imagen</label>
            <input type="file" name="image_name" id="imageUpload" accept=".jpg,.png,.jpeg">
            <small>solo jpg, jpeg o png</small>
            <button type="submit">Cargar</button> 
        </form>
    </div>
</div>
{include 'templates/footer.tpl'}