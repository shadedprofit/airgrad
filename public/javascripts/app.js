angular.module('airgrad', [
  'ngRoute'
  ])

.config (function ($routeProvider, $httpProvider) {
  $routeProvider
    .when('/courses', {
      templateUrl: '/views/courses.html',
      controller: ''
    })
    .when('/welcome', {
      templateUrl: '/views/welcome.html'
    })
    
    .otherwise('/welcome');
});