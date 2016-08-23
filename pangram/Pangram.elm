module Pangram exposing (..)

import Char exposing (toCode)
import List exposing (map)
import Set exposing (..)
import String exposing (..)


lowerAlphaCodeSet =
    Set.fromList [97..122]


isPangram : String -> Bool
isPangram sentence =
    let
        toLowerCodeSet =
            (\s ->
                s
                    |> String.toLower
                    |> String.toList
                    |> List.map Char.toCode
                    |> Set.fromList
            )

        hasAtLeastOneAlphaCode =
            (\set ->
                set
                    |> Set.diff lowerAlphaCodeSet
                    |> Set.isEmpty
            )
    in
        sentence
            |> toLowerCodeSet
            |> hasAtLeastOneAlphaCode
