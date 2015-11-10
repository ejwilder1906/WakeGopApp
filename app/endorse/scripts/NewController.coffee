angular
  .module('endorse')
  .controller("NewController", ($scope, Endorse, supersonic) ->
    $scope.endorse = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newendorse = new Endorse($scope.endorse)
      newendorse.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
