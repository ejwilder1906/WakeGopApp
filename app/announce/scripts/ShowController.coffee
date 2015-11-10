angular
  .module('announce')
  .controller("ShowController", ($scope, Announce, supersonic) ->
    $scope.announce = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Announce.find($scope.dataId).then (announce) ->
        $scope.$apply ->
          $scope.announce = announce
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.announce.delete().then ->
        supersonic.ui.layers.pop()
  )
