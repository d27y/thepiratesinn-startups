'use strict'

angular.module('angellistApp')
  .controller 'MainCtrl', ($scope, Search) ->
    $scope.search = Search.query {q: "cologne"}, () ->

