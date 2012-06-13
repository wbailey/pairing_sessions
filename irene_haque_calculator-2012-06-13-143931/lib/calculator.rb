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
end
