angular
  .module('countycommittee')
  .controller("EditController", ($scope, Countycommittee, supersonic) ->
    $scope.countycommittee = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Countycommittee.find(values.id).then (countycommittee) ->
        $scope.$apply ->
          $scope.countycommittee = countycommittee
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.countycommittee.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
