angular
  .module('announce')
  .controller("EditController", ($scope, Announce, supersonic) ->
    $scope.announce = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Announce.find(values.id).then (announce) ->
        $scope.$apply ->
          $scope.announce = announce
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.announce.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
