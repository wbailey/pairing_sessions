require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "new" do
    it "should instantiate" do
      expect {
        Calculator.new
      }.should_not raise_exception
    end

    it 'accepts expression' do
      expect {
        Calculator.new '1,2'
      }.should_not raise_exception
    end
  end

  describe '#expr' do
    it 'provides expression' do
      c = Calculator.new '1,2'
      c.expr.should == '1,2'
    end
  end

  describe '#expr=' do
    it 'allows expression definition' do
      c = Calculator.new '1,2'
      c.expr = '3,4'
      c.expr.should == '3,4'
    end
  end
end
