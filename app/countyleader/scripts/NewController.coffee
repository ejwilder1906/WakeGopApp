angular
  .module('countyleader')
  .controller("NewController", ($scope, Countyleader, supersonic) ->
    $scope.countyleader = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newcountyleader = new Countyleader($scope.countyleader)
      newcountyleader.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
