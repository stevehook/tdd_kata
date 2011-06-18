class Calculator
  DEFAULT_DELIMITER = ','

  def add(input)
    return 0 if input == ''
    delimiter, input = get_delimiter(input)
    strings = input.split(/#{delimiter}|\n/)
    numbers = strings.collect { |n| n.to_i }.select { |n| n <= 1000 }
    raise_exception_for_negatives(numbers)
    numbers.inject { |sum, n| sum + n }
  end

  def raise_exception_for_negatives(numbers)
    negative_numbers = numbers.select { |n| n < 0 }
    raise "Negatives not allowed: #{negative_numbers.join(',')}" if negative_numbers.count > 0
  end

  def get_delimiter(input)
    delimiter = DEFAULT_DELIMITER
    if input && input[0, 2] == '//'
      if /^\/\/\[([^\d]+)\]\n(.+)/ =~ input
        delimiter = $1
        input = $2
      else
        delimiter = input[2]
        input = input[4, input.length - 4]
      end
    end
    return delimiter, input
  end
end
