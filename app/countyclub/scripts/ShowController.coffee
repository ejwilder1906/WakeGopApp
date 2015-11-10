angular
  .module('countyclub')
  .controller("ShowController", ($scope, Countyclub, supersonic) ->
    $scope.countyclub = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Countyclub.find($scope.dataId).then (countyclub) ->
        $scope.$apply ->
          $scope.countyclub = countyclub
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.countyclub.delete().then ->
        supersonic.ui.layers.pop()
  )
