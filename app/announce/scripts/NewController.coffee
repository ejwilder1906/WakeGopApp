angular
  .module('announce')
  .controller("NewController", ($scope, Announce, supersonic) ->
    $scope.announce = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newannounce = new Announce($scope.announce)
      newannounce.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
