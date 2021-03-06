class AsciiTicTacToe

  def initialize
    @row = [1,2,3]
    @column = [1,2,3]
    @pieces = %w/o x/

    @board = Array.new(rows) { |row| row = Array.new(columns) {|column| column = '*' } }
  end
 
  def rows
    @row.size
  end

  def columns
    @column.size
  end

  def row
    @row
  end

  def column
    @column
  end

  def pieces
    @pieces
  end

  def move(r, c, piece)
    unless ( (row.include? r) && (column.include? c) && (pieces.include? piece) )
      raise InvalidMove, 'Invalid grid or piece'
    end
    unless (@board[r-1][c-1] == '*')
      raise OccupiedSpace, "A piece has already been played at #{r} #{c}"
    end
    @board[r-1][c-1] = piece
  end

  def display
    @board.each {|row| puts row[0] + row[1] + row[2] }
  end
end
