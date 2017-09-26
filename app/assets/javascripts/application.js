// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
window.addEventListener("load", function () {
  var links = document.querySelectorAll(".vote");

  for (let i = 0; i < links.length; i++) {
    let link = links[i];

    links[i].addEventListener("click", function(e) {
      e.preventDefault();
      vote(link.dataset.url, link.dataset.dir);
    });
  }
});

function vote(url, dir) {
  let request = new XMLHttpRequest;
  let params = "dir=" + dir;
  request.open("POST", url);
  request.responseType = "json";
  request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  request.addEventListener("load", function() {
    updateRank(this.response.id, this.response.rank);
  });
  request.send(params);
}

function updateRank(commentId, rank) {
  let spanRank = document.getElementById("rank-" + commentId);
  spanRank.innerHTML = rank;
}
