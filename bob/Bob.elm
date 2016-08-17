module Bob exposing (..)

import Regex
import String exposing (..)

hey : String -> String
hey statement =
  if isYelling statement then "Whoa, chill out!"
  else if isAsking statement then "Sure."
  else if isSilence statement then "Fine. Be that way!"
  else "Whatever."

isYelling : String -> Bool
isYelling statement =
  Regex.contains (Regex.regex "[A-Za-z]+") statement
    && toUpper statement == statement

isAsking : String -> Bool
isAsking statement =
  endsWith "?" statement

isSilence : String -> Bool
isSilence statement =
  isEmpty(trim statement)

