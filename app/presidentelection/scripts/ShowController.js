angular
  .module('presidentelection')
  .controller("ShowController", function ($scope, Presidentelection, supersonic) {
    $scope.presidentelection = null;
    $scope.showSpinner = true;
    $scope.dataId = undefined;

    var _refreshViewData = function () {
      Presidentelection.find($scope.dataId).then( function (presidentelection) {
        $scope.$apply( function () {
          $scope.presidentelection = presidentelection;
          $scope.showSpinner = false;
        });
      });
    }

    supersonic.ui.views.current.whenVisible( function () {
      if ( $scope.dataId ) {
        _refreshViewData();
      }
    });

    supersonic.ui.views.current.params.onValue( function (values) {
      $scope.dataId = values.id;
      _refreshViewData();
    });

    $scope.remove = function (id) {
      $scope.showSpinner = true;
      $scope.presidentelection.delete().then( function () {
        supersonic.ui.layers.pop();
      });
    }
  });