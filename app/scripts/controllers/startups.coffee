'use strict'

angular.module('startupsCologneApp')
  .controller 'StartupsCtrl', ($scope, startups) ->

    $scope.loading = true

    $scope.startups = startups.query () ->
      console.log arguments
      $scope.loading = false

