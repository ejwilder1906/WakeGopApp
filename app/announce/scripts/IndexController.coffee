angular
  .module('announce')
  .controller("IndexController", ($scope, Announce, supersonic) ->
    $scope.announces = null
    $scope.showSpinner = true

    Announce.all().whenChanged (announces) ->
      $scope.$apply ->
        $scope.announces = announces
        $scope.showSpinner = false
  )