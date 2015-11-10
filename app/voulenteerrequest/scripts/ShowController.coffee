angular
  .module('voulenteerrequest')
  .controller("ShowController", ($scope, Voulenteerrequest, supersonic) ->
    $scope.voulenteerrequest = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Voulenteerrequest.find($scope.dataId).then (voulenteerrequest) ->
        $scope.$apply ->
          $scope.voulenteerrequest = voulenteerrequest
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.voulenteerrequest.delete().then ->
        supersonic.ui.layers.pop()
  )
