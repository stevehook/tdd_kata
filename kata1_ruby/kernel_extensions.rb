module Kernel
  class << self
    attr_accessor :last_output, :next_input, :next_input_index

    def reset_io_fakes
      Kernel.last_output = nil
      Kernel.next_input = nil
      Kernel.next_input_index = 0
    end
  end

  def puts(output)
    Kernel.last_output ||= []
    Kernel.last_output << output.to_s
  end

  def gets
    input = Kernel.next_input.nil? ? nil : Kernel.next_input[Kernel.next_input_index]
    Kernel.next_input_index += 1
    input
  end
end
