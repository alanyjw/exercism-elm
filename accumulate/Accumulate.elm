module Accumulate exposing (..)

import List exposing (foldr)

accumulate : (a -> a) -> List a -> List a
accumulate mapper list =
  foldr (\item aList -> mapper item :: aList) [] list
