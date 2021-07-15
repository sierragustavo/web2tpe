{if $paginaActual != 1}
    <a
        href="{$base_url}home?pagina={$paginaActual - 1}{if $filtrando==true}&categoria={$id_category}&autor={$author_filter}{/if}">Anterior</a>
{/if}

{for $i = 0 to $cantidadPaginas}

    {if $paginaActual==$i+1}
        <span>{$i+1}</span>
    {else}
        <a
            href="{$base_url}home?pagina={$i+1}{if $filtrando==true}&categoria={$id_category}&autor={$author_filter}{/if}">{$i+1}</a>
    {/if}

{/for}

{if $paginaActual-1 != $cantidadPaginas}
    <a
        href="{$base_url}home?pagina={$paginaActual + 1}{if $filtrando==true}&categoria={$id_category}&autor={$author_filter}{/if}">Siguiente</a>
{/if}