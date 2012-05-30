require 'spec_helper'
require 'ascii_tic_tac_toe'

describe AsciiTicTacToe do
  describe "new" do
    it "should instantiate" do
      expect {
        AsciiTicTacToe.new
      }.should_not raise_exception
    end
  end

  context 'board' do
    subject { AsciiTicTacToe.new }

    it '#rows' do
      subject.rows == 3
    end

    it '#columns' do
      subject.columns == 3
    end

    it '#spaces' do
      subject.spaces == 9
    end
  end

  context 'pieces' do
    it "defines 'o'" do
      subject.pieces.include?('o').should be_true
    end

    it "defines 'x'" do
      subject.pieces.include?('x').should be_true
    end
  end
end
