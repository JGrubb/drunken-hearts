// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery.ui.datepicker

jQuery(function($){
  $('input#show_date').datepicker({
    dateFormat: "yy-mm-dd"
  });
});