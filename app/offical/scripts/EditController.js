angular
  .module('offical')
  .controller("EditController", function ($scope, Offical, supersonic) {
    $scope.offical = null;
    $scope.showSpinner = true;

    // Fetch an object based on id from the database
    Offical.find(steroids.view.params.id).then( function (offical) {
      $scope.$apply(function() {
        $scope.offical = offical;
        $scope.showSpinner = false;
      });
    });

    $scope.submitForm = function() {
      $scope.showSpinner = true;
      $scope.offical.save().then( function () {
        supersonic.ui.modal.hide();
      });
    }

    $scope.cancel = function () {
      supersonic.ui.modal.hide();
    }

  });
