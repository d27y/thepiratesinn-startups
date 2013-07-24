'use strict';

angular.module('startupsCologneApp')
  .factory 'jobs', ($resource, API) ->
    api_host = API.replace /:/, "\\:"
    $resource "http://#{api_host}/api/1/jobs/:id", id: "@_id", {query: {method: 'GET', isArray: false}}
