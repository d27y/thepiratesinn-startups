'use strict'

if window.location.host.match /angellist\.magnetar\.lxc.*/
  api_host = "angellist.magnetar.lxc:3000"
else
  api_host = "angellist-dmt-api.herokuapp.com"

angular.module('configuration', [])
  .value("API", api_host)
  .value("HOST", window.location.host)

angular.module('searchService', ['ngResource', 'configuration']).
  factory 'Search', ($resource, API) ->
    api_host = API.replace /:/, "\\:"
    $resource "http://#{api_host}/api/1/search/:id", id: "@_id"

angular.module('angellistApp', ["searchService", "auth", "configuration"])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
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
  ]
