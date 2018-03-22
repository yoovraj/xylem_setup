angular.module('adminApp', ["chart.js"])
.controller('AdminController', function($scope, $http, $interval){
  var reloadFunction;
  $scope.reload = function() {
    $http.get('http://localhost:5000/router').then(successCallback, errorCallback);

    function successCallback(success) {
      $scope.devices = success.data.devices;
      var labels_array = []
      var data_array = []
      angular.forEach(success.data.devices, function(value, key) {
        labels_array.push(value.user_name)
        data_array.push(value.data_cost)
      });
      $scope.labels = labels_array
      $scope.data = data_array
    }
    function errorCallback(error) {
      console.log(error);
      $interval.cancel(reloadFunction);
    }
  };
  reloadFunction = $interval(function(){
    $scope.reload();
  }, 3000);
  $scope.colors = ['#45b7cd'];
  $scope.labels = ['yoovraj'];
  $scope.data = [
    [0]
  ];
  $scope.datasetOverride = [
    {
      label: "Bar chart",
      borderWidth: 1,
      type: 'bar'
    },
  ];

  // at the bottom of your controller
  var init = function () {
     // check if there is query in url
     // and fire search in case its value is not empty
     $scope.reload()
  };
  // and fire it after definition
  init();

});
