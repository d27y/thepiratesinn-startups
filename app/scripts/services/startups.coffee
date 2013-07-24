'use strict';

angular.module('startupsCologneApp')
  .factory 'startups', ($resource, API) ->
    api_host = API.replace /:/, "\\:"
    $resource "http://#{api_host}/api/1/startups/:id", id: "@_id", {query: {method: 'GET', isArray: false}}
