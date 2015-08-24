class Calculator (object):
    expression = None
    first_num = 0
    second_num = 0

    def __init__ (self, string):
        self.assign(string)

    def assign (self, string):
        self.expression = string
        if string != "":
            parts = string.split(",")
            if len(parts) > 2:
                raise Exception("Too many parts!")
            print parts
            digits = map(int, parts)
            if digits[0]:
                self.first_num = digits[0]
            if len(digits) > 1 and digits[1]:
                self.second_num = digits[1]

    def expr (self):
        return self.expression

    def add (self):
        return self.first_num + self.second_num
    
