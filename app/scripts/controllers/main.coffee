'use strict'

angular.module('startupsCologneApp')
  .controller 'MainCtrl', ($scope, feeds) ->
    $scope.loading = true

    $scope.feeds = feeds.query () ->
      $scope.loading = false
