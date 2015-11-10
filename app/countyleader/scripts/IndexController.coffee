angular
  .module('countyleader')
  .controller("IndexController", ($scope, Countyleader, supersonic) ->
    $scope.countyleaders = null
    $scope.showSpinner = true

    Countyleader.all().whenChanged (countyleaders) ->
      $scope.$apply ->
        $scope.countyleaders = countyleaders
        $scope.showSpinner = false
  )