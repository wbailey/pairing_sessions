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
    it 'returns expression' do
      c = Calculator.new '1,2'
      c.expr.should == '1,2'
    end

    it 'only allows valid string' do
      expect {
        Calculator.new 'a,v'
      }.should raise_exception
    end
  end

  describe '#expr=' do
    it 'assigns new expression' do
      c = Calculator.new
      c.expr = '3,4'
      c.expr.should == '3,4'
    end

    it 'only allows valid string' do
      c = Calculator.new '1,2'

      expect {
        c.expr = 'a,b'
      }.should raise_exception
    end
  end
end
