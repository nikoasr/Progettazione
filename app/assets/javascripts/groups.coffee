# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require moment
#= require bootstrap-datetimepicker

$(document).on 'ready page:change', -> 
    $('.datetimepicker').datetimepicker();
    $('#datetimepicker1').datetimepicker();