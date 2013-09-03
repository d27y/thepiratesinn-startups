'use strict'

angular.module('startupsCologneApp')
  .controller 'JobsCtrl', ($scope, jobs) ->
    $scope.loading = true
    $scope.failed = false

    $scope.jobs = jobs.query(->
      $scope.loading = false
    , ->
      $scope.loading = false
      $scope.failed = true
    )
