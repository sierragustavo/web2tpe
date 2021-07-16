{include 'templates/header.tpl'}



{if isset($username) && $username}
    <h1 class="contact-us">Agregar<span class="us-color"> Noticia</span></h1>
    <div class="add-form">
        <form action="new" method="POST" enctype="multipart/form-data">
            <label for="title">Titulo</label>
            <input type="text" name="title" id="title">
            <label for="category">Categoría</label>
            <select name="category" id="category" class="category-select">
                {foreach from=$categories item=category}
                    <option value={$category->id_category}>{$category->name_category}</option>
                {/foreach}
            </select>
            <label for="details">Detalles</label>
            <textarea type="text" name="details" id="details" rows="10" cols="50"></textarea>
            <label for="imagen">Subir una imagen</label>
            <input type="file" name="imagen" id="imagen" accept=".jpg,.png,.jpeg,.gif">
            <button type="submit">Enviar</button>
        </form>
    </div>
{else}
    <h1> Necesita estar logeado para ver este contenido</h1>
{/if}


{include 'templates/footer.tpl'}