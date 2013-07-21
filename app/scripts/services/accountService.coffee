'use strict';

angular.module('angellistApp')
  .service 'accountService', ["$http", "API", ($http, API) ->
    this.get = (callback) ->
      $http.get("http://#{API}/account").success () ->
        callback()
  ]
