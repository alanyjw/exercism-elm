module Triangle exposing (..)

import List exposing (..)

type Triangle = Equilateral | Isosceles | Scalene

violatesInequality : Float -> Float -> Float -> Bool
violatesInequality first second third =
  let
    decreasingOrder = reverse (sort [first, second, third])
  in
    case decreasingOrder of
      [] -> True
      [item] -> True
      head::tail -> sum tail <= head

hasInvalidLengths : Float -> Float -> Float -> Bool
hasInvalidLengths first second third =
  any (\n -> n <= 0) [first, second, third]

isEquilateral : Float -> Float -> Float -> Bool
isEquilateral first second third =
  first == second && second == third

isIsosceles : Float -> Float -> Float -> Bool
isIsosceles first second third =
  first == second || second == third || first == third

triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind first second third =
  if hasInvalidLengths first second third then
    Err "Invalid lengths"
  else if violatesInequality first second third then
    Err "Violates inequality"
  else if isEquilateral first second third then
    Ok Equilateral
  else if isIsosceles first second third then
    Ok Isosceles
  else
    Ok Scalene
