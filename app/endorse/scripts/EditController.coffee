angular
  .module('endorse')
  .controller("EditController", ($scope, Endorse, supersonic) ->
    $scope.endorse = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Endorse.find(values.id).then (endorse) ->
        $scope.$apply ->
          $scope.endorse = endorse
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.endorse.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
