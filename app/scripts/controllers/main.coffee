'use strict'

angular.module('angellistApp')
  .controller 'MainCtrl', ($scope, Search) ->
    $scope.loading = true
    $scope.search = Search.query {q: "cologne"}, () ->
      $scope.loading = false
