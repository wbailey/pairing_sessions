class AsciiTicTacToe
  def initialize
    @board = [['','',''],['','',''],['','','']]
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

  def move(row, column, piece)
    if row < 1 || row > self.rows
      raise "invalid move"
    end

    if column < 1 || column > self.columns
      raise "invalid move"
    end

    if @board[row-1][column-1].empty?
      @board[row-1][column-1] = piece
    else
      raise "invalid move"
    end

  end
end
