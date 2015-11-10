angular
  .module('countyevent')
  .controller("NewController", ($scope, Countyevent, supersonic) ->
    $scope.countyevent = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newcountyevent = new Countyevent($scope.countyevent)
      newcountyevent.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
