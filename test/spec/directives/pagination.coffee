'use strict'

describe 'Directive: pagination', () ->
  beforeEach module 'startupsCologneApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<pagination></pagination>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the pagination directive'
