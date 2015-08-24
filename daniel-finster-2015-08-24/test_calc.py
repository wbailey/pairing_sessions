from calculator import Calculator

calc = Calculator("1,2")

e = calc.expr()

if e == '1,2':
    print "1. Success!"
else:
    print "1. Fail!"

calc.assign("4,5")
e = calc.expr()

if e == '4,5':
    print "2. Success!"
else:
    print "2. Fail!"

try:
    calc = Calculator()
    print "3. Fail!"
except:
    print "3. Success!"

try:
    calc = Calculator("a,b")
    print "4. Fail!"
except:
    print "4: Success!"

try:
    calc = Calculator("a")
    print "5. Fail!"
except:
    print "5. Success!"
