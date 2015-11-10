angular
  .module('countycommittee')
  .controller("NewController", ($scope, Countycommittee, supersonic) ->
    $scope.countycommittee = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newcountycommittee = new Countycommittee($scope.countycommittee)
      newcountycommittee.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
