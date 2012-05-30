class AsciiTicTacToe
  def initialize
    @board = [[1,2,3],[4,5,6],[7,8,9]]
  end

  def rows
    @board.count
  end

  def spaces
    @board.first.count * @board.count
  end

  def columns
    @board.first.count
  end
end
