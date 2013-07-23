'use strict'

angular.module('startupsCologneApp')
  .controller 'UsersCtrl', ($scope, users) ->
    $scope.loading = true
    $scope.users = users.query {}, () ->
      $scope.loading = false
