module Pangram exposing (..)

import Char exposing (toCode)
import List exposing (map)
import Set exposing (..)
import String exposing (..)

isPangram : String -> Bool
isPangram sentence =
  sentence
    |> String.toLower
    |> String.toList
    |> List.map Char.toCode
    |> Set.fromList
    |> Set.diff (Set.fromList [97..122])
    |> Set.isEmpty
