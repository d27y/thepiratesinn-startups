'use strict';

angular.module('startupsCologneApp')
  .factory 'users', ($resource, API) ->
    api_host = API.replace /:/, "\\:"
    $resource "http://#{api_host}/api/1/users/:id", id: "@_id", {query: {method: 'GET', isArray: false}}
