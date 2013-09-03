'use strict';

angular.module('startupsCologneApp')
  .directive('loading', () ->
    templateUrl: 'views/loading.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      cl = new CanvasLoader 'canvasloader-container'
      # default is 'oval'
      cl.setShape 'spiral'
      cl.setDensity 122
      cl.setRange 0.9
      cl.setSpeed 4
      cl.setFPS 43
      # Hidden by default
      cl.show()
  )
