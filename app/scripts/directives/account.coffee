'use strict';

angular.module('angellistApp')
  .directive('account', () ->
    # display login form
    restrict: 'E'
    templateUrl: 'views/account.html'
    controller: ["$scope", "accountService", ($scope, account) ->
      $scope.account = account.get () ->
    ]
    link: (scope, element, attrs) ->
      scope.$on 'event:unauthorized', (event) ->
        scope.show = false

      scope.$on 'event:authorized', (event) ->
        scope.show = true

      scope.logout = () ->
        scope.$emit 'event:logout'
  )
