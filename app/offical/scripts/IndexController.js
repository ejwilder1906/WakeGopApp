var app=angular
  .module('offical')
  .controller("IndexController", function ($scope, Offical, supersonic) {
    $scope.officals = null;
    $scope.showSpinner = true;

    Offical.all().whenChanged( function (officals) {
        $scope.$apply( function () {
		
		$scope.currentPage = 0;
		$scope.pageSize = 4;
		$scope.data = [];
		for (var i=0; i<49; i++) {
			$scope.data.push("Item "+i);
		}
		$scope.numPages = function() {
			return Math.ceil($scope.data.length / $scope.pageSize);
		};
		
          $scope.officals = officals;
          $scope.showSpinner = false;
        });
    });
	
	//added code for pagination
	
	
    

	//We already have a limitTo filter built-in to angular,
	//let's make a startFrom filter
	app.filter('startFrom', function() {
		return function(input, start) {
			start = +start; //parse to int
			return input.slice(start);
		}
	});
	
	
	
	
  });