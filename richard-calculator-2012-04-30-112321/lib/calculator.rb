class Calculator
  attr_accessor :expr

  def initialize expression=nil
    self.expr = expression
  end

  def expr= expression
    return if expression.nil?

    validation(expression)

    @expr= expression
  end

  def add
    return 0 if self.expr.nil?
    return numbers.inject(0) {|sum, i| sum += i.to_i }
  end
  
  def diff
    raise if numbers.size < 2
    return numbers[1..-1].inject(numbers[0].to_i) {|sum, i| sum -= i.to_i }
  end

  private

  def numbers
    self.expr.split(',')
  end

  def validation( expression )
    raise if expression.split(/,/).select{|x| !x.match /\d+/  }.any?
  end
end
