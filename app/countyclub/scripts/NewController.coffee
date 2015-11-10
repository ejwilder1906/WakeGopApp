angular
  .module('countyclub')
  .controller("NewController", ($scope, Countyclub, supersonic) ->
    $scope.countyclub = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newcountyclub = new Countyclub($scope.countyclub)
      newcountyclub.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
