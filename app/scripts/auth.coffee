angular.module('auth', [])
  .directive 'login', () ->
    # display login form
    restrict: 'E'
    templateUrl: 'views/login.html'
    link: (scope, element, attrs) ->
      scope.$on 'event:unauthorized', (event) ->
        $('#login').modal 'show'

      scope.login = () ->
        scope.$emit 'event:authenticate'

  .config ($httpProvider) ->
    # configure cors for our api
    $httpProvider.defaults.useXDomain = true
    $httpProvider.defaults.withCredentials = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

  .config ($httpProvider) ->
    # handle unauthorized responses from our api
    authorized = false

    interceptor = ['$rootScope', '$q', (scope, $q) ->
      is_api = (response) ->
        response.config.url.match(/http/)

      success = (response) ->
        if is_api(response) and not authorized
          authorized = true
          scope.$broadcast 'event:authorized'
        response

      error = (response) ->
        if is_api(response) and response.status == 401
          deferred = $q.defer()
          scope.$broadcast 'event:unauthorized'
          return deferred.promise

        $q.reject response

      (promise) ->
        promise.then success, error
    ]
    $httpProvider.responseInterceptors.push interceptor
