require 'spec_helper'
require 'ascii_tic_tac_toe'

describe AsciiTicTacToe do
  subject { AsciiTicTacToe.new }

  describe "new" do
    it "should instantiate" do
      expect {
        AsciiTicTacToe.new
      }.should_not raise_exception
    end
  end

  context 'board' do
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

  context '#move' do
    it 'allows valid' do
      subject.move(1, 1, 'o').should be_true
    end

    it 'rejects moves to occupied spaces' do
      expect {
        subject.move(1,1,'o')
        subject.move(1,1,'x')
      }.should raise_exception
    end


    context 'rejects illegal board spaces' do
      it 'respects bottom right boundary' do
        expect {
          subject.move(4, 4, 'o')
        }.should raise_exception
      end

      it 'respects bottom left boundary' do
        expect {
          subject.move(3, 0, 'o')
        }.should raise_exception
      end

      it 'respect top left boundardy' do
        expect {
          subject.move(1, 4, 'o')
        }.should raise_exception
      end

      it 'respect top right boundary' do
        expect {
          subject.move(4, 1, 'o')
        }.should raise_exception
      end
    end

    it 'rejects invalid pieces' do
      expect {
        subject.move(1, 2, 'z')
      }.should raise_exception
    end
  end
end
