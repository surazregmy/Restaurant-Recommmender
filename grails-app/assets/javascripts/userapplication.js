// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//

//= require jquery-1.10.2.min.js
//= require main.js
//= require jquery.js
//= require jquery.carouFredSel-6.1.0-packed.js
//= require tms-0.4.1.js
//= require Mycustom.js
//= require rating.min.js


if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}
