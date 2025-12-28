module Leap exposing (isLeapYear)

import Basics exposing (modBy)

isLeapYear : Int -> Bool
isLeapYear year =
    if (modBy 4 year) /= 0 then
        False
    else if (modBy 100 year) == 0 && (modBy 400 year) /= 0 then
        False
    else
        True
