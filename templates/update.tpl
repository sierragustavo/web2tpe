{include 'templates/header.tpl'}

<div>
<form action="updateForm" method="POST">
<label>Titulo</label>
<input type="text" name="title" placeholder={$new->title}>
<label>Detalles</label>
<textarea name="details" placeholder={$new->details}></textarea>
<label>Categoría</label>
<select name="category">
{foreach from=$categories item=category}
    <option value={$category->id_category}>{$category->name_category}</option>
{/foreach}
</select>
<button type="submit">Enviar</button>
</form>
</div>

{include 'templates/footer.tpl'}
