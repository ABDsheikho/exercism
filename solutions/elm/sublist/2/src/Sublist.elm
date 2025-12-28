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
    case 
        ( compare (List.length alist) (List.length blist) 
        , String.contains aString bString
        , String.contains bString aString
        )
    of
        ( EQ, True, True ) ->
            Equal
        ( LT, True, _ ) ->
            Sublist
        ( GT, _, True ) ->
            Superlist
        _ ->
            Unequal
