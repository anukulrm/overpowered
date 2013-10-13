class Home.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events:
    'submit #new_task': 'createTask'

  initialize: ->
    @collection.on('reset', @render, this) #triggered hen records loaded into collection
    @collection.on('add', @appendTask, this)
  render: ->
    $(@el).html(@template)
    @collection.each(@appendTask)
    this

  appendTask: (task) ->
    view = new Home.Views.Task(model: task)
    $('#tasks').append(view.render().el)

  createTask: (event) ->
    event.preventDefault()
    attributes = name: $('#new_task_name').val()
    @collection.create attributes,
      wait: true #waits to add until response from server recieved
      success: -> $('#new_task')[0].reset()
      error: @handleError

  handleError: (task, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        $('#errors').append("#{attribute} #{message} <br/>") for message in messages