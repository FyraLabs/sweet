## Sweet: 🍬 General syntactic sugar
## 
## Sweet is a library that provides syntactic sugar, so it's easier to write code, especially if
## you come from another programming language!
##
## You can submit suggestions on [GitHub](https://github.com/FyraLabs/sweet/issues/new?assignees=madonuko&labels=enhancement&projects=&template=suggestions---feature-requests.md&title=%5BSuggestion%5D+)!
import std/[options, math, complex, macros, sugar]
include sweet/math

# --- STRSEQ ---
template `+`*(x, y: string|char): string =
  x & y

template `+`*[T](x: T, y: seq[T]): seq[T] =
  x & y

template `+`*[T](x: seq[T], y: T): seq[T] =
  x & y

template `+`*[T](x, y: seq[T]): seq[T] =
  x & y


# --- MISC ---
template `:=`*[T](left: var T, right: T): T =
  left = right
  right

template `..-`*(a, b: untyped): untyped =
  a .. ^b

template isinstance*[T: RootObj](a: untyped, b: typedesc[T]): bool =
  a is b

template instanceof*[T](a: untyped, b: typedesc[T]): bool =
  a is b

func `!`*(expression: bool): bool =
  ## Same as `not …`
  ## 
  ## If `expression` is:
  ## - string: `expression.len == 0`
  ## - Option: `expression.isNone`
  ## - SomeNumber: `expression == 0`
  ## - any: `not (cast[bool](expression))`
  not (expression)

func `!`*(expression: string): bool =
  expression.len == 0

func `!`*[T](expression: Option[T]): bool =
  expression.is_none

func `!`*(expression: SomeNumber): bool =
  expression == 0

template `!`*(expression: untyped): bool =
  not (cast[bool](expression))

template `!!`*(expression: untyped): bool =
  ## Same as `not !expression`
  not !expression

macro `?.`*[T](obj: Option[T], attribute: untyped): Option = quote("@") do:
  ## Optional chaining; BUT: operators starting with `?` have a very low precedence level. Use `$.` if you don't want to add `(parentheses)`.
  `@obj`.map(x => x.`@attribute`)

macro `$.`*[T](obj: Option[T], attribute: untyped): Option = quote("@") do:
  ## Optional chaining
  `@obj`.map(x => x.`@attribute`)

template `??`*[T](obj: Option[T], otherwise: T): T =
  ## Nullish coalescing; BUT: operators starting with `?` have a very low precedence level. Use `|?` if you don't want to add `(parentheses)`.
  obj.get otherwise

template `|?`*[T](obj: Option[T], otherwise: T): T =
  ## Nullish coalescing
  obj.get otherwise
