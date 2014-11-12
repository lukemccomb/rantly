//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

  $("#rant-button").on('click', function(event) {
    event.preventDefault();
    var form = $(this).parent('form');
    $.ajax( {type: "POST", url: ("/rants"), data: form.serialize()})
      .success( function() {
        window.location.reload(true);
      })
      .error( function() {
        debugger;
        arguments
      });
  });

//  Favoriting

  $(".favorite").on('click', function(e) {
    e.preventDefault();
    var rant_id = $(this).data("rant-id");
    $.ajax( {type: "POST", url: ("/rants/" + rant_id + "/favorites"), data: {rant_id: rant_id}})
      .always(function() {
        window.location.reload(true);
      });
  });
  $(".unfavorite").on('click', function(e) {
    e.preventDefault();
    var rant_id = $(this).data("rant-id");
    var fav_id = $(this).data("id");
    $.ajax({type: "POST", url: ("/rants/" + rant_id + "/favorites/" + fav_id), data: { rant_id: rant_id, _method: "delete" }})
      .always(function() {
        window.location.reload(true);
      });
  });

//  Following

//  $(".follow").on('click', function(e) {
//    e.preventDefault();
//    var user_id = $(this).data("user-id");
//    $.ajax( {type: "POST", url: ("users/" + user_id + "/follow"), data: {user_id: user_id}})
//      .always(function() {
//        window.location.reload(true);
//      });
//  });
//  $(".unfollow").on('click', function(e) {
//    e.preventDefault();
//    var user_id = $(this).data("user-id");
//    $.ajax({type: "DELETE", url: ("users/" + user_id + "/unfollow"), data: {user_id: user_id}})
//      .always(function() {
//        window.location.reload(true);
//      });
//  });
});