import unittest
import sweet
import std/complex

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

test "complex almostEqual":
  check almostEqual[float64](complex(10.0, 20.0), complex(10.000_000_000_00_001, 20.000_000_000_00_001))

test "polar":
  check polar(10.0, 20.0) == polar(complex(10.0, 20.0))
