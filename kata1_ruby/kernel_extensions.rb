module Kernel
  class << self
    attr_accessor :last_output
  end

  def puts(output)
    Kernel.last_output ||= []
    Kernel.last_output << output.to_s
  end
end
