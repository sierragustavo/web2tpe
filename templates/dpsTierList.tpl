{include 'templates/header.tpl'}

    <div class="main-content">
        <h3>WoW DPS Rankings / Tier List - Shadowlands Beta</h3>
        <p>
            Welcome to our World of Warcraft Shadowlands DPS Rankings updated for the latest Shadowlands Beta Patch and
            the newest Raid– Castle
            Nathria. We check this data every day and make sure that it is accurate and up to date. The classes and
            specs here are ranked by their overall DPS
            performance in Raids at Level 60. The data is gathered from the most recent successful boss kills of Castle
            Nathria from WarcraftLogs.
            Wipes/trash fights are NOT considered. You can see the number of parsed logs for each boss.
        </p>

        <h4>Tiers</h4>

        <li>A = High DPS</li>
        <li>B = Good DPS </li>
        <li>C = Normal DPS </li>
        <li>D = Low DPS </li>
        <li>F = Very Low Dps</li>



        <table>
            <thead class="top-tabla">
                <th onclick="sortTable(0)">Class</th>
                <th>Spec</th>
                <th>DPS</th>
                <th onclick="sortTable(3)">TIER</th>
                <th>BOTONES</th>
            </thead>
            <tbody id="tableDPS"></tbody>
        </table>


        <div class="imput-table">
            <div class="imput-theme">
                <p class="imput-title">
                    Add your own character</p>
                <p>Name<input type="text" id="nombre"></p>
                <p>Spec<input type="text" id="especialidad"></p>
                <p>DPS<input type="number" id="damage"></p>
                <p>Clase<select id="clase" size="1"></p>
                <option value="MostrarTodos">Mostrar Todos</option>
                <option value="Druid">Druid</option>
                <option value="Rogue">Rogue</option>
                <option value="Mage">Mage</option>
                <option value="Warrior">Warrior</option>
                <option value="Shaman">Shaman</option>
                <option value="Monk">Monk</option>
                <option value="DeathKnight">Death Knight</option>
                <option value="Priest">Priest</option>
                <option value="DemonHunter">Demon Hunter</option>
                <option value="Paladin">Paladin</option>
                <option value="Hunter">Hunter</option>
                <option value="Warlock">Warlock</option>
                </select>
            </div>
            <div class="buttons">
                <button onclick="addClass()">Add character</button>
                <button onclick="addPreset()">Add presets<p id="loaderPreset" class="loader"></p></button>
                <button onclick="deleteTable()">Delete table<p id="loaderDelete" class="loader"></p></button>
                <button onclick="filtrarTabla()">Filtrar por Clase</button>
            </div>
        </div>


    </div>
    <script src="js/table.js"></script>

{include 'templates/footer.tpl'}