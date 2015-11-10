angular
  .module('presidentelection')
  .controller("NewController", function ($scope, Presidentelection, supersonic) {
    $scope.presidentelection = {};

    $scope.submitForm = function () {
      $scope.showSpinner = true;
      newpresidentelection = new Presidentelection($scope.presidentelection);
      newpresidentelection.save().then( function () {
        supersonic.ui.modal.hide();
      });
    };

    $scope.cancel = function () {
      supersonic.ui.modal.hide();
    }

  });