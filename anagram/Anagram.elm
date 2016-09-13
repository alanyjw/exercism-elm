module Anagram exposing (..)

import List exposing (sort)
import String exposing (split,toLower)

isAnagram : String -> String -> Bool
isAnagram first second =
  let
      lowercasedFirst = toLower first
      lowercasedSecond = toLower second
      sortChars = \s -> sort (split "" s)
  in
      lowercasedFirst /= lowercasedSecond &&
        (sortChars lowercasedFirst) == (sortChars lowercasedSecond)

detect : String -> List String -> List String
detect word listOfWords =
  case listOfWords of
    [] -> []
    head::tail ->
      if isAnagram word head then
        head :: detect word tail
      else
        detect word tail
