angular
  .module('endorse')
  .controller("ShowController", ($scope, Endorse, supersonic) ->
    $scope.endorse = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Endorse.find($scope.dataId).then (endorse) ->
        $scope.$apply ->
          $scope.endorse = endorse
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.endorse.delete().then ->
        supersonic.ui.layers.pop()
  )
