import std/[math, complex, macros]

# --- CALCULATIONS ---
template `++`*[T: Ordinal](expression: var T): T =
  inc expression
  expression

template `--`*[T: Ordinal](expression: var T): T =
  dec expression
  expression

template `+<`*[T: Ordinal](expression: var T): T =
  inc expression
  expression - 1

template `-<`*[T: Ordinal](expression: var T): T =
  dec expression
  expression + 1

template `//`*[T: SomeInteger](denominator, divisor: T): T =
  denominator div divisor

template `%`*[T: SomeInteger](denominator, divisor: T): T =
  denominator mod divisor

template `<<`*[T: SomeInteger](x: T, y: SomeInteger): T =
  x shl y

template `>>`*[T: SomeInteger](x: T, y: SomeInteger): T =
  x shr y

template `&`*[T: SomeInteger](x, y: T): T =
  x and y

template `&&`*(x, y: bool): bool =
  x and y

template `|`*[T: SomeInteger](x, y: T): T =
  x or y

template `||`*(x, y: bool): bool =
  x or y

# xor conflicts with math.`^`
# also `xor` for bool is just `!=`

# template `~`*[T: SomeInteger](x, y: T): T =
#   x not y

# func almostEqual*[T](a, b: Complex[T]): bool =
#   almostEqual(a.re, b.re) and almostEqual(a.im, b.im)

func polar*(x, y: SomeNumber): tuple[r: SomeNumber, phi: float64] =
  ## Polar coordinates from (x, y).
  # See `complex.polar()`
  (r: sqrt(x^2 + y^2), phi: arctan2(y.float64, x.float64))

