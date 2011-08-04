module Kernel
  class << self
    attr_accessor :last_output
  end

  def puts(output)
    Kernel.last_output = output.to_s
  end
end

describe "Calculator command-line" do
  before(:each) do
    Kernel.last_output = nil
  end

  it 'should run' do
    load './scalc.rb'
  end

  it 'should print the result' do
    ARGV = ['1,2,3']
    load './scalc.rb'
    Kernel.last_output.should == 'The result is 6'
  end
end
