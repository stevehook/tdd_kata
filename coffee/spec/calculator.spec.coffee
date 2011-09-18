calc = require '../calculator.coffee'

describe 'calculator', ->
  calculator = new calc.Calculator

  it 'should return 0 for an empty string', ->
    expect(calculator.add '').toEqual 0

  it "should return 1 for '1'", ->
    expect(calculator.add '1').toEqual 1

  it "should return 3 for '1,2'", ->
    expect(calculator.add '1,2').toEqual 3

  it "should return 3 for '0,1,2'", ->
    expect(calculator.add '0,1,2').toEqual 3

  it "should return 6 for '1\n2,3'", ->
    expect(calculator.add '1\n2,3').toEqual 6

  it "should return 10 for '//;\\n1;2;3;4'", ->
    expect(calculator.add '//;\n1;2;3;4').toEqual 10

  it "should throw an exception with a negative number", ->
    expect(-> calculator.add '2;-3;4').toThrow 'Negative numbers are not allowed'

