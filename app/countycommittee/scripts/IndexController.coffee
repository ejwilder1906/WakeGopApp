angular
  .module('countycommittee')
  .controller("IndexController", ($scope, Countycommittee, supersonic) ->
    $scope.countycommittees = null
    $scope.showSpinner = true

    Countycommittee.all().whenChanged (countycommittees) ->
      $scope.$apply ->
        $scope.countycommittees = countycommittees
        $scope.showSpinner = false
  )