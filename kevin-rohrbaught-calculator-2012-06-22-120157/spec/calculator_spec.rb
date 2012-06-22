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

    context "with one digit" do
      let(:expr){ '1' }
      its(:add){ should == 1 }
    end

    context "with no digits" do
      let(:expr){ '' }
      its(:add){ should == 0 }
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

    context "with less than two digits" do
      let(:expr) { '' }

      it "throws an exception with a single digit" do
        subject.expr = '1'
        expect {
          subject.diff
        } .should raise_exception

      end

      it "throws an exception with no digits" do
        subject.expr = ''
        expect {
          subject.diff
        }.should raise_exception
      end
    end
  end

  describe "#prod" do
    subject { Calculator.new expr }

    context "with one digit" do
      let(:expr){ "0" }
      its(:prod){ should == 0 }
    end

    context "with two digits" do
      let(:expr){ "2,1" }
      its(:prod){ should == 2 }
    end

    context "with three digits" do
      let(:expr){ "3,2,1" }
      its(:prod){ should == 6 }
    end
  end

  describe "#div" do
    subject { Calculator.new expr }

    context "with 2 digits" do
      let(:expr) { '2,1' }
      its(:div) { should == 2 }
    end

    context "with 3 digits" do
      let(:expr) { '1,2,3' }
      its(:div) { should == 0 }
    end

    context "expression contains 0" do
      let(:expr) { '3,0' }

      it "raises an exception" do
        expect { subject.div }.should raise_exception
      end
    end
  end
end
