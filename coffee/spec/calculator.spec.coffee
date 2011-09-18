calc = require '../calculator.coffee'

describe 'calculator', ->
  it 'should create a new calculator', ->
    calculator = new calc.Calculator

  it 'should return 0 for an empty string', ->
    calculator = new calc.Calculator
    expect(calculator.add '').toEqual 0

