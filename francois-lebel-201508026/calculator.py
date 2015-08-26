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

    @property
    def expr(self):
        return ','.join(map(str, self.numbers))

    @expr.setter
    def set_expr(self, expr):
        self.numbers = self._expr_to_digits(expr)

