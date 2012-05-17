class Calculator

  def initialize(exp='')
    @expr = exp if self.valid?(exp)
  end

  def expr
    @expr
  end

  def expr=(exp)
    @expr = exp if self.valid?(exp)
  end

  def add
    sum = 0
    if @expr == ''
      return sum
    else
      nums = @expr.split(',')
      nums.each do |n|
        sum = sum + n.to_i
      end
    end
    sum
  end

  def valid?(exp)
    nums = exp.split(',')
    nums.each do |n|
      raise Exception, 'only digits allowed' unless n.match(/[0-9,]/)
    end
  end

end
