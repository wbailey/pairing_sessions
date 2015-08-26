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

    def test_add_no_numbers(self):
        calc = Calculator("")
        self.assertEqual(calc.add(), 0)

    def test_add_a_single_number(self):
        calc = Calculator("1")
        self.assertEqual(calc.add(), 1)

    def test_add_two_numbers(self):
        calc = Calculator("1,2")
        self.assertEqual(calc.add(), 3)

    def test_add_three_numbers(self):
        calc = Calculator("1,2,3")
        self.assertEqual(calc.add(), 6)

    def test_add_five_numbers(self):
        calc = Calculator("1,2,3,4,5")
        self.assertEqual(calc.add(), 15)

    def test_invalid_digits(self):
        with self.assertRaises(ValueError):
            calc = Calculator("a,b")

    def test_invalid_separator(self):
        with self.assertRaises(ValueError):
            calc = Calculator("1;2")


if __name__ == '__main__':
    unittest.main()

