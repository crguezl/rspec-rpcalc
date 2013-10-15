#require File.join(File.dirname(__FILE__), "/../spec_helper")
require "spec_helper"
module Math
  describe RPCalc do
    before :each do
      @c = Math::RPCalc.new
    end

    context "When an erroneous input is given" do
      before :each do
        @e = proc { @c.calc('a') }
      end
      it "must raise an exception" do
        expect { @e[] }.to raise_error(SyntaxError)
        expect { @e[] }.to raise_error("Error. found 'a'. Expected number or operator")
      end
    end
  end
end
