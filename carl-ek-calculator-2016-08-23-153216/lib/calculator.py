class Calculator:

    def __init__(self, value='', base = 10):
        self.expression = value
        self.base = base

    def add(self):
        # add comma separated values 
        # empty string gives 0
        if len(self.expression) == 0:
            return 0
        nums = self.expression.split(',')
        sum = 0
        for n in nums:
            sum += int(n, self.base)
                
        return sum
    
