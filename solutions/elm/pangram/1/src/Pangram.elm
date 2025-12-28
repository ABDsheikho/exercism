module Pangram exposing (isPangram)

import Set exposing (Set)


azSet : Set Char
azSet =
    List.range (Char.toCode 'a') (Char.toCode 'z')
        |> List.map Char.fromCode
        |> Set.fromList


isPangram : String -> Bool
isPangram sentence =
    String.toLower sentence
        |> String.filter Char.isAlpha
        |> String.toList
        |> Set.fromList
        |> Set.size
        |> (==) (Set.size azSet)
