require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "#new" do

    it "does require expression" do
      expect {
        Calculator.new
      }.should_not raise_exception
    end

    it 'accepts expression' do
      expect {
        Calculator.new '1,2'
      }.should_not raise_exception
    end

    it 'expression is accessible via expr' do
      c = Calculator.new '1,2'
      c.expr.should == '1,2'
    end

    it 'allows assignment' do
      c = Calculator.new '1,2'
      c.expr.should == '1,2'
      c.expr = '3,4'
      c.expr.should == '3,4'
    end
  end

  describe '#add' do
    it 'evaluates empty expression' do
      c = Calculator.new
      c.add.should == 0
    end

    it 'evaluates single character expression' do
      c = Calculator.new '1'
      c.add.should == 1
    end

    it 'evaluates two character expression' do
      c = Calculator.new '1,2'
      c.add.should == 3
      c.expr = '3,4'
      c.add.should == 7
    end

    it 'evaluates multi-character expressions' do
      c = Calculator.new '1,2,3'
      c.add.should == 6
      c.expr = '1,2,5,8'
      c.add.should == 16
    end
  end

  describe '#diff' do
    it 'requires at least a 2 digits expression' do
      c = Calculator.new

      expect {
        c.diff
      }.should raise_exception

      c = Calculator.new '5'

      expect {
        c.diff
      }.should raise_exception

      c = Calculator.new '2,1'

      expect {
        c.expr = '4'
        c.diff
      }.should raise_exception
    end

    it 'computes consecutive differences' do
      c = Calculator.new '1,0'
      c.diff.should == 1
      c.expr = '3,2,1'
      c.diff.should == 0
      c.expr = '5,4,3,2,1'
      c.diff.should == -5
    end
  end

  describe '#prod' do
    it 'multiplies single character expressions' do
      c = Calculator.new '1'
      c.prod.should == 1
      c.expr = '0'
      c.prod.should == 0
    end

    it 'multiplies two character expressions' do
      c = Calculator.new '1'
      c.expr = '3,2'
      c.prod.should == 6
    end


    it 'multiplies multi ( more than two ) character expressions' do
      c = Calculator.new '1'
      c.expr = '3,2,3'
      c.prod.should == 18
    end

  end
end
