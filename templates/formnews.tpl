{include 'templates/header.tpl'}



{if isset($username) && $username}
    <div class="contact-form">
        <form action="new" method="POST">
            <div class="contact-form-right">
                <label for="title">Titulo</label>
                <input type="text" name="title" id="title">
                <label for="category">Categoría</label>
                <select name="category" id="category">
                    {foreach from=$categories item=category}
                        <option value={$category->id_category}>{$category->name_category}</option>
                    {/foreach}
                </select>
                <label for="imageUpload">Subir imagen</label>
                <input type="file" name="image_name" id="imageUpload" accept=".jpg,.png,.jpeg">
                <small>solo jpg, jpeg o png</small>
            </div>
            <div class="contaft-form-left">
                <label for="details">Detalles</label>
                <textarea type="text" name="details" id="details"></textarea>
                <button type="submit">Enviar</button>
            </div>
        </form>
    </div>
{else}
    <h1> Necesita estar logeado para ver este contenido</h1>
{/if}


{include 'templates/footer.tpl'}


<!--<div class="content">
      <h1 class="contact-us">Contact <span class="us-color">Us</span></h1>

      <div class="contact-form">
        <form action="">
          <div class="contact-form-right">
            <p>
              <label>Enter your name</label>
              <input type="text" id="formName" />
            </p>
            <p>
              <label> Enter your e-mail address</label>
              <input type="email" id="formEmail" />
            </p>
            <p>
              <label>Date of Birth</label>
              <input type="date" id="formDate" pattern="\d{4}-\d{2}-\d{2}" />
            </p>
            <p>Captcha</p>
            <p class="cod-captcha-theme" id="cod-captcha"></p>
            <button type="button" id="buttonGenerate">Generate Captcha</button>
            <p>Write the Captcha</p>
            <input type="text" id="entry-captcha" />
            <button type="button" id="buttonTry">
              Check Captcha<span
                id="characterCheck"
                class="character-check"
              ></span>
            </button>
          </div>
          <div class="contact-form-left">
            <p>Add a message</p>
            <textarea class="message-form" id="formText"></textarea>
            <button type="button" id="buttonSend">Send</button>
            <p id="datosVer"></p>
          </div>
        </form>
      </div>
      {if isset($username) && $username}
      <div class="div-mensajes">
        <button id="botonMostrarTodos">Mostrar todos los mensajes enviados</button>
        <button id="botonMostrarActual">Mostrar el mensaje seleccionado</button>
        <select id="selectMensajes" size="1"></select>
        <p><span id="mostrar-nombre"></span></p>
        <p><span id="mostrar-mail"></span></p>
        <p><span id="mostrar-fecha"></span></p>
        <p><span id="mostrar-mensaje"></span></p>
      </div>
      {/if}
    </div>
-->