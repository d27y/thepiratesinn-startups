'use strict'

angular.module('startupsCologneApp')
  .controller 'UsersCtrl', ($scope, users) ->
    $scope.loading = true
    $scope.failed = false

    $scope.customFilter = (data) ->
      (item) ->
        found = false
        console.log data?
        found = true if not data?

        if data? and item.data.roles?
          for role in item.data.roles
            found = true if data.display_name is role.display_name

        found

    $scope.users = users.query(->
      $scope.loading = false

      tmp = {}
      $scope.roles = []
      for user in $scope.users
        if user.data.roles?
          for role in user.data.roles
            if not tmp[role.id]
              $scope.roles.push role
              tmp[role.id] = true
    , ->
      $scope.loading = false
      $scope.failed = true
    )

