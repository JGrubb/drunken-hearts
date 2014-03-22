angular.module('heartsApp', ['ngAnimate']);

angular.module('heartsApp').
  config(['$httpProvider', function(provider) {
    provider.defaults.headers.common['X-CSRF-Token'] = jQuery('meta[name=csrf-token]').attr('content');
  }]).
  controller('mainController', ['$scope', '$http', 
    function($scope, $http) {
      var cart;

      $http.get('/cart.json').success(function(data) {
        $scope.cart = data;
      });

      $scope.addToCart = function(product_id) {
        $http({
          method: 'POST',
          url: '/line_items?product_id=' + product_id,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        }).
        success(function(data) {
          $scope.cart = data;
        });
      };

      $scope.clearCart = function() {
        console.log('firing');
        $http({
          method: 'DELETE',
          url: '/cart.json',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        }).
        success(function(data) {
          $scope.cart = data;
          $scope.showCart = false;
        });
      }
    }]);
