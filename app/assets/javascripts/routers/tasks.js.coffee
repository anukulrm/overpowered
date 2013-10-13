class Home.Routers.Tasks extends Backbone.Router
  routes:
   '': 'index'
   'entries/:id': 'show'

  initialize: ->
    @collection = new Home.Collections.Tasks()
    @collection.fetch()

  index: ->
    view = new Home.Views.TasksIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Task #{id}"
