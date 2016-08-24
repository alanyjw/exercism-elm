module Accumulate exposing (..)

accumulate : (a -> a) -> List a -> List a
accumulate mapper list =
  case list of
    head::tail ->
      (mapper head) :: (accumulate mapper tail)
    [] ->
      list
