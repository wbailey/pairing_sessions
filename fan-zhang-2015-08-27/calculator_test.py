import unittest
from calculator import Calculator

class TestStringMethods(unittest.TestCase):
    def test_expression(self):
        calc = Calculator("1,2")
        self.assertEqual(calc.expr, "1,2")

    def test_invalid_expression(self):
        with self.assertRaises(RuntimeError):
            Calculator("a,b")
        
if __name__ == '__main__':
    unittest.main()
