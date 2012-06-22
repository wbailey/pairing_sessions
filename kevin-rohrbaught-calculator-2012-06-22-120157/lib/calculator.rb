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
    calculate(:+)
  end

  def diff
    raise if @digits.size < 2
    calculate(:-)
  end

  def div
    calculate(:/)
  end

  def prod
    calculate(:*)
  end

private
  def parse_expr
    @digits = Array(expr.split(',')).map(&:to_i)
  end

  def calculate(operator)
    @digits.inject(operator) || 0
  end
end
