'use strict'

angular.module('startupsCologneApp')
  .controller 'MainCtrl', ($scope, startups) ->
    $scope.loading = true
    $scope.startups = startups.query {}, () ->
      $scope.loading = false
