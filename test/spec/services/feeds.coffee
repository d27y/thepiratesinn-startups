'use strict'

describe 'Service: feeds', () ->

  # load the service's module
  beforeEach module 'startupsCologneApp'

  # instantiate service
  feeds = {}
  beforeEach inject (_feeds_) ->
    feeds = _feeds_

  it 'should do something', () ->
    expect(!!feeds).toBe true;
