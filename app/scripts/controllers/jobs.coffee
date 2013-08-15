'use strict'

angular.module('startupsCologneApp')
  .controller 'JobsCtrl', ($scope, jobs) ->
    $scope.loading = true

    $scope.jobs = jobs.query () ->
      $scope.loading = false
