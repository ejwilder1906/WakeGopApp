angular
  .module('countycommittee')
  .controller("ShowController", ($scope, Countycommittee, supersonic) ->
    $scope.countycommittee = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Countycommittee.find($scope.dataId).then (countycommittee) ->
        $scope.$apply ->
          $scope.countycommittee = countycommittee
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.countycommittee.delete().then ->
        supersonic.ui.layers.pop()
  )
