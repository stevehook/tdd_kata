exports.Calculator = class Calculator
  add: (input) ->
    result = 0
    [delimiters, trimmedInput] = this.getDelimiter input
    delimiterRegex = new RegExp delimiters.join('|')
    numberStrings = trimmedInput.split delimiterRegex
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
      matchDelimiters = match[1].match /[(.+)]/
      if matchDelimiters
        delimiters = matchDelimiters[1].split ']['
      else
        delimiters = [match[1]]
      [delimiters, match[2]]
    else
      [['\n', ','], input]
