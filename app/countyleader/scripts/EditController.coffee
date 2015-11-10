angular
  .module('countyleader')
  .controller("EditController", ($scope, Countyleader, supersonic) ->
    $scope.countyleader = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Countyleader.find(values.id).then (countyleader) ->
        $scope.$apply ->
          $scope.countyleader = countyleader
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.countyleader.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
