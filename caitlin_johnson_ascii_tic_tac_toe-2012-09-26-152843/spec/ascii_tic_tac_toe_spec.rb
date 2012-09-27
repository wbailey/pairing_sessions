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

  describe 'board' do
    it 'has 3 rows' do
      subject.rows.should == 3
    end

    it 'has 3 columns' do
      subject.columns.should == 3
    end

    describe '#row' do
      it 'identifies the first row by 1' do
        subject.row[0].should == 1
      end

      it 'identifies the first row by 2' do
        subject.row[1].should == 2
      end

      it 'identifies the first row by 3' do
        subject.row[2].should == 3
      end
    end

    describe '#column' do
      it 'identifies the first column by 1' do
        subject.column[0].should == 1
      end

      it 'identifies the first column by 2' do
        subject.column[1].should == 2
      end

      it 'identifies the first column by 3' do
        subject.column[2].should == 3
      end
    end
  end

  describe '#pieces' do
    it 'allows o' do
      subject.pieces.include?('o').should be_true
    end

    it 'allows x' do
      subject.pieces.include?('x').should be_true
    end
  end

  describe '#move' do
    it 'allows valid grid and piece' do
      expect {
        subject.move(1,1,'x')
      }.should_not raise_exception
    end

    it 'rejects invalid grid' do
      expect {
        subject.move(4,4,'x')
      }.should raise_exception /InvalidMove/
    end

    it 'rejects invalid grid' do
      expect {
        subject.move(0,0,'x')
      }.should raise_exception /InvalidMove/
    end

    it 'reject invalid piece' do
      expect {
        subject.move(2,2,'z')
      }.should raise_exception /InvalidMove/
    end

    it 'rejects move to occupied space' do
      expect {
        subject.move(2,2,'x')
        subject.move(2,2,'o')
      }.should raise_exception /OccupiedSpace/
    end
  end

  describe '#display' do
    it 'allows a board to be printed' do
      expect {
        subject.display
      }.should_not raise_exception
    end

    it 'an empty board' do
      subject.should_receive(:puts).exactly(3).times.with('***')
      subject.display
    end

    it 'an o in the center' do
      subject.should_receive(:puts).with('***')
      subject.should_receive(:puts).with('*o*')
      subject.should_receive(:puts).with('***')
      subject.move(2,2,'o')
      subject.display
    end
  end
end
