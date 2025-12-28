module RomanNumerals exposing (toRoman)


toRoman : Int -> String
toRoman number =
    romanLetters
        |> (List.map2 String.repeat <|
                breakDown number specialNumbers []
           )
        |> String.concat


specialNumbers =
    [ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]


romanLetters =
    [ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" ]


breakDown : Int -> List Int -> List Int -> List Int
breakDown number list initalList =
    case list of
        [] ->
            initalList
        head :: reast ->
            initalList ++ [number // head]
                |> breakDown (remainderBy head number) reast
