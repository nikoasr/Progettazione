# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#success-alert').fadeTo(2000, 500).slideUp 500, ->
      $('#success-alert').alert 'close'
        