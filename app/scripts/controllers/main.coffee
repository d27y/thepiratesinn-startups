'use strict'

angular.module('startupsCologneApp')
  .controller 'MainCtrl', ($scope, feeds) ->
    $scope.loading = true
    $scope.failed = false

    $.getScript "//platform.twitter.com/widgets.js"

    $scope.feeds = feeds.query(->
      $scope.loading = false
    , ->
      $scope.loading = false
      $scope.failed = true
    )

