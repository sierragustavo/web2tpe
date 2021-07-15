{literal}
<div id="Vue-comments">
        <h3>{{ title }}</h3>
        <ul class="list">
        <div v-if="comments!=null">
            <li v-for="comment in comments">
                <a class="author">Autor: {{ comment.author }} </a>
                   <a>Comentario:  {{ comment.comment }} </a><a>Valoración: {{comment.score}}</a>
                    <span v-if="admin==1">
                    <button v-on:click="deleteComment(comment.id_comment)">Borrar</button>
                    </span>
            </li>
        </div>
        </ul>
    </div>
{/literal}
