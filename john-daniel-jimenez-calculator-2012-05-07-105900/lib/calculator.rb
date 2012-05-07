class Calculator
  def initialize expression
    @expression = expression
  end

  def expr
    @expression
  end

  def expr= expression
    @expression = expression
  end

  def add 
    if @expression == ''
      return 0
    elsif @expression.match /^\s*(\d+)\s*$/
      return $1.to_i
    elsif @expression.match /^\s*(\d+),(\d+)\s*$/
      return $1.to_i + $2.to_i
    end
  end
end
