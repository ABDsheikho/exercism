module Sublist exposing (ListComparison(..), sublist)


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


sublist : List Int -> List Int -> ListComparison
sublist alist blist =
    let
        stringIt : List Int -> String
        stringIt list =
            List.map String.fromInt list
                |> String.concat

        aString = stringIt alist
        bString = stringIt blist
    in
    case compare (List.length alist) (List.length blist) of
        EQ ->
            case compare alist blist of
                EQ -> Equal
                _ -> Unequal

        LT ->
            case String.contains aString bString of
                True ->
                    Sublist
                False ->
                    Unequal

        GT ->
            case String.contains bString aString of
                True ->
                    Superlist
                False ->
                    Unequal


