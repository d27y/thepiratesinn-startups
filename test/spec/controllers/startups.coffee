'use strict'

describe 'Controller: StartupsCtrl', () ->

  # load the controller's module
  beforeEach module 'startupsCologneApp'

  StartupsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StartupsCtrl = $controller 'StartupsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
