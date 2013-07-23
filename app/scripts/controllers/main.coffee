'use strict'

angular.module('startupsCologneApp')
  .controller 'MainCtrl', ($scope, Search) ->
    $scope.loading = true
    $scope.search = Search.query {q: "cologne"}, () ->
      $scope.loading = false
