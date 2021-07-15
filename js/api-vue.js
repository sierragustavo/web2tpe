let adminInput = document.querySelector("#admin").value;
const urlA = "http://localhost:80/web2tpe1/";

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

    deleteComment(id_comentario) {
      fetch(urlA + "api/deletecomment/" + id_comentario)
      .then(getComments())
      .catch((error) => console.log(error));
    },
  },
});

app.getComments();

document.addEventListener("DOMContentLoaded", () => {
  document.querySelector("#botonComentario").addEventListener("click", (e) => {
    e.preventDefault();
    addComentario();
  });
});

function getComments() {
  let urlParts = window.location.href.split("/");
  let id_news = urlParts[5];
  let url = urlA + "api/comments/" + id_news;
  fetch(url)
    .then((response) => response.json())
    .then((comentarios) => (app.comments = comentarios))
    .catch((error) => console.log(error));
}

function addComentario() {
  let dataComment = {
    comment: document.querySelector("#comment").value,
    id_new_fk: document.querySelector("#id_news_fk").value,
    author: document.querySelector("#author").value,
    score: checkScore(),
  };
  fetch(urlA + "api/addcomment", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(dataComment),
  })
    .then(getComments())
    .catch((error) => console.log(error));
}

function checkScore() {
  if (document.querySelector("#score1").checked == true) return 1;
  if (document.querySelector("#score2").checked == true) return 2;
  if (document.querySelector("#score3").checked == true) return 3;
  if (document.querySelector("#score4").checked == true) return 4;
  if (document.querySelector("#score5").checked == true) return 5;
}
