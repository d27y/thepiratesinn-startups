'use strict'

describe 'Service: jobs', () ->

  # load the service's module
  beforeEach module 'startupsCologneApp'

  # instantiate service
  jobs = {}
  beforeEach inject (_jobs_) ->
    jobs = _jobs_

  it 'should do something', () ->
    expect(!!jobs).toBe true;
