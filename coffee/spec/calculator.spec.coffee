calc = require '../calculator.coffee'

describe 'calculator', ->
  calculator = new calc.Calculator

  it 'should return 0 for an empty string', ->
    expect(calculator.add '').toEqual 0

