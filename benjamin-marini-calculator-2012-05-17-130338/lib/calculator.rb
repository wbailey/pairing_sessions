class Calculator
  class CalculatorError < StandardError; end
  class InvalidExpressionError < CalculatorError; end

  attr_accessor :expr

  def initialize(expr='')
    @expr = expr
  end

  def add
    numbers.inject(0) { |sum, num| sum + num }
  end

  private
  def numbers
    raise InvalidExpressionError unless valid_expr?
    @expr.split(',').map(&:to_i)
  end

  def valid_expr?
    @expr == '' || @expr =~ /(\d+,?)+/
  end
end
