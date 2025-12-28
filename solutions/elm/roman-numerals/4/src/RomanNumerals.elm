module RomanNumerals exposing (toRoman)


toRoman : Int -> String
toRoman number =
    romanLetters
        |> (List.map2 String.repeat <|
                breakDown number specialNumbers
           )
        -- List.map2 String.repeat resultFromBreakDown romanLetters
        |> String.concat


specialNumbers =
    [ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]


romanLetters =
    [ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" ]


{-
    the following `breakDown` works as if it's was writen as: 
    **Iteration 3**
    
    breakDown : Int -> List Int -> List Int -> List Int
    breakDown number list initalList =
        case list of
            [] ->
                initalList
            head :: reast ->
                initalList ++ [number // head]
                    |> breakDown (remainderBy head number) reast
    
    breakDown 3999 specialNumbers []
-}


breakDown : Int -> List Int -> List Int
breakDown number list =
    let
        remainderNumber = 
            List.head 
                >> Maybe.andThen (\(_, x) -> Just x) 
                >> Maybe.withDefault number
        init : List (Int, Int)
        init = []
    in
    List.foldl
        (\headVal acc ->
            [ ( (remainderNumber acc) // headVal
              , remainderBy headVal (remainderNumber acc) 
              )
            ] ++ acc
        )
        init
        list
        |> List.map Tuple.first
        |> List.reverse

