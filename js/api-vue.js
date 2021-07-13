let adminInput = document.querySelector('#admin').value;
let app = new Vue({
  el: "#Vue-comments",
  data: {
    title: "Comentarios",
    admin: adminInput,
    comments: [],
  },
  methods: {
    getComments: function () {
      getComments();
    },
    deleteComment: function (id_commentary) {
      deleteComment(id_commentary);
    },
  },
});
app.getComments();
console.log(app.admin);
//let form = document.getElementById('newCommentary');
//form.addEventListener('submit', addComment);

function getComments() {
  let urlParts = window.location.href.split("/");
  let id_news = urlParts[urlParts.length - 1];
  let url = "http://localhost:80/web2tpe1/api/comments/" + id_news;
  fetch(url)
    .then((response) => response.json())
    .then((comentarios) => (app.comments = comentarios))
    .catch((error) => console.log(error));
}
