angular
  .module('presidentelection')
  .controller("EditController", function ($scope, Presidentelection, supersonic) {
    $scope.presidentelection = null;
    $scope.showSpinner = true;

    // Fetch an object based on id from the database
    Presidentelection.find(steroids.view.params.id).then( function (presidentelection) {
      $scope.$apply(function() {
        $scope.presidentelection = presidentelection;
        $scope.showSpinner = false;
      });
    });

    $scope.submitForm = function() {
      $scope.showSpinner = true;
      $scope.presidentelection.save().then( function () {
        supersonic.ui.modal.hide();
      });
    }

    $scope.cancel = function () {
      supersonic.ui.modal.hide();
    }

  });
