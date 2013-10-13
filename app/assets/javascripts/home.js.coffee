# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.Home =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Home.Routers.Tasks()
    Backbone.history.start()

$(document).ready ->
  Home.init()
