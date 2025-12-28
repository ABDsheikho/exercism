module LargestSeriesProduct exposing (largestProduct)


largestProduct : Int -> String -> Maybe Int
largestProduct span series =
    case ( span > 0, String.all Char.isDigit series ) of
        ( _, False ) ->
            Nothing
        ( False, _ ) ->
            Nothing
        _ ->
            listPossibleSeries span series
                |> List.map toDigits
                |> List.map List.product
                |> List.maximum


toDigits : String -> List Int
toDigits =
    String.split ""
        >> List.filterMap String.toInt


listPossibleSeries : Int -> String -> List String
listPossibleSeries span series =
    if span > String.length series then
        []
    else
        String.dropLeft 1 series
            |> listPossibleSeries span
            |> (::) (String.slice 0 span series)
