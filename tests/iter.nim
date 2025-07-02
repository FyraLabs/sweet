import unittest

import sweet, sugar

test "map":
  assert @[0, 1, 2] == iter(@[1, 2, 3]).map(i => i - 1).collect_seq()
