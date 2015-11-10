angular
  .module('countyevent')
  .controller("EditController", ($scope, Countyevent, supersonic) ->
    $scope.countyevent = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Countyevent.find(values.id).then (countyevent) ->
        $scope.$apply ->
          $scope.countyevent = countyevent
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.countyevent.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
