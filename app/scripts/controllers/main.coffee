'use strict'

angular.module('startupsCologneApp')
  .controller 'MainCtrl', ($scope, startups, $routeParams) ->

    $scope.load = (page) ->
      $scope.loading = true
      $scope.pages = []
      $scope.page = 0
      $scope.last_page = 0

      $scope.startups = startups.query {page: page}, () ->
        $scope.loading = false
        $scope.pages = (num for num in [1..$scope.startups.last_page])
        $scope.page = $scope.startups.page
        $scope.last_page = $scope.startups.last_page

    $scope.load 1

