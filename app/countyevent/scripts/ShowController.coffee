angular
  .module('countyevent')
  .controller("ShowController", ($scope, Countyevent, supersonic) ->
    $scope.countyevent = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Countyevent.find($scope.dataId).then (countyevent) ->
        $scope.$apply ->
          $scope.countyevent = countyevent
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.countyevent.delete().then ->
        supersonic.ui.layers.pop()
  )
