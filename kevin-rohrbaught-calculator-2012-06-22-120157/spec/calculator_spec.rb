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
  end
  
  describe "#add" do
    subject { Calculator.new expr }

    context "with no values" do
      let(:expr){ '' }
      its(:add){ should == 0 }
    end

    context "with one digit" do
      let(:expr){ '1' }
      its(:add){ should == 1 }
    end

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
  end
end
