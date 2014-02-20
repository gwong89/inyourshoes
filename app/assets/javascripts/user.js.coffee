# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/





jQuery ($) ->
  $(".input-group-btn .dropdown-menu > li:not(.divider)").click ->
    $(this).closest("ul").prev().text ($(this).text())
    return

  return
