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
  end

end
