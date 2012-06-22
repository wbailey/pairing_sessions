class Calculator
  attr_accessor :expr

  def initialize(expr = '')
    @expr = expr
    @digits = Array(expr.split(',')).map(&:to_i)
  end

  def add
    @digits.inject(:+) || 0
  end
end
