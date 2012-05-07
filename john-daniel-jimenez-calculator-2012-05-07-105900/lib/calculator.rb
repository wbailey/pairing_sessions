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

  def diff
    digits = @expression.split(',')
    raise ArgumentError if digits.size < 2
    first = digits.shift.to_i
    digits.inject(first) {|s,v| s -= v.to_i}
  end

  def prod
    @expression.split(',').inject(1) {|s,v| s *= v.to_i}
  end

end
