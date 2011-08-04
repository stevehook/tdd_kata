require './calculator'

result = Calculator.new.add(ARGV[0], false)
puts "The result is #{result}"
puts "another input please"
