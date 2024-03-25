# Sweet: 🍬 General syntactic sugar

Sweet is a library that provides syntactic sugar, so it's easier to write code, especially if
you come from another programming language!

---

## Examples
```nim
import sweet
import std/math
import options

assert false == !true
assert !true == not true
assert !1 == false
assert !!PI
assert !""
assert !!"hai"

var a = 1
assert (a := 2) == 2
assert a == 2
assert ++a == 3
assert --a == 2
assert +< a == 2  # same as `a++` in C/++
assert a == 3
assert -< a == 3
assert a == 2


const s = @[0,1,2,3]
assert s[0..-1] == s
assert s[1..-2] == @[1, 2]

type A = object of RootObj
let hai = A()
assert hai is A
assert isinstance(hai, A)
assert (hai.instanceof A) # unfortunately we cannot fully mimic JavaScript

let a = some "hai"
let b = none(string)
assert (a ?? "bai") == "hai"
assert b |? "bai" == "bai"
assert a$.len |? 5 == 3  # Only $ has a higher precedence than + % \ /
assert (b?.len) |? 5 == 5

assert 0b11 << 1 == 0b110
assert 0b10 >> 1 == 0b1
assert 3 // 2 == 1

assert 0b11111100 & 0b01010101 == 0b01010100
assert true && true
assert true || false
assert !(false || false)
assert 0b10101010 | 0b01010101 == 0b11111111

assert "Hello, " + "World!" == "Hello, World!"
assert 'H' + "ello, World!" == "Hello, World!"
assert "hai" + @["bai"] == @["hai", "bai"]
assert @["hai"] + @["bai"] == @["hai", "bai"]
```
