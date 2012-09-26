class AsciiTicTacToe

  def initialize
    @row = [1,2,3]
    @column = [1,2,3]
    @pieces = %w/o x/
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

end
