'use strict'

describe 'Service: startups', () ->

  # load the service's module
  beforeEach module 'startupsCologneApp'

  # instantiate service
  startups = {}
  beforeEach inject (_startups_) ->
    startups = _startups_

  it 'should do something', () ->
    expect(!!startups).toBe true;
