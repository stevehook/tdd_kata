module Kernel
  class << self
    attr_accessor :last_output, :next_input
  end

  def puts(output)
    Kernel.last_output ||= []
    Kernel.last_output << output.to_s
  end

  def gets
    Kernel.next_input
  end
end
