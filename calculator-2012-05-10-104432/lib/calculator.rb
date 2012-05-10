class Calculator

  def initialize(expressn="")
    self.expr = expressn
  end

  def add
    numbers = expr.split(/,/)
    numbers.inject(0){|acc,number| acc += number.to_i }
  end

  def diff
    numbers = expr.split(/,/)
    raise 'Cannot take the diff on fewer than 2 arguments' if numbers.length < 2
    numbers[1..-1].inject(numbers[0].to_i){|acc,number| acc -= number.to_i }
  end

  def expr
    @expr
  end

  def expr= (expressn)
    args = expressn.split(/,/)

    args.each do |arg|
      raise 'Invalid expression' unless arg =~ /^\d$/
    end

    @expr = expressn
  end
end
