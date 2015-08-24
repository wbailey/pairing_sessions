class Calculator (object):
    expression = None

    def __init__ (self, string):
        self.assign(string)

    def assign (self, string):
        self.expression = string
        digits = string.split(",")
        map(int, digits)
        if len(digits) != 2:
            raise Exception("Too many parts!")

    def expr (self):
        return self.expression

