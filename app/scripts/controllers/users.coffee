'use strict'

angular.module('startupsCologneApp')
  .controller 'UsersCtrl', ($scope, users) ->
    $scope.load = (page) ->
      $scope.loading = true
      $scope.pages = []
      $scope.page = 0
      $scope.last_page = 0

      $scope.users = users.query {page: page}, () ->
        $scope.loading = false
        $scope.pages = (num for num in [1..$scope.users.last_page])
        $scope.page = $scope.users.page
        $scope.last_page = $scope.users.last_page

    $scope.load 1
