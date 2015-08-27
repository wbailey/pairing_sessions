import re

class Calculator:
    def __init__(self, expression):
        res = expression.split(",")
        for r in res:
            if re.match("^\d$", r) != True:
                raise RuntimeError

        self.expr = expression
        return;
