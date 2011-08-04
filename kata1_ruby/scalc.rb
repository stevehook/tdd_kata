require './calculator'

result = Calculator.new.add(ARGV[0])
puts "The result is #{result}"
