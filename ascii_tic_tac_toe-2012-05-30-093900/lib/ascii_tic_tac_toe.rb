class AsciiTicTacToe
  def initialize
    @board = [[1,2,3],[4,5,6],[7,8,9]]
    @pieces = ['o', 'x']
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

  def pieces
    return @pieces
  end
end
