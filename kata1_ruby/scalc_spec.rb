require './kernel_extensions'

describe "Calculator command-line" do
  before(:each) do
    Kernel.last_output = nil
  end

  it 'should run' do
    load './scalc.rb'
  end

  it 'should print the result' do
    ARGV[0] = '1,2,3'
    load './scalc.rb'
    Kernel.last_output.length.should == 2
    Kernel.last_output[0].should == 'The result is 6'
    Kernel.last_output[1].should == 'another input please'
  end

  it "should exit when an empty string is given" do
    pending
  end
end
