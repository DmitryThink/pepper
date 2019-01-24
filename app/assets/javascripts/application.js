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

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require activestorage


$(function() {
    $('[data-toggle="tooltip"]').tooltip();
    $('.modal').on('hidden.bs.modal', function(e) {
        $(this).find('form')[0].reset();
    });
});

$('#offer_avatar').change(function() {
    var i = $(this).prev('label').clone();
    var file = $('#offer_avatar')[0].files[0].name;
    $(this).prev('label').text(file);
});

$('#user_avatar').change(function() {
    var i = $(this).prev('label').clone();
    var file = $('#user_avatar')[0].files[0].name;
    $(this).prev('label').text(file);
});
