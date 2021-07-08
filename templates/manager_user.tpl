{include 'templates/header.tpl'}

<table>

    <thead>
        <tr>
            <th>Usuario</th>
            <th>Email</th>
            <th>Admin</th>
            <th>Botones</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$users item=user}
            <tr>
                <th>{$user->username}</th>
                <th>{$user->email}</th>
                <th>
                    {if ($user->admin) == 0}
                        No
                    {else}
                        Si
                    {/if}
                </th>
                <th>
                    {if $is_admin == 1}
                        {if ($user->admin) == 0}
                            <a href="{$base_url}borrar_usuario/{$user->id_user}"><button>Borrar Usuario</button></a>
                            <a href="{$base_url}enable_admin/{$user->id_user}"><button>Dar Admin</button></a>
                        {else}
                            <a href="{$base_url}disable_admin/{$user->id_user}"><button>Quitar Admin</button></a>
                        {/if}
                    {else}
                        <a>Necesita ser administrador del sitio para ver esto</a>
                    {/if}
                </th>
            </tr>
        {/foreach}
        {include 'templates/footer.tpl'}