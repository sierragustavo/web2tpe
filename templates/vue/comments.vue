{literal}
<div id="Vue-comments">
        <h3>{{ title }}</h3>
        <ul class="list">
            <li v-for="comment in comments">
                <a class="author">Autor: {{ comment.author }} </a>
                   <a>Comentario:  {{ comment.comment }} </a><a>Valoración: {{comment.score}}</a>
                    <span v-if="admin">
                    <button v-on:"click=deletecomment/( comment.id_commnet )">
                        Borrar
                    </button>
                    </span>
            </li>
        </ul>
    </div>
{/literal}
