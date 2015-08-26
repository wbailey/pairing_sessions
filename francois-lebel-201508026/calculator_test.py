import unittest

from calculator import Calculator


class TestStringMethods(unittest.TestCase):
    def test_instantiation(self):
        new_value = "1,2"
        calc = Calculator(new_value)
        self.assertEqual(calc.expr, new_value)

    def test_instantiate_and_change_expr(self):
        calc = Calculator("1,2")
        new_value = "3,4"
        calc.expr = new_value
        self.assertEqual(calc.expr, new_value)

if __name__ == '__main__':
    unittest.main()

