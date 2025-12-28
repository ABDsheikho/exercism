module ArmstrongNumbers exposing (isArmstrongNumber)


isArmstrongNumber : Int -> Bool
isArmstrongNumber nb =
    let
        digits =
            nb
            |> String.fromInt
            |> String.toList
        numberOfDigits = List.length digits
    in
    digits
    |> List.map String.fromChar
    |> List.filterMap String.toInt
    |> List.map (\x -> x^numberOfDigits)
    |> List.sum
    |> (==) nb
