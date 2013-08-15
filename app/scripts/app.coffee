'use strict'

if window.location.host.match /angellist\.magnetar\.lxc.*/
  api_host = "angellist.magnetar.lxc:3000"
else
  api_host = "startups-cologne-api.herokuapp.com"

angular.module('configuration', [])
  .value("API", api_host)
  .value("HOST", window.location.host)

angular.module('startupsCologneApp', ["ngResource", "auth", "configuration"])
  .config ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode true
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/users',
        templateUrl: 'views/users.html',
        controller: 'UsersCtrl'
      .when '/jobs',
        templateUrl: 'views/jobs.html',
        controller: 'JobsCtrl'
      .when '/startups',
        templateUrl: 'views/startups.html',
        controller: 'StartupsCtrl'
      .otherwise
        redirectTo: '/'

  .run ['$rootScope', '$window', 'API', 'HOST', (scope, $window, API, HOST) ->
    api_url = (url) ->
      "http://#{API}#{url}?redirect=http://#{HOST}"

    # authenticate with api
    scope.$on 'event:authenticate', (event) ->
      $window.location.assign(api_url "/auth/angellist")

    scope.$on 'event:logout', (event) ->
      $window.location.assign(api_url "/logout")

    scope.$on 'event:unauthorized', (event) ->
      scope.loggedIn = false

    scope.$on 'event:authorized', (event) ->
      scope.loggedIn = true

    scope.navBar = (url) ->
      if url is $window.location.pathname
        "active"
  ]
