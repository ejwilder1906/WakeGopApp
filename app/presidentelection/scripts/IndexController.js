var app=angular
  .module('presidentelection')
  .controller("IndexController", function ($scope, Presidentelection, supersonic) {
 	$scope.presidentelections = null;
    $scope.showSpinner = true;
	

    Presidentelection.all().whenChanged( function (presidentelections) {
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
		
		$scope.presidentelections = presidentelections;
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