class Calculator(object):
    def _expr_to_digits(self, expr):
        if expr == '':
            return [0]
        return map(int, expr.split(','))

    def __init__(self, expr):
        self.numbers = self._expr_to_digits(expr)

    def add(self):
        if not self.numbers:
            return 0
        return sum(self.numbers)
    
    def diff(self):
        if len(self.numbers) < 2:
            raise ValueError("Diff takes at least two numbers.")
        return reduce(lambda x, y: x - y, self.numbers)
 
    def div(self):
        if 0 in self.numbers:
            raise ValueError('Cannot divide by 0!')
        return reduce(lambda x, y: x / y, self.numbers)

    def prod(self):
        return reduce(lambda x, y: x * y, self.numbers)

    @property
    def expr(self):
        return ','.join(map(str, self.numbers))

    @expr.setter
    def set_expr(self, expr):
        self.numbers = self._expr_to_digits(expr)

