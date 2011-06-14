class Calculator
  def add(input)
    return 0 if input == ''
    if /^\/\/([^\d]+)\n/ =~ input
      delimiter = $1
    end
    strings = input.split(delimiter || /,|\n/)
    numbers = strings.collect { |n| n.to_i }.select { |n| n <= 1000 }
    negative_numbers = numbers.select { |n| n < 0 }
    raise "Negatives not allowed: #{negative_numbers.join(',')}" if negative_numbers.count > 0
    numbers.inject { |sum, n| sum + n }
  end
end
