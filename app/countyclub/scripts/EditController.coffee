angular
  .module('countyclub')
  .controller("EditController", ($scope, Countyclub, supersonic) ->
    $scope.countyclub = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Countyclub.find(values.id).then (countyclub) ->
        $scope.$apply ->
          $scope.countyclub = countyclub
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.countyclub.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
