class Calculator
  def initialize expression=''
    @expression = expression
  end

  def expr
    @expression
  end

  def expr= expression
    @expression = expression
  end

  def add 
    @expression.split(',').inject(0) {|s,v| s += v.to_i}
  end
end
