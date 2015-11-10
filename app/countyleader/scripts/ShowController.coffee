angular
  .module('countyleader')
  .controller("ShowController", ($scope, Countyleader, supersonic) ->
    $scope.countyleader = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Countyleader.find($scope.dataId).then (countyleader) ->
        $scope.$apply ->
          $scope.countyleader = countyleader
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.countyleader.delete().then ->
        supersonic.ui.layers.pop()
  )
