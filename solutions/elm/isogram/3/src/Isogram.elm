module Isogram exposing (isIsogram)

import Set

isIsogram : String -> Bool
isIsogram sentence =
    let
        charList = 
            sentence
            |> String.replace "-" ""
            |> String.replace " " ""
            |> String.toLower
            |> String.toList
    in
    charList
    |> Set.fromList
    |> Set.size
    |> (==) (List.length charList)