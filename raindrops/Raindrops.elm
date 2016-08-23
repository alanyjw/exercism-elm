module Raindrops exposing (..)

import List exposing (..)
import String exposing (..)

divides : Int -> Int -> Bool
divides dividend divisor =
  dividend % divisor == 0

pling : Int -> String
pling number =
  if number `divides` 3 then "Pling" else ""

plang : Int -> String
plang number =
  if number `divides` 5 then "Plang" else ""

plong : Int -> String
plong number =
  if number `divides` 7 then "Plong" else ""

default : Int -> String
default number =
  if not (number `divides` 3) && not (number `divides` 5) && not (number `divides` 7) then
    toString number
  else
    ""

raindrops : Int -> String
raindrops number =
  pling number ++ plang number ++ plong number ++ default number
