require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "new" do
    it "should instantiate" do
      expect {
        Calculator.new
      }.should_not raise_exception
    end
  end

  context "initialized with expression" do
    let(:expr) { '1,2' }
    subject { Calculator.new expr }

    its(:expr) { should == expr }
  end

  describe "#expr" do
    let(:expr) { '1,2' }

    it "returns the value" do
      subject.expr = expr
      subject.expr.should == expr
    end

    context "with less than two digits" do
      it "throws an excpeption with a single digit" do
        expect { Calculator.new('1') }.should raise_exception
      end

      it "throws an exception with no digits" do
        expect { Calculator.new('') }.should raise_exception
      end
    end
  end
  
  describe "#add" do
    subject { Calculator.new expr }

    context "with two digits" do
      let(:expr){ '1,2' }
      its(:add){ should == 3 }
    end

    context "with three digits" do
      let(:expr) { '1,2,3' }
      its(:add) { should == 6 }
    end

    context "with four digits" do
      let(:expr) { '1,2,5,8' }
      its(:add) { should == 16 }
    end

    context "after updating expr" do
      let(:expr) { '1,2' }
      before do 
        subject.expr = '1,2,3'
      end

      its(:add) { should == 6 }
    end
  end

  describe "#diff" do
    subject { Calculator.new expr }

    context "with two digits" do
      let(:expr){ "1,0" }
      its(:diff){ should == 1 }
    end

    context "with three digits" do
      let(:expr){ "3,2,1" }
      its(:diff){ should == 0 }
    end

    context "with more than two digits" do
      let(:expr){ "5,4,3,2,1" }
      its(:diff){ should == -5 }
    end
  end

end
