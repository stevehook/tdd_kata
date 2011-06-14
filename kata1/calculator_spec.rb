require 'rubygems'
require 'rspec'
require './calculator'

describe Calculator do
  before(:each) do
    @calc = Calculator.new
  end

  it 'should return 0 given an empty string' do
    @calc.add('').should == 0
  end

  it 'should return 1 given the string 1' do
    @calc.add('1').should == 1
  end

  it 'should return 3 given the string 1,2' do
    @calc.add('1,2').should == 3
  end

  it 'should return 6 given the string 1,2,3' do
    @calc.add('1,2,3').should == 6
  end

  it 'should return 6 given the string 1,2\n3' do
    @calc.add("1,2\n3").should == 6
  end

  it 'should return 6 given the string //\n1//2//3' do
    @calc.add("//\n1//2//3").should == 6
  end

  it 'should raise an exception if there are negative numbers' do
    expect { @calc.add('1,-2,3') }.to raise_error('Negatives not allowed: -2')
  end
end
