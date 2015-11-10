angular
  .module('voulenteerrequest')
  .controller("EditController", ($scope, Voulenteerrequest, supersonic) ->
    $scope.voulenteerrequest = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Voulenteerrequest.find(values.id).then (voulenteerrequest) ->
        $scope.$apply ->
          $scope.voulenteerrequest = voulenteerrequest
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.voulenteerrequest.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
