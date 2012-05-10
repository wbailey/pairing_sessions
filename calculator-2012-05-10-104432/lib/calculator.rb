class Calculator

  def initialize(expressn)
    args = expressn.split(/,/)
    @expr = expressn
    raise "Invalid expression" unless  (args[0] =~ /^\d+$/) && (args[1] =~ /^\d+$/)
  end

  def expr
    @expr
  end

  def expr= (expressn)
    @expr = expressn
  end
end
