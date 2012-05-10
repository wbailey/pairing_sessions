require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "new" do
    it "should instantiate" do
      expect {
        Calculator.new
      }.should raise_exception
    end

    it 'accepts valid expression' do
      expect {
        Calculator.new '1,2'
      }.should_not raise_exception

      expect {
        Calculator.new '3,4'
      }.should_not raise_exception
    end

    it 'rejects invalid expresssions' do
      expect {
        Calculator.new 'a,v'
      }.should raise_exception
    end
  end

  describe '#expr' do
    it 'access expression' do
      c = Calculator.new '1,2'
      c.expr.should == '1,2'
    end
  end

  describe '#expr=' do
    it 'assigns expression' do
      c = Calculator.new '1,2'
      c.expr = '3,4'
      c.expr.should == '3,4'
    end
  end
end
