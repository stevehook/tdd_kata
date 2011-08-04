require './kernel_extensions'

describe "Calculator command-line" do
  before(:each) do
    Kernel.reset_io_fakes
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

  it "should accept input for next calculation, print the result and prompt for more input" do
    ARGV[0] = '1,2,3'
    Kernel.next_input = ['1,2,3,4']
    load './scalc.rb'
    Kernel.last_output.length.should == 4
    Kernel.last_output[0].should == 'The result is 6'
    Kernel.last_output[1].should == 'another input please'
    Kernel.last_output[2].should == 'The result is 10'
    Kernel.last_output[3].should == 'another input please'
  end
end
