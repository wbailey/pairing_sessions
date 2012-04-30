require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "new" do
    it "should instantiate" do
      lambda {
        Calculator.new '1,2'
      }.should_not raise_exception
    end

    it 'rejects invalid expressions' do
      expect {
        Calculator.new 'a,b'
      }.should raise_exception
    end
  end

  context 'expressions' do
    subject { Calculator.new '1,2' }

    describe '#expr' do
      it 'returns expression' do
        subject.expr.should == '1,2'
      end
    end

    describe '#expr=' do
      it 'accepts any expression' do
        subject.expr = '3,4'
        subject.expr.should == '3,4'
      end
    end

    describe '#sum' do
      it 'The method will return the sum of the digits' do
        subject.sum.should == 3
      end

      it 'sums to zero' do
        Calculator.new.sum.should == 0

        Calculator.new('0').sum.should == 0
      end

      it 'sums to 1' do
        Calculator.new('1').sum.should == 1
      end
    end
  end
end
