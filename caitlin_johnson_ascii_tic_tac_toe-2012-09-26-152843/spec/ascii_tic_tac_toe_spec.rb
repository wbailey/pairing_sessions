require 'spec_helper'
require 'ascii_tic_tac_toe'

describe AsciiTicTacToe do
  describe "#initialize" do
    it "instantiates" do
      expect {
        AsciiTicTacToe.new
      }.should_not raise_exception
    end
  end
end
