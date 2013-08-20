'use strict'

angular.module('startupsCologneApp')
  .controller 'MainCtrl', ($scope, feeds) ->
    $scope.loading = true

    $scope.feeds = feeds.query () ->
      $scope.loading = false

      s = "script"
      id = "twitter-wjs"
      fjs = document.getElementsByTagName(s)[0]
      p = if (/^http:/.test(document.location)) then 'http' else 'https'

      if $(id).size() is 0
        js = document.createElement s
        js.id = id
        js.src = "#{p}://platform.twitter.com/widgets.js"
        fjs.parentNode.insertBefore js, fjs
 
