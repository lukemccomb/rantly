//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {

  $("#rant-button").on('click', function (event) {
    event.preventDefault();
    $('.errors').remove();
    var form = $(this).parent('form');
    $.ajax({type: "POST", url: ("/rants"), data: form.serialize()})
      .success(function (data) {
        if (data.errors) {
          $('#rant-title').append(' <span class="errors">' + data.errors.title_errors + '</span>');
          $('#rant-rant').append(' <span class="errors">' + data.errors.rant_errors + '</span>');
        } else {
          window.location.reload(true)
        }
      });
  });

//  Favoriting

  $(".favorite").on('click', function (e) {
    e.preventDefault();
    var rant_id = $(this).data("rant-id");
    var rant = $(this);
    $.ajax({type: "POST", url: ("/rants/" + rant_id + "/favorites"), data: {rant_id: rant_id}})
      .success(function (data) {
        var intCount = parseInt(rant.parentsUntil('.favorite-wrap').children('.fav-count').text());
        intCount += 1;
        var fav_wrap = rant.parentsUntil('.favorite-wrap');
        fav_wrap.children('.fav-count').text(intCount);
        fav_wrap.children('form').replaceWith(data);
      });
  });
  $(".unfavorite").on('click', function (e) {
    e.preventDefault();
    var rant_id = $(this).data("rant-id");
    var fav_id = $(this).data("id");
    var rant = $(this);
    $.ajax({type: "DELETE", url: ("/rants/" + rant_id + "/favorites/" + fav_id), data: { rant_id: rant_id }})
      .success(function (data) {
        var intCount = parseInt(rant.parentsUntil('.favorite-wrap').children('.fav-count').text());
        intCount -= 1;
        var fav_wrap = rant.parentsUntil('.favorite-wrap');
        fav_wrap.children('.fav-count').text(intCount);
        fav_wrap.children('form').replaceWith(data);
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