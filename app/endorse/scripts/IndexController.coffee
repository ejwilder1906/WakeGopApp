angular
  .module('endorse')
  .controller("IndexController", ($scope, Endorse, supersonic) ->
    $scope.endorses = null
    $scope.showSpinner = true

    Endorse.all().whenChanged (endorses) ->
      $scope.$apply ->
        $scope.endorses = endorses
        $scope.showSpinner = false
  )