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
    it '#rows' do
      board = AsciiTicTacToe.new
      board.rows == 3
    end

    it '#columns' do
      board = AsciiTicTacToe.new
      board.columns == 3
    end

    it '#spaces' do
      board = AsciiTicTacToe.new
      board.spaces == 9
    end
  end
end
