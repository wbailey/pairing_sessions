class Calculator
  attr_accessor :expr

  def initialize(expression="")
    begin
      elements = expression.split(",")
      elements.each {|element| eval(element)}
      self.expr = expression
    rescue e
    end
  end

  def sum
    elements = expr.split(',')
    if elements.empty?
      result = 0
    else
      result = elements.reduce{|s, e| e.to_i + s.to_i }.to_i
    end
    result
  end
end
