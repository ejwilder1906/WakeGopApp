angular
  .module('voulenteerrequest')
  .controller("IndexController", ($scope, Voulenteerrequest, supersonic) ->
    $scope.voulenteerrequests = null
    $scope.showSpinner = true

    Voulenteerrequest.all().whenChanged (voulenteerrequests) ->
      $scope.$apply ->
        $scope.voulenteerrequests = voulenteerrequests
        $scope.showSpinner = false
  )