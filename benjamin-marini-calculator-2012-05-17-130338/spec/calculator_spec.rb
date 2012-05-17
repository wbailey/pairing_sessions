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

  describe '#add' do
    it 'computes the empty expression' do
      c = Calculator.new
      c.add.should == 0
    end

    it 'computes a single digit expression' do
      c = Calculator.new '1'
      c.add.should == 1
    end

    it 'computes a two digit expression' do
      c = Calculator.new '1,2'
      c.add.should == 3
    end

    it 'rejects invalid expressions' do
      c = Calculator.new 'a,b'

      expect {
        c.add
      }.should raise_exception
    end

    it 'computes a mult-digit expression' do
      c = Calculator.new '1,2,3'
      c.add.should == 6

      c.expr = '1,2,5,8'
      c.add.should == 16
    end
  end
end
