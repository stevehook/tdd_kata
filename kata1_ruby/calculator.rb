class Calculator
  DEFAULT_DELIMITER = ','

  def add(input, write_result = true)
    return 0 if input == ''
    delimiters, input = get_delimiter(input)
    delimiter_regexp = Regexp.new(delimiters.map{|d| Regexp.escape(d)}.join('|'))
    strings = input.gsub("\n", delimiters[0]).split(delimiter_regexp)
    numbers = strings.collect { |n| n.to_i }.select { |n| n <= 1000 }
    raise_exception_for_negatives(numbers)
    result = numbers.inject { |sum, n| sum + n }
    puts result if write_result
    result
  end

  def raise_exception_for_negatives(numbers)
    negative_numbers = numbers.select { |n| n < 0 }
    raise "Negatives not allowed: #{negative_numbers.join(',')}" if negative_numbers.count > 0
  end

  def get_delimiter(input)
    delimiters = [DEFAULT_DELIMITER]
    if input && input[0, 2] == '//'
      if /^\/\/\[([^\d]+)\]\n(.+)/ =~ input
        delimiters = $1.split('][')
        input = $2
      else
        delimiters = [input[2]]
        input = input[4, input.length - 4]
      end
    end
    return delimiters, input
  end
end
