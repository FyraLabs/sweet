import unittest
import sweet

test "++ and --":
  var a = 2
  check ++a == 3
  check --a == 2
  check +<a == 2  # same as `a++` in C/++
  check a == 3
  check -<a == 3
  check a == 2

test "<< >> //":
  check 0b11 << 1 == 0b110
  check 0b10 >> 1 == 0b1
  check 3 // 2 == 1

test "and or":
  check 0b11111100 & 0b01010101 == 0b01010100
  check true && true
  check true || false
  check !(false || false)
  check 0b10101010 | 0b01010101 == 0b11111111
