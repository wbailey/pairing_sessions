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

if __name__ == '__main__':
    unittest.main()

# def suite():
#     suite = unittest.TestSuite()
#     suite.addTest(FirstTestCase('runTest'))
#     return suite
