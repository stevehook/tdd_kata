calc = require '../calculator.coffee'

describe 'calculator', ->
  calculator = new calc.Calculator

  it 'should return 0 for an empty string', ->
    expect(calculator.add '').toEqual 0

  it "should return 1 for '1'", ->
    expect(calculator.add '1').toEqual 1

