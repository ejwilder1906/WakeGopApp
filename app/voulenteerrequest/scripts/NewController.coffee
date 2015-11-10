angular
  .module('voulenteerrequest')
  .controller("NewController", ($scope, Voulenteerrequest, supersonic) ->
    $scope.voulenteerrequest = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newvoulenteerrequest = new Voulenteerrequest($scope.voulenteerrequest)
      newvoulenteerrequest.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
