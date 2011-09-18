exports.Calculator = class Calculator
  add: (input) ->
    result = 0
    [delimiter, trimmedInput] = this.getDelimiter input
    numberStrings = trimmedInput.split delimiter
    negatives = []
    for numberString in numberStrings
      num = parseInt numberString
      negatives.push num if num && num < 0
      result += num if num && num <= 1000
    throw ('Negative numbers are not allowed: ' + negatives.join(', ')) if negatives.length > 0
    result

  getDelimiter: (input) ->
    match = input.match /^\/\/(.+)\n(.+)/
    if match
      [match[1], match[2]]
    else
      [/\n|,/, input]
