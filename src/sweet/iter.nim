import sugar, options

type
  IteratorKind* {.pure.} = enum Root, Convert
  Iterator*[T] = object of RootObj
    case kind: IteratorKind
    of IteratorKind.Root:
      items: ptr UncheckedArray[T]
      len: int
    of IteratorKind.Convert:
      inner: UnwrapIt[T]
      conv: IterConvertable[UnwrapIt[T], T]
  UnwrapIt*[T] = concept X
    Iterator[X] == T
  IterConvertable*[A, B] = concept conv # something like map
    conv.convert(A) is B
  IterCollapsible*[A, B] = concept conv # something like filter_map
    conv.convert(A) is Option[B]
  Map*[A, B] = ref object of RootObj
    inner_map_fn: proc(x: A): B

proc iter*[T](arr: openArray[T]): Iterator[T] =
  if arr.len > 0:
    return Iterator[T](kind: IteratorKind.Root, items: cast[ptr UncheckedArray[T]](arr[0].addr), len: arr.len)
  else:
    return Iterator[T](kind: IteratorKind.Root, items: nil, len: 0)

iterator map_it[T, U, V](it: Iterator[T]): U =
  case it.inner.kind:
  of IteratorKind.Convert:
    for val in it.inner.map_it:
      yield it.conv.convert(val)
  of IteratorKind.Root:
    for i in 0..<it.inner.len:
      yield it.inner.items[i]
proc collect_seq*[T, U](it: Iterator[T]): seq[U] =
  return collect:
    for x in it.map_it: x

# ———————— Separate Implementations ————————
proc convert*[A, B](self: Map, x: A): B =
  self.inner_map_fn(x)
proc map*[T, U](self: Iterator[T], inner_map_fn: T -> U): Iterator[U] =
  Iterator(kind=IteratorKind.Convert, inner=self, conv=Map(inner_map_fn))


proc test =
  assert @[0, 1, 2] == iter(@[1, 2, 3]).map(i => i - 1).collect_seq()
