'use strict'

angular.module('searchService', ['ngResource']).
  factory 'Search', ($resource) ->
    $resource 'http://angellist.magnetar.lxc\\:3000/api/1/search/:id', id: "@_id"

angular.module('angellistApp', ["searchService"])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
