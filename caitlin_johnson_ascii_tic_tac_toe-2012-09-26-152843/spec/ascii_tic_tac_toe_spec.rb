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

    it 'identifies the first row by 1' do
      subject.row[0].should == 1
    end

    it 'identifies the first row by 2' do
      subject.row[1].should == 2
    end

    it 'identifies the first row by 3' do
      subject.row[2].should == 3
    end

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

  describe 'pieces' do
    it 'allows o' do
      subject.pieces.include?('o').should be_true
    end

    it 'allows x' do
      subject.pieces.include?('x').should be_true
    end
  end
end
