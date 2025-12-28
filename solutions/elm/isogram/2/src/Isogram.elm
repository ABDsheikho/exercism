module Isogram exposing (isIsogram)


isIsogram : String -> Bool
isIsogram sentence =
    let
        charList = 
            sentence
            |> String.replace "-" ""
            |> String.replace " " ""
            |> String.toLower
            |> String.toList
            |> List.sort
        charListShift = lastElementFirst charList
    in
    List.map2 (==) charList charListShift
    |> List.member True
    |> (not)


lastElementFirst : List a -> List a
lastElementFirst list =
    let
        rev = List.reverse list 
    in
    case rev of
    [] -> 
        rev
    [_] ->
        rev
    [_, _] ->
        rev
    tail::revBody ->
        tail:: List.reverse revBody