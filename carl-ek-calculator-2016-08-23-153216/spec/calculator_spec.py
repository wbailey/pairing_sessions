from calculator import Calculator
import unittest

class InstantiateTestCase(unittest.TestCase):
    def test_invalid_class_name_instantiation(self):
        try:
            calc = Calculater()
            result = 0
        except:
            result = 1
        finally:
            self.assertEqual(result, 1)

    def test_invalid_string_instantiation(self):
        try:
            calc = Calculator("a,")
            result = 0
        except:
            result = 1
        finally:
            self.assertEqual(result, 1)

    def test_null_instantiation(self):
        try:
            calc = Calculator()
            result = 0
        except:
            result = 1
        finally:
            self.assertEqual(result, 0)

    def test_string_expression(self):
        calc = Calculator("1,2")
        result = calc.expression

        self.assertEqual(result, "1,2")

class AddTestCase(unittest.TestCase):
    def test_null_string(self):
        calc = Calculator()
        result = calc.add()

        self.assertEqual(result, 0)

    def test_single_digit_string(self):
        calc = Calculator("1")
        result = calc.add()

        self.assertEqual(result, 1)

    def test_two_digit_string(self):
        calc = Calculator("1,2")
        result = calc.add()

        self.assertEqual(result, 3)

    def test_spaces_string(self):
        calc = Calculator("      ")
        result = calc.add()

        self.assertEqual(result, 0)

    def test_invalid_string(self):
        calc = Calculator()
        calc.expr = "a,b"

        try:
            result = calc.add()
        finally:
            result = -1

        self.assertEqual(result, -1)




if __name__ == '__main__':
    unittest.main()

# def suite():
#     suite = unittest.TestSuite()
#     suite.addTest(FirstTestCase('runTest'))
#     return suite
