exports.Calculator = class Calculator
  add: (input) ->
    result = 0
    [delimiter, trimmedInput] = this.getDelimiter input
    numberStrings = trimmedInput.split delimiter
    for numberString in numberStrings
      num = parseInt numberString
      throw 'Negative numbers are not allowed' if num && num < 0
      result += num if num
    result

  getDelimiter: (input) ->
    match = input.match /^\/\/(.+)\n(.+)/
    if match
      [match[1], match[2]]
    else
      [/\n|,/, input]
