angular
  .module('offical')
  .controller("ShowController", function ($scope, Offical, supersonic) {
    $scope.offical = null;
    $scope.showSpinner = true;
    $scope.dataId = undefined;

    var _refreshViewData = function () {
      Offical.find($scope.dataId).then( function (offical) {
        $scope.$apply( function () {
          $scope.offical = offical;
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
      $scope.offical.delete().then( function () {
        supersonic.ui.layers.pop();
      });
    }
  });