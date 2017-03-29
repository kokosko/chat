//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require material
//= require_tree .

var ready;
ready = function() {
  $("#message_form").bind("ajax:complete", function() {
    $('#message_text').val('');
  })
/*	  $('.show_users').on('click', function() {
    $('.users').toggleClass('hide')
  });
  $('#user-menu').on('click', function() {
    $('.user_menu').toggle();
  });*/
}

