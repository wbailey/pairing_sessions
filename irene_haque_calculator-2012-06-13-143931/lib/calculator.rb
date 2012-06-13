class Calculator
  attr_accessor :expr

  def initialize(expr=nil)
    self.expr = expr
  end

  def expr= (expr)
    if expr
      expr.split(",").each { |char| raise Exception unless char.match(/\d/) }
    end

    @expr = expr
  end

  def add
    sum = 0
    digits = expr.split(",").each { |char| sum += char.to_i } unless expr.nil?
    sum
  end

  def diff
    digits = expr.split(",")
    raise Exception if digits.length < 2
    diff = digits[0].to_i
    digits[1..-1].each { |d| diff -= d.to_i }
    diff
  end
end
