require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "new" do
    it "should instantiate" do
      expect {
        Calculator.new
      }.should_not raise_exception
    end

    it 'accepts valid expression' do
      expect {
        Calculator.new '1,2'
      }.should_not raise_exception

      expect {
        Calculator.new '3,4'
      }.should_not raise_exception
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

    it 'rejects invalid expresssions' do
      expect {
        Calculator.new 'a,v'
      }.should raise_exception

      expect {
        Calculator.new '1,,3'
      }.should raise_exception
    end
  end

  describe '#add' do
    it 'computes empty expression' do
      c = Calculator.new
      c.add.should == 0
    end

    it 'computes single digit expression' do
      c = Calculator.new '1'
      c.add.should == 1
    end

    it 'computes two digit expressions' do
      c = Calculator.new '1,2'
      c.add.should == 3
      c.expr = '3,4'
      c.add.should == 7
    end

    it 'computes multi-digit expression' do
      c = Calculator.new
      c.expr = '1,2,3'
      c.add.should == 6
      c.expr = '1,2,5,8'
      c.add.should == 16
    end
  end
end
