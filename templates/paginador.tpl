{if $paginaActual != 1}
    <a href="{$base_url}home/?pagina={$paginaActual - 1}{if $filtrando==true}&filtrar={$id_category}{/if}">Anterior</a>
{/if}

{for $i = 0 to $cantidadPaginas}

    {if $paginaActual==$i+1}
        <span>{$i+1}</span>
    {else}
        <a href="{$base_url}home/?pagina={$i+1}{if $filtrando==true}&filtrar={$id_category}{/if}">{$i+1}</a>
    {/if}

{/for} <!--ESTE FOR FUNCIONA PERO NO LO TOMA EL IDENTADOR-->

{if $paginaActual-1 != $cantidadPaginas}
    <a href="{$base_url}home/?pagina={$paginaActual + 1}{if $filtrando==true}&filtrar={$id_category}{/if}">Siguiente</a>
{/if}