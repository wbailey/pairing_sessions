require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "new" do
    it "should instantiate" do
      lambda {
        Calculator.new
      }.should_not raise_exception
    end

    it 'does not allow' do
      expect {
        Calculator.new 'a,b'
      }.should raise_exception
    end
  end

  describe "#expr=" do
    it 'allows to reset expr' do
      calculator = Calculator.new '1,2'
      calculator.expr='2,4'
      calculator.expr.should == '2,4'
    end
  end

  describe '#add' do
    it 'computes nil string' do
      c = Calculator.new
      c.add.should == 0
    end

    it 'computes single character string' do
      c = Calculator.new '1'
      c.add.should == 1
      c.expr = '4'
      c.add.should == 4
    end

    it 'computes 2 character strings' do
      c = Calculator.new '1,2'
      c.add.should == 3
      c.expr = '4,5'
      c.add.should == 9
    end

    it 'computes expressions containing multiple digits' do
      c = Calculator.new '1,2,3'
      c.add.should == 6
      c.expr = '1,2,5,8'
      c.add.should == 16
    end
  end

  describe '#diff' do
    it 'rejects empty expression' do
      expect {
        c = Calculator.new
        c.diff
      }.should raise_exception
    end

    it 'rejects expressions with a number' do
      expect {
        c = Calculator.new
        c.expr = '1'
        c.diff
      }.should raise_exception
    end

    it 'computes expressions with 2 numbers' do
      c = Calculator.new '1,0'
      c.diff.should == 1
      c.expr = '5,4'
      c.diff.should == 1
      c.expr = '10,7'
      c.diff.should == 3
    end

    it 'computes consecutive differences with more than 2 numbers' do
      c = Calculator.new '5,4,3,2,1'
      c.diff.should == -5
      c.expr = '3,2,1'
      c.diff.should == 0
    end
  end
end
