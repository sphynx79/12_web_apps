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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//

// Set up a global AJAX error handler to handle the 401
// unauthorized responses. If a 401 status code comes back,
// the user is no longer logged-into the system and can not
// use it properly.

// $.ajaxSetup({
//     statusCode: {
//         401: function() {
//
//             // Redirect the to the login page.
//             location.href = "/users/sign_in";
//
//         }
//     }
// });
