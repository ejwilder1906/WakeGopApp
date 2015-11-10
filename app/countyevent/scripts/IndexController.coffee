angular
  .module('countyevent')
  .controller("IndexController", ($scope, Countyevent, supersonic) ->
    $scope.countyevents = null
    $scope.showSpinner = true

    Countyevent.all().whenChanged (countyevents) ->
      $scope.$apply ->
        $scope.countyevents = countyevents
        $scope.showSpinner = false
  )