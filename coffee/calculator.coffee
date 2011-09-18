exports.Calculator = class Calculator
  add: (input) ->
    result = 0
    numberStrings = input.split ','
    for numberString in numberStrings
      num = parseInt numberString
      result += num if num
    result
