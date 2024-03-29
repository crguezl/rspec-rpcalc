module Math
  class RPCalc
    attr_accessor :stack

    def initialize()
      @stack = []
    end

    def calc(expr)
      @stack = []
      expr.split(/\s+/).each do |x|
      case x
        when '+', '*', '-', '/' 
          op2 = @stack.pop or raise SyntaxError, "No first argument for '#{x}'"
          op1 = @stack.pop or raise SyntaxError, "No second argument for '#{x}'"
          @stack.push eval "(#{op1} #{x} #{op2})"
        when /^-?\s*\d+(\.\d+)?([eE][+-]?\d+)?\s*$/
          @stack.push x
        else
          raise SyntaxError, "Error. found '#{x}'. Expected number or operator"       
        end
      end
      @stack.pop
    end

  end  # class RPCalc
end    # Math



