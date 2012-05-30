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
end
