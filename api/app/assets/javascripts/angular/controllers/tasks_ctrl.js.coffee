App.controller 'TasksCtrl', ['$scope', 'Task', ($scope, Task) ->
$scope.tasks = Task.query()
]