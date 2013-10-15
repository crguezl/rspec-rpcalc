#require File.join(File.dirname(__FILE__), "/../spec_helper")
require "spec_helper"
module Math
  describe RPCalc do
    before :each do
      @c = Math::RPCalc.new
    end

    context "When an erroneous input is given" do
      context "not numeric input" do
        before :each do
          @e = proc { @c.calc('a') }
        end

        it "must raise an exception for not numeric input" do
          expect { @e[] }.to raise_error(SyntaxError)
          expect { @e[] }.to raise_error("Error. found 'a'. Expected number or operator")
        end
      end

      context "not enough operands" do
        it "must raise an exception when not enough operands" do
          expect { @c.calc('2 3 + *') }.to raise_error(SyntaxError)
          expect { @c.calc('2 3 + *') }.to raise_error("No second argument for '*'")
        end
      end
    end

    context "When a correct input is given" do
      it "must give the correct answer for integer expressions" do
        r = @c.calc('2 3 + 4 *')
        r.should eq 20
        @c.stack.should eq []
      end

      it "must give the correct answer for float expressions" do
        r = @c.calc('4 3 + 2.5 3.5 +')
        r.should be_within(0.01).of(6.0)
        @c.stack.should eq [ 7 ]
      end
    end

  end    # RPCalc
end      # Math
