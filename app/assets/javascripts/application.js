// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).idle({
  onIdle: function() {
    console.log('Since you waited so long, the answer to the Ultimate Question of Life, the Universe, and Everything is 42');
    userStatus('away')
  },
  onActive: function() {
    console.log('Welcome back')
    userStatus('online')
  },
  idle: 5000
});

function userStatus(status) {
  $.ajax({
    url: "/user",
    type: "PATCH",
    data: {user: { status: status }},
    success: function(resp){ }
  });
}
