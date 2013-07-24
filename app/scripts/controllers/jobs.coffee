'use strict'

angular.module('startupsCologneApp')
  .controller 'JobsCtrl', ($scope, jobs) ->
    $scope.load = (page) ->
      $scope.loading = true
      $scope.pages = []
      $scope.page = 0
      $scope.last_page = 0

      $scope.jobs = jobs.query {}, () ->
        $scope.loading = false
        $scope.pages = (num for num in [1..$scope.jobs.last_page])
        $scope.page = $scope.jobs.page
        $scope.last_page = $scope.jobs.last_page

    $scope.load 1
