angular
  .module('example')
  .controller('IndexController', function($scope, supersonic) {
	$scope.pageTitle = 'Welcome';
	supersonic.ui.navigationBar.show();
	options = { title: $scope.pageTitle };
	supersonic.ui.navigationBar.update(options); 

  });