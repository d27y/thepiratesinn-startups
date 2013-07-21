'use strict'

describe 'Service: accountService', () ->

  # load the service's module
  beforeEach module 'angellistApp'

  # instantiate service
  accountService = {}
  beforeEach inject (_accountService_) ->
    accountService = _accountService_

  it 'should do something', () ->
    expect(!!accountService).toBe true;
