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
    return 0 if expr.nil?
    expr.split(",").inject(0) { |sum, char| sum += char.to_i } unless expr.nil?
  end

  def diff
    digits = expr.split(",")
    raise Exception if digits.length < 2
    digits[1..-1].inject(digits[0].to_i) { |diff,d| diff -= d.to_i }
  end
end
