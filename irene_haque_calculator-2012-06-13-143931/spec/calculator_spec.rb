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

    it 'rejects non-string expressions' do
      expect {
        Calculator.new 4
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

  describe '#add' do
    it 'handles the empty expression' do
      c = Calculator.new
      c.add.should == 0
    end

    it 'computes single digit expression' do
      c = Calculator.new '1'
      c.add.should == 1

      c.expr = '9'
      c.add.should == 9
    end

    it 'computes double digit expressions' do
      c = Calculator.new '1,2'
      c.add.should == 3

      c.expr = '3,4'
      c.add.should == 7
    end

    it 'computes multi-digit expressions' do
      c = Calculator.new '1,2,3'
      c.add.should == 6

      c.expr = '1,2,5,8'
      c.add.should == 16
    end
  end

  describe '#diff' do
    it 'rejects expression with less than 2 digits' do
      c = Calculator.new '1'

      expect {
        c.diff
      }.should raise_exception
    end

    it 'computes valid expressions' do
      c = Calculator.new '3,2,1'
      c.diff.should == 0

      c.expr = '5,4,3,2,1'
      c.diff.should == -5

      c.expr = '1,0'
      c.diff == 1
    end
  end
end
