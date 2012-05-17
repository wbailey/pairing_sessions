require 'spec_helper'
require 'calculator'

describe Calculator do
  describe "#new" do
    it 'should instantiate' do
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
end
