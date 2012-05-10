class Calculator

  def initialize(expressn="")
    args = expressn.split(/,/)
    @expr = expressn
    args.each do |arg|
      raise 'Invalid expression' unless arg =~ /^\d$/
    end

  end

  def add
    numbers = expr.split(/,/)
    numbers.inject(0){|acc,number| acc += number.to_i }
  end

  def expr
    @expr
  end

  def expr= (expressn)
    @expr = expressn
  end
end
