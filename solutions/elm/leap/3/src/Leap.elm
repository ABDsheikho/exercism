module Leap exposing (isLeapYear)

import Basics exposing (modBy)

isLeapYear : Int -> Bool
isLeapYear year =
    let
        fourYearFlag = (modBy 4 year) == 0 
        centuryFlag = (modBy 100 year) == 0
        fourCenturyFlag = (modBy 400 year) == 0
    in
    case (fourYearFlag, centuryFlag, fourCenturyFlag) of
        (True, False, _) ->
            True
        (_, True, True) ->
            True
        _ ->
            False