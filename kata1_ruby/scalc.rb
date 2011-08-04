require './calculator'

input = ARGV.shift
while !input.nil? && input != ''
  result = Calculator.new.add(input, false)
  puts "The result is #{result}"
  puts "another input please"
  input = gets
end
