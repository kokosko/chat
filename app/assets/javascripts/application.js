//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require material
//= require_tree .

window.onbeforeunload = function() {
  userStatus('offline')
}

var ready;
ready = function() {
  $("#message_form").bind("ajax:complete", function() {
    $('#message_text').val('');
  })
  $('.show_users').on('click', function() {
    $('.users').toggleClass('hide')
  });
  $('#user-menu').on('click', function() {
    $('.user_menu').toggle();
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);

$(document).idle({
  onIdle: function() {
    userStatus('away')
  },
  onActive: function() {
    userStatus('online')
  },
  idle: 60000
});

function userStatus(status) {
  $.ajax({
    url: "/user",
    type: "PATCH",
    data: {user: { status: status }},
    success: function(resp){ }
  });
}
