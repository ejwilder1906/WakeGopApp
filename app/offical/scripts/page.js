angular
.module('myApp', []);

function MyCtrl($scope) {
    $scope.currentPage = 0;
    $scope.pageSize = 10;
    $scope.data = [];
    for (var i=0; i<49; i++) {
        $scope.data.push("Item "+i);
    }
    $scope.numPages = function() {
        return Math.ceil($scope.data.length / $scope.pageSize);
    };
}

//We already have a limitTo filter built-in to angular,
//let's make a startFrom filter
app.filter('startFrom', function() {
    return function(input, start) {
        start = +start; //parse to int
        return input.slice(start);
    }
});