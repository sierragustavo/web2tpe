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
                {if ($user->admin) == 0}
                    <th>
                        No
                    </th>
                    {if $is_admin == 1}
                        <th>
                            <button onclick="{$base_url}delete_user/{$user->id_user}">Borrar Usuario</button>
                            <button onclick="{$base_url}change_admin/{$user->id_user}">Hacer Admin</button>
                        </th>
                    {else}
                        <th>
                            Si
                        </th>
                        {if $is_admin == 1}
                            <th>
                                <button onclick="{$base_url}change_admin/{$user->id_user}">Quitar Admin</button>
                            </th>
                        {else}
                            <a>Necesita ser administrador del sitio para ver esto</a>
                        {/if}
                    {/if}
                    </th>
                    <th>
                    </th>
                {/foreach}
                {include 'templates/footer.tpl'}