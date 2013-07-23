'use strict'

describe 'Directive: account', () ->
  beforeEach module 'startupsCologneApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<account></account>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the account directive'
