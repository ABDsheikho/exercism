module ArmstrongNumbers exposing (isArmstrongNumber)


isArmstrongNumber : Int -> Bool
isArmstrongNumber nb =
    let
        strNb = String.fromInt nb
        numberOfDigits = String.length strNb
    in
    strNb
    |> String.toList
    |> List.map String.fromChar
    |> List.filterMap String.toInt
    |> List.map (\x -> x^numberOfDigits)
    |> List.sum
    |> (==) nb
