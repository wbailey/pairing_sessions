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
end
