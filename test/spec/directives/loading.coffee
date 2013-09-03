'use strict'

describe 'Directive: loading', () ->
  beforeEach module 'startupsCologneApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<loading></loading>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the loading directive'
