class Calculator(object):
    def __init__(self, expr):
        self.expr = expr

    def add(self):
        if self.expr == '':
            return 0
        numbers = self.expr.split(',')
        if not numbers:
            return 0
        return sum(map(int, numbers))

