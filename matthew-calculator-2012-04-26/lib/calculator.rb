class Calculator
  attr_accessor :expr

  def initialize(args = nil)
    self.expr = args
  end

  def expr=(args)
    @expr = args
    return unless args
    int_check =  /^[0-9]+$/   
    @expr.to_s.split(/,/).each { |a| raise ArgumentError unless a.match(int_check) }
  end

  def add
    args = self.expr.to_s.split(/,/)

    return case args.size
    when 0
      0
    when 1
      args[0].to_i
    else
      args.inject(0) { | sum, e| sum + e.to_i }
    end
  end
end
