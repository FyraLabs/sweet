import unittest

import sweet
import std/math
import options

test "not":
  check false == !true
  check !true == not true
  check !1 == false
  check !!PI
  check !""
  check !!"hai"

test ":=":
  var a = 1
  check (a := 2) == 2
  check a == 2

test "..-":
  var s = @[0,1,2,3]
  check s[0..-1] == s
  check s[1..-2] == @[1, 2]

test "instance":
  type A = object of RootObj
  let hai = A()
  check hai is A
  check isinstance(hai, A)
  check (hai.instanceof A) # unfortunately we cannot fully mimic JavaScript

test "options":
  let a = some "hai"
  let b = none(string)
  check (a ?? "bai") == "hai"
  check b |? "bai" == "bai"
  check a$.len |? 5 == 3
  check (b?.len) |? 5 == 5

test "strs and seqs":
  check "Hello, " + "World!" == "Hello, World!"
  check 'H' + "ello, World!" == "Hello, World!"
  check "hai" + @["bai"] == @["hai", "bai"]
  check @["hai"] + @["bai"] == @["hai", "bai"]
