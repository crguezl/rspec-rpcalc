module Math
  class RPCalc
    attr_accessor :stack

    def initialize()
      @stack = []
    end

    def calc(expr)
      @stack = []
      expr.split(/\s+/).each do |x|
        raise SyntaxError, "Error. found '#{x}'. Expected number or operator" 
      end
      @stack.pop
    end

  end  # class RPCalc
end    # Math



