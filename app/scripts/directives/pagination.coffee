'use strict';

angular.module('startupsCologneApp')
  .directive('pagination', () ->
    templateUrl: 'views/pagination.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      scope.showPagination = () ->
        true if scope.last_page > 1
      scope.prev = () ->
        "disabled" if scope.page is 1
      scope.next = () ->
        "disabled" if scope.page is scope.last_page
      scope.isActive = (page) ->
        "active" if scope.page is page
  )
