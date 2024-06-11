import std/[sugar, macros, locks, sequtils, strutils]
export locks, sequtils, strutils

when compileOption("threads"):
  template newThread*[TArg](tp: TArg -> void, params: TArg): Thread[TArg] =
    var result: Thread[TArg]
    result.createThread(tp, params)

  template newThread*(tp: void -> void): Thread[void] =
    var result: Thread[void]
    result.createThread tp

template lock*(l: Lock, body: untyped) =
  acquire l
  body
  release l
