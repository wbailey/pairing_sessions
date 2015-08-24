class Calculator (object):
    expression = None
    digits = []

    def __init__ (self, string):
        self.expr(string)

    def expr (self, string=None):
        if not string:
            return self.expression
        self.expression = string
        if string != "":
            parts = string.split(",")
            self.digits = map(int, parts)

    def add (self):
        return reduce(lambda a,b: a + b, self.digits, 0)

    def diff (self):
        if len(self.digits) < 2:
            raise Exception("Not enough parts!")

        return reduce(lambda a,b: a - b, self.digits)
