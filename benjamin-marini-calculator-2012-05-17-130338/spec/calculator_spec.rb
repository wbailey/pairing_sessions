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

  describe '#diff' do
    it 'computes differences for two digit expressions' do
      c = Calculator.new '1,0'
      c.diff.should == 1
    end

    it 'computes differences for multi-digit expressions' do
      c = Calculator.new '5,4,3,2,1'
      c.diff.should == -5
    end

    it 'rejects invalid expressions' do
      c = Calculator.new '5'

      expect {
        c.diff
      }.should raise_exception
    end
  end

  describe '#prod' do
    it 'computes a single digit expression' do
      c = Calculator.new '0'
      c.prod.should == 0

      c.expr = '1'
      c.prod.should == 1

      c.expr = '5'
      c.prod.should == 5
    end

    it 'computes two digit expressions' do
      c = Calculator.new

      c.expr = '1,2'
      c.prod.should == 2

      c.expr = '3,2'
      c.prod.should == 6
    end

    it 'computes multi-digit expressions' do
      c = Calculator.new

      c.expr = '1,2,3'
      c.prod.should == 6

      c.expr = '5,4,3,2,1,0'
      c.prod.should == 0
    end
  end
end
