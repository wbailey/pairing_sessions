class Calculator (object):
    expression = None
    digits = []

    def __init__ (self, string):
        self.assign(string)

    def assign (self, string):
        self.expression = string
        if string != "":
            parts = string.split(",")
            self.digits = map(int, parts)

    def expr (self):
        return self.expression

    def add (self):
        return reduce(lambda a,b: a + b, self.digits, 0)
