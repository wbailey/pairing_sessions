class Calculator
  attr_accessor :expr

  def initialize(expr = '1,2')
    @expr = expr
    parse_expr
  end

  def expr=(expr)
    @expr = expr
    parse_expr
  end

  def add
    @digits.inject(:+) || 0
  end

  def diff
    @digits.inject(:-) || 0
  end

private
  def parse_expr
    @digits = Array(expr.split(',')).map(&:to_i)

    raise if @digits.size < 2
  end
end
