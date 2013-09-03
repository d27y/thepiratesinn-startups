'use strict'

angular.module('startupsCologneApp')
  .controller 'StartupsCtrl', ($scope, startups) ->
    $scope.loading = true
    $scope.failed = false

    $scope.startups = startups.query(->
      $scope.loading = false
    , ->
      $scope.loading = false
      $scope.failed = true
    )

