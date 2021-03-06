from calculator import Calculator

calc = Calculator("1,2")

e = calc.expr()

if e == '1,2':
    print "1. Success!"
else:
    print "1. Fail!"

calc.expr:x("4,5")
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

calc = Calculator("1,2")
if calc.add() == 3:
    print "6. Success!"
else:
    print "6. Fail!"

calc = Calculator("")
if calc.add() == 0:
    print "7. Success!"
else:
    print "7. Fail!!"

calc = Calculator("1")
if calc.add() == 1:
    print "8. Success!"
else:
    print "8. Fail!!"

calc = Calculator("1,2,3")
if calc.add() == 6:
    print "9. Success!"
else:
    print "9. Fail!!"

calc = Calculator("1,2,3,4,5,6")
if calc.add() == 21:
    print "10. Success!"
else:
    print "10. Fail!!"

calc.expr("1,0")
if calc.diff() == 1:
    print "11. Success!"
else:
    print "11. Fail!!"

c = Calculator("3,2,1")
if c.diff() == 0:
    print "12. Success"
else:
    print "12. Fail!!"

a = Calculator("5,4,3,2,1")
if a.diff() == -5:
    print "13. Success"
else:
    print "13. Fail!!"
