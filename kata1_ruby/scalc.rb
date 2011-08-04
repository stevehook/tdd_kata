require './calculator'

input = ARGV[0]
while !input.nil? && input != ''
  result = Calculator.new.add(input, false)
  puts "The result is #{result}"
  puts "another input please"
  input = gets
end
