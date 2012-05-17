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

    it 'only accepts valid expressions' do
      expect {
        c = Calculator.new 'a,b'
      }.should raise_exception
    end
  end

  describe '#expr' do
    it 'accesses the expression' do
      c = Calculator.new '1,2'
      c.expr.should == '1,2'
    end
  end

  describe '#expr=' do
    it 'resets the expression' do
      c = Calculator.new '1,2'
      c.expr.should == '1,2'
      c.expr = '3,4'
      c.expr.should == '3,4'
    end

    it 'only accepts valid expressions' do
      c = Calculator.new

      expect {
        c.expr = 'a,b'
      }.should raise_exception
    end
  end

  describe '#add' do
    it 'computes the emptry string' do
      c = Calculator.new
      c.add.should == 0
    end

    it 'computes a single digit expression' do
      c = Calculator.new '1'
      c.add.should == 1
    end

    it 'computes multi-digit expression' do
      c = Calculator.new '1,2'
      c.add.should == 3
      c.expr = '7,8'
      c.add.should == 15
    end
  end
end
