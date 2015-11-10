angular
  .module('offical')
  .controller("NewController", function ($scope, Offical, supersonic) {
    $scope.offical = {};

    $scope.submitForm = function () {
      $scope.showSpinner = true;
      newoffical = new Offical($scope.offical);
      newoffical.save().then( function () {
        supersonic.ui.modal.hide();
      });
    };

    $scope.cancel = function () {
      supersonic.ui.modal.hide();
    }

  });