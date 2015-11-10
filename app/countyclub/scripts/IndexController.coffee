angular
  .module('countyclub')
  .controller("IndexController", ($scope, Countyclub, supersonic) ->
    $scope.countyclubs = null
    $scope.showSpinner = true

    Countyclub.all().whenChanged (countyclubs) ->
      $scope.$apply ->
        $scope.countyclubs = countyclubs
        $scope.showSpinner = false
  )