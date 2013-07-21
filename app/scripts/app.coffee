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
    # authenticate with api
    scope.$on 'event:authenticate', (event) ->
      auth_host = API
      this_host = HOST
      auth_url = "http://#{auth_host}/auth/angellist?redirect=http://#{this_host}"

      $window.location.assign auth_url
    ]
