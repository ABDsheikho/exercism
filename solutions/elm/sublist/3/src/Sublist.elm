module Sublist exposing (ListComparison(..), sublist)


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist alist blist =
    case 
        ( compare (List.length alist) (List.length blist) 
        , contains alist blist
        , contains blist alist
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

{-| cheak if mainList contains subList
-}
contains : List a -> List a -> Bool
contains subList mainList =
    let
        lengthCheck = 
            List.length subList <= List.length mainList

        valuesCheck = 
            List.map2 (==) subList mainList
                |> List.all identity
    in
    case (mainList, lengthCheck, valuesCheck) of
        (_, False, _) -> 
            False

        (_, _, True) -> 
            True

        ([], _, False) -> 
            False

        (h2::t2, _, False) -> 
            contains subList t2
