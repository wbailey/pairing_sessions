class Calculator
  class CalculatorError < StandardError; end
  class InvalidExpressionError < CalculatorError; end

  attr_accessor :expr

  def initialize(expr='0')
    @expr = expr
  end

  def add
    numbers.inject { |sum, num| sum + num }
  end

  def diff
    raise InvalidExpressionError if numbers.size < 2
    numbers.inject { |diff, num| diff - num }
  end

  def prod
    numbers.inject { |prod, num| prod * num }
  end

  def div
    raise InvalidExpressionError if numbers.include?(0)
    numbers.inject { |quot, num| quot / num }
  end

  private
  def numbers
    raise InvalidExpressionError unless valid_expr?
    @expr.split(',').map(&:to_i)
  end

  def valid_expr?
    @expr =~ /(\d+,?)+/
  end
end
