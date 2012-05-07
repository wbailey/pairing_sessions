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
    if @expression == ''
      return 0
    elsif @expression.match /^\s*(\d+)\s*$/
      return $1.to_i
    elsif @expression.match /\d+,\d+/
      sum = 0
      @expression.split(',').each {|diget| sum += diget.to_i }
      return sum
    end
  end
end
