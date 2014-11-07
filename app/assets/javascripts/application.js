//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//$(document).ready(function() {
//
//  $("#favorite-show").on('click', function() {
//    var rant_id = $(this).data("rant-id");
//    $.ajax( {type: "POST", url: ("/rants/" + rant_id + "/favorites"), data: {rant_id: rant_id}})
//      .success(function( data ) {
//        console.log(data.fav_count)
//      });
//    $(this).hide();
//    $('#unfavorite-hide').show();
////    remove the button itself
////    $(this).addClass('unfavorite');
////    add unfav button
//  });
//
//  $("#unfavorite").on('click', function() {
//    var rant_id = $(this).data("rant-id");
//
//    var user_id = $(this).data("user-id");
//
//    $.ajax({type: "DELETE", url: "/rants/" + rant_id + "/favorites", data: { rant_id: rant_id, user_id: user_id}});
//
//    $(this).removeClass('unfavorite');
//    $(this).addClass('favorite');
//  });
//});